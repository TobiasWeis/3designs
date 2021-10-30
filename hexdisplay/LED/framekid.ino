
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  
  if(WheelPos < 85) {
    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
}

uint32_t bgWheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  
  if(WheelPos < 85) {
    return strip.Color(0, 0, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return strip.Color(0, 255 - WheelPos * 3, 0);
}


void setPixelHeatColor (int Pixel, byte temperature) {
  // Scale 'heat' down from 0-255 to 0-191
  byte t192 = round((temperature/255.0)*191);
 
  // calculate ramp up from
  byte heatramp = t192 & 0x3F; // 0..63
  heatramp <<= 2; // scale up to 0..252
 
  // figure out which third of the spectrum we're in:
  if( t192 > 0x80) {                     // hottest
    setPixel(Pixel, heatramp, 255, 255);
  } else if( t192 > 0x40 ) {             // middle
    setPixel(Pixel, 0, heatramp, 255);
  } else {                               // coolest
    setPixel(Pixel, 0, 255, 0);
  }
}

//Übersetzer von FASTLED

void showStrip() {

   // NeoPixel
   strip.show();

}

void setPixel(int Pixel, byte red, byte green, byte blue) {

   // NeoPixel
   strip.setPixelColor(Pixel, strip.Color(red, green, blue));
 
}

void setAll(byte red, byte green, byte blue) {
  for(int i = 0; i < NUM_LEDS; i++ ) {
    setPixel(i, red, green, blue); 
  }
  showStrip();
}
