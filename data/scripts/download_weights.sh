#!/bin/bash
# YOLOv5 🚀 by Ultralytics, GPL-3.0 license
# Download latest models from https://github.com/ultralytics/yolov5/releases
# Example usage: bash path/to/download_weights.sh
# parent
# └── yolov5
#     ├── yolov5s.pt  ← downloads here
#     ├── yolov5m.pt
#     └── ...
#'s', 'm', 'l', 'x'
python - <<EOF
from utils.downloads import attempt_download

for x in ['n','n6']:
    attempt_download(f'yolov5{x}.pt')

EOF
