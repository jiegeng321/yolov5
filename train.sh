python3 -m torch.distributed.launch \
        --nproc_per_node=4 \
        --master_port=$((RANDOM + 20000)) \
        ./train.py \
        --resume /data01/xu.fx/yolov5v6.0/yolov5/runs/train/yolodataset_logo_784bs_1393ks_l_0808/weights/last.pt \
#        --hyp ./data/hyps/hyp.finetune.yaml \
#        --batch-size 128 \
#        --epoch 70 \
#        --imgsz 640 \
#        --data ./data/yolodataset_logo_784bs_1392ks.yaml \
#        --name yolodataset_logo_784bs_1392ks_base_l_3 \
#        --device 0,1,2,3 \
#        --workers 16 \
#        --patience 10 \
#        --noval \
#        --save-period 5 \
#        --exist-ok \
#        --sync-bn \
#        --freeze 10 \
        #--cache disk \




#--hyp ./data/hyp.finetune.yaml \
#--resume /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt \
#--weights /data01/xu.fx/yolov5/runs/train/comb_364bs_634ks/weights/last.pt  \
#--notest \
