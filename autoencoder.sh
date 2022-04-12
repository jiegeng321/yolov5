python3 ./train.py \
        --weights /data01/xu.fx/yolov5/runs/train/comb_776bs_1376ks_2nd/weights/best.pt \
        --hyp ./data/hyps/hyp.finetune.yaml \
        --batch-size 160 \
        --epoch 130 \
        --imgsz 640 \
        --data ./data/comb_776bs_1376ks.yaml \
        --name comb_776bs_1376ks_base_m \
        --device 0,1,2,3 \
        --workers 16 \
        --patience 10 \
        --noval \
        --save-period 5 \
        --exist-ok \
        --sync-bn \
        #--cache disk \
        #--freeze 10 \



#--hyp ./data/hyp.finetune.yaml \
#--resume /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt \
#--weights /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt  \
#--notest \
