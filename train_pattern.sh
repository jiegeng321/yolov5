#kernprof -l -v \
python3 -m torch.distributed.launch \
        --nproc_per_node=4 \
        --master_port=$((RANDOM + 20000)) \
        ./train.py \
        --weights /data01/xu.fx/yolov5v6.0/yolov5/runs/train/yolodataset_pattern_15bs_22ks3/weights/best.pt \
        --hyp ./data/hyps/hyp.finetune_pattern.yaml \
        --batch-size 256 \
        --epoch 70 \
        --imgsz 640 \
        --data ./data/yolodataset_pattern_15bs_22ks.yaml \
        --name tmp \
        --device 0,1,2,3 \
        --workers 4 \
        --patience 10 \
        --noval \
        --save-period 10 \
        --exist-ok \
        --freeze 10 \
        #--cache disk \
        #--label-smoothing 0.1
        #--sync-bn \


#python3 -m torch.distributed.launch \
#        --nproc_per_node=4 \
#        --master_port=$((RANDOM + 20000)) \
#yolodataset_pattern_15bs_22ks_tmp
#--hyp ./data/hyp.finetune.yaml \
#--resume /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt \
#--weights /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt  \
#--notest \
