#!/usr/bin/python3
'''
author: Tobias Weis

Pixels can only be on or off - 
one bit is one pixel -> one byte is 8 pixels!
'''

import sys,os
import math
import time
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import cv2

w,h=200,200

imgfname = "timage.png"
img = cv2.imread(imgfname)
img = cv2.resize(img, (w,h))

img_black = np.ones((w,h), np.uint8) * 255
img_red = np.ones((w,h), np.uint8) * 255

for x in range(img.shape[1]):
    for y in range(img.shape[0]):
        if img[y,x,0] < 64 and img[y,x,1] < 64 and img[y,x,2] < 64:
            img_black[y,x] = 0

        if img[y,x,2] > img[y,x,1] and img[y,x,2] > img[y,x,0]:
            img_red[y,x] = 0

#img_black[img[:,:] == [0,0,0]] = 0
#img_red[(img[:,:,0] > 255) & (img[:,:,1] == 0) & (img[:,:,2] == 0)] = 0

# test-image
"""
img = np.ones((w,h,3), np.uint8) * 255
img[:100,:,2] = 0
img[100:200,:,0] = 0
"""

display_image = np.ones((w,h,3), np.uint8) * 255
display_image[img_black == 0] = [0,0,0]
display_image[img_red == 0] = [0,0,255]

cv2.imshow("black", display_image)
cv2.waitKey()


for img, suffix in zip([img_black, img_red], ["black","red"]):
    outimg = np.zeros((w,h), bool)
    outimg[img > 0] = True

    # write cpp
    outfilename = open(imgfname.split(".")[0] + "_" + suffix + ".h", "w+")
    outfilename.write("#include <pgmspace.h>\n")
    outfilename.write("const unsigned char IMAGE_DATA_"+suffix+"[] PROGMEM = {\n")

    cnt = 0
    bytestring = ""
    for x in range(outimg.shape[1]):
        for y in range(outimg.shape[0]):
            bytestring += "%d" % outimg[y,x]

            if len(bytestring) == 8:
                outfilename.write(hex(int(bytestring, 2))+",")
                cnt += 1
                bytestring = ""

            if cnt == 16:
                outfilename.write("\n")
                cnt = 0
    outfilename.write("\n};")
    outfilename.close()
