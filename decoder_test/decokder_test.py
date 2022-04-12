#!/usr/local/bin/python3
# -*- coding:utf-8 -*-
"""
@author: xu.feng
@contact: xfeng_zjut@163.com
"""
import time

import PIL
import cv2
from pathlib import Path
from PIL import Image
from line_profiler import LineProfiler
import numpy as np
import ctypes, os
libpath = os.path.join(os.path.dirname(__file__), "libjpeg.so")
ctypes.CDLL(libpath)
jpeg_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/jpeg").rglob("*.jpeg")]
jpg_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/jpg").rglob("*.jpg")]
png_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/png").rglob("*.png")]
#print(cv2.getBuildInformation())
#time_test = []
@profile
def load_image_cv(img_list,times):
    #cv2.setNumThreads(1)
    for i in range(times):
        for img in img_list:
            #start = time.time()
            im = cv2.imread(str(img))
            #time_test.append(1000000*(time.time()-start))
            h0, w0 = im.shape[:2]
            r = 640 / max(h0, w0)
            if r != 1:  # if sizes are not equal
                im = cv2.resize(im, (int(w0 * r), int(h0 * r)),
                                interpolation=cv2.INTER_LINEAR)
            im = im[:, :, ::-1]

@profile
def load_image_pil(img_list,times):
    for i in range(times):
        for img in img_list:
            im = Image.open(str(img))
            #print(im.layers)
            if im.layers!=3:
                im = im.convert("RGB")
            h0, w0 = im.size[:2]
            r = 640 / max(h0, w0)
            if r != 1:  # if sizes are not equal
                im = im.resize((int(w0 * r), int(h0 * r)), resample=Image.BILINEAR)
            im = np.asarray(im)
            #print(PIL.features.pilinfo())

load_image_cv(png_imgs[:],10)
# print(np.sum(time_test),np.mean(time_test))
load_image_pil(png_imgs[:],10)




