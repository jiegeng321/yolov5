#!/usr/local/bin/python3
# -*- coding:utf-8 -*-
"""
@author: xu.feng
@contact: xfeng_zjut@163.com
"""
import time

import PIL
import cv2
import features
from pathlib import Path
from PIL import Image#, features
from line_profiler import LineProfiler
import numpy as np
import ctypes, os
#libpath = os.path.join("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test", "libjpeg.so.9.2.0")
#print(libpath)
#ctypes.CDLL(libpath)
jpeg_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/jpeg").rglob("*.jpeg")]
jpg_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/jpg").rglob("*.jpg")]
png_imgs = [i for i in Path("/data01/xu.fx/yolov5v6.0/yolov5/decoder_test/png").rglob("*.png")]
#print(cv2.getBuildInformation())
#features.pilinfo()
#print(features.get_supported_codecs())
#print(Image._getdecoder("RGB","jpeg",".so"))
#time_test = []
@profile
def load_image_cv(img_list,times):
    #cv2.setNumThreads(0)
    #print(cv2.getNumThreads())
    for i in range(times):
        for img in img_list:
            im = cv2.imread(str(img))
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
            if im.mode!="RGB":
                im = im.convert("RGB")
            h0, w0 = im.size[:2]
            r = 640 / max(h0, w0)
            if r != 1:  # if sizes are not equal
                im = im.resize((int(w0 * r), int(h0 * r)), resample=Image.BILINEAR)
            im = np.asarray(im)

#load_image_cv(jpg_imgs[:]+png_imgs[:]+jpeg_imgs[:],50)
#load_image_cv(png_imgs[:],100)
load_image_pil(png_imgs[:],20)




