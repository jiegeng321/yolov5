python3 /data01/xu.fx/yolov5v6.0/yolov5/export.py \
	--weights /data01/xu.fx/yolov5v6.0/yolov5/runs/train/yolodataset_shoes_bag_2bs_2ks_0907/weights/last.pt \
	--include onnx \
	--img 640 \
	--batch 1 \
	--opset 13 \
#	--train \
#  --simplify
	#--weights /data01/xu.fx/yolov5v6.0/yolov5/runs/train/yolodataset_logo_784bs_1393ks_l_0808/weights/last.pt \