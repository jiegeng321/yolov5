#kernprof -l -v \
python3 -m torch.distributed.launch \
        --nproc_per_node=4 \
        --master_port=$((RANDOM + 20000)) \
        ./train.py \
        --weights /data01/xu.fx/yolov5v6.0/yolov5/runs/train/yolodataset_pattern_15bs_22ks_0324/weights/last.pt \
        --hyp ./data/hyps/hyp.finetune.yaml \
        --batch-size 160 \
        --epoch 80 \
        --imgsz 640 \
        --data ./data/yolodataset_logo_784bs_1392ks.yaml \
        --name yolodataset_logo_784bs_1392ks \
        --device 0,1,2,3 \
        --workers 16 \
        --patience 10 \
        --noval \
        --save-period 10 \
        --exist-ok \
        --freeze 10 \
        --sync-bn \
        #--cache disk \
        #--label-smoothing 0.1



#python3 -m torch.distributed.launch \
#        --nproc_per_node=4 \
#        --master_port=$((RANDOM + 20000)) \
#yolodataset_pattern_15bs_22ks_tmp
#--hyp ./data/hyp.finetune.yaml \
#--resume /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt \
#--weights /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt  \
#--notest \
