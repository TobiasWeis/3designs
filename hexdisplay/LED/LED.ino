#include <ESP8266WiFi.h>
#include <ESP8266Ping.h>
#include <WiFiClient.h>
#include <WiFiClientSecure.h>
#include <HttpClient.h>
#include "timage_black.h"
#include "timage_red.h"

#ifndef STASSID
#define STASSID "FBISurveillanceVan13"
#define STAPSK  "b3steWGev4"
#endif

const char* ssid     = STASSID;
const char* password = STAPSK;

// SHA-1 Fingerprint für evtek-website (aus browser)
const char evtek_webapp_fingerprint[] PROGMEM = "DB 6B 9E 0C 41 F1 05 ED 01 26 B4 FE 55 29 FF EC 74 A7 F6 FF";
const char evtek_webapp_prod_fingerprint[] PROGMEM = "BD 0C 37 1C 00 2F 2B 30 00 3F 82 13 D2 82 1D B7 0D 7A 3D A6";

#include <Adafruit_NeoPixel.h>
#include <GxEPD.h>
#include <GxGDEW0154Z04/GxGDEW0154Z04.h>  // 1.54" b/w/r 200x200

// FreeFonts from Adafruit_GFX
#include <Fonts/FreeMonoBold9pt7b.h>
#include <Fonts/FreeMonoBold12pt7b.h>
#include <Fonts/FreeMonoBold18pt7b.h>
#include <Fonts/FreeMonoBold24pt7b.h>

#include <GxIO/GxIO_SPI/GxIO_SPI.h>
#include <GxIO/GxIO.h>

GxIO_Class io(SPI, D3, D2, D8); 
GxEPD_Class display(io, D8, D4); 

Adafruit_NeoPixel strip = Adafruit_NeoPixel(34, D1, NEO_GRB + NEO_KHZ800);
int NUM_LEDS = strip.numPixels();

int lastindex = 0;
byte randLEDNumber = 0;

uint32_t green = strip.Color(0,255,0);
uint32_t red = strip.Color(255,0,0);

const int num_servers = 4;
bool states[num_servers] = {false, false, false, false};
bool last_states[num_servers] = {false, false, false, false};
String lines[num_servers+1] = {"Server1", "Server2", "Server3", "Server4", "Status"};

int cnt = 0;

void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Start");

  /* wifi verbinden */
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  /* LEDs starten */
  strip.begin();
  strip.setBrightness(60);
  strip.show(); // Initialize all pixels to 'off'

  //Begrüßung mit ein Effekt.
  NewKITT(0xff, 0, 0, 8, 10, 50);

  display.init(115200); // enable diagnostic output on Serial
  display.setRotation(3);
}

void show_rocket(){
  display.drawPicture(IMAGE_DATA_black, IMAGE_DATA_red, sizeof(IMAGE_DATA_black), sizeof(IMAGE_DATA_red));
}

void show_server_stats(){
    display.fillScreen(GxEPD_WHITE);
    display.setTextColor(GxEPD_BLACK);
    //display.setTextColor(GxEPD_RED);
    //display.setFont(&FreeMonoBold9pt7b);
    display.setFont(&FreeMonoBold12pt7b);
    display.setCursor(0, 0);
    display.println();
    display.println(" -= Servers =-");
    display.println();

    for(int i=0;i<(num_servers+1);i++){
      display.println(" " + lines[i]);
    }
    
    //display.setFont(&FreeMonoBold9pt7b);
    display.println();
    // 14 characters at fontsize 12 per line
    char buffer[14];
    if(cnt < 10){ // 1 digit
      sprintf(buffer, "             %d", cnt);
    }else if((cnt >=10) and (cnt < 100)){
      sprintf(buffer, "            %d", cnt);
    }else if((cnt >= 100) and (cnt < 1000)){
      sprintf(buffer, "           %d", cnt);
    }else if((cnt >= 1000) and (cnt < 10000)){
      sprintf(buffer, "          %d", cnt);
    }else if((cnt >= 10000) and (cnt < 100000)){
      sprintf(buffer, "         %d", cnt);
    }else if((cnt >= 100000) and (cnt < 1000000)){
      sprintf(buffer, "        %d", cnt);
    }
    display.println(buffer);
    
    display.update();
}

void loop() {
  bool error = false;

  if (WiFi.status() == WL_CONNECTED) { //Check WiFi connection status
    WiFiClient client;
    WiFiClientSecure httpsClient;
    httpsClient.setFingerprint(evtek_webapp_fingerprint);
    httpsClient.setTimeout(5000);
    
    HttpClient http(client);  //Declare an object of class HTTPClient
    
    lines[num_servers] = "";

    int line = 0;

    //********************* Evtek check website ***************/
    // SHA-1 fingerprint (extracted from browser): 9A AE C3 C1 FB 98 F4 1B B2 9B B3 98 1D 15 CF 1A 60 9B F4 35
    if (httpsClient.connect("evtek.ddns.me", 443)){
      states[line] = true;
      lines[line] = "U WebApp";
    }else{
      states[line] = false;
      lines[line] = "D WebApp";
      error = true;
    }
    httpsClient.stop();   //Close connection

    line++;

    //********************* Evtek check public website ***************/
    httpsClient.setFingerprint(evtek_webapp_prod_fingerprint);
    // SHA-1 fingerprint (extracted from browser): 9A AE C3 C1 FB 98 F4 1B B2 9B B3 98 1D 15 CF 1A 60 9B F4 35
    if (httpsClient.connect("evtek.co", 443)){
      states[line] = true;
      lines[line] = "U WebApp-Prod";
    }else{
      states[line] = false;
      lines[line] = "D WebApp-Prod";
      error = true;
    }
    httpsClient.stop();   //Close connection    

    line++;
    

    //********************* Interface-Server check website ***************/
    int ret = http.get("interface.evtek.ddns.me", "/version/");
    int httpCode = http.responseStatusCode();
    if (ret == 0 && httpCode == 200) { //Check the returning code
      states[line] = true;
      lines[line] = "U IFS";
    }else{
      states[line] = false;
      char buffer[30];
      sprintf(buffer, "D IFS (%d)",httpCode);
      lines[line] = buffer;
      error = true;
    }
    http.stop();   //Close connection

    line++;

    //********************* MLRuntimeSystem check website ***************/
    ret = http.get("mlruntimesystem.ddns.net", 5002, "/");  //Specify request destination
    httpCode = http.responseStatusCode();
    if (ret== 0 && httpCode == 401) { // this one has basicAuth enabled
      states[line] = true;
      lines[line] = "U Eve-1";
    }else{
      states[line] = false;
      char buffer[30];
      sprintf(buffer, "D Eve-1 (%d)",httpCode);
      lines[line] = buffer;
      error = true;
    }
    http.stop();
    
  }else{ // if wifi not connected
    error = true;
    lines[num_servers] = "NO WIFI";
  }

  bool something_changed = false;
  for(int i=0;i<num_servers;i++){
    if(states[i] != last_states[i]){
      something_changed = true;
      last_states[i] = states[i];
    }
  }

  //if(something_changed){}
  
  //if(cnt % 2 == 0 || error){
    show_server_stats();
  //}else{
  //  show_rocket();
  //}
  cnt++;

  if(error){
    strip.fill(red, 0, 50);
    strip.show();
  }else{
    rainbowCycle_bg(250); // delay * 256 * 2 Ms = overall duration of function
  }
}
