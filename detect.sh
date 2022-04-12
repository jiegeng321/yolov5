python3 /data01/xu.fx/yolov5v6.0/yolov5/detect.py \
        --weights /data01/xu.fx/yolov5v6.0/yolov5/runs/train/comb_776bs_1376ks_base_m/weights/last.pt \
        --source /data01/xu.fx/dataset/LOGO_DATASET/test_small_count/test \
        --imgsz 640 \
        --conf-thres 0.5 \
        --iou-thres 0.5 \
        --device 3 \
        --name tmp \
        --save-txt \
        --save-conf \
        --save-crop
#--visualize \
#--view-img \