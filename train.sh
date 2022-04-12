python3 -m torch.distributed.launch \
        --nproc_per_node=4 \
        --master_port=$((RANDOM + 20000)) \
        ./train.py \
        --resume /data01/xu.fx/yolov5v6.0/yolov5/runs/train/comb_776bs_1376ks_base_m/weights/last.pt \
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
