0 coco-anno 标注好 200个图片，coco export为一个长json coco-200-info.json ,其中 加上 info , lisence

(tf290) C:\pyOCR\pycharm\Anaconda3\envs\tf290\models\research\object_detection\tf2_object_detection_training_demo\testother>pip install funcy
1 分两次得三个 json
python 1cocosplit.py --having-annotations -s 0.8 coco-200-info.json train.json valtest.json

python 1cocosplit.py --having-annotations -s 0.5 valtest.json val.json test.json


2 移动图片三次

python 3pickUsedtestImg.py

python 3pickUsedvalImg.py

python 3pickUsedtrainImg.py


              2dataset_mean_std 不用了，直接 record


3 4create_coco_tf_record.py 中追后20行中改好数量 num_shards=   和图片数量一致

python 4create_coco_tf_record.py --logtostderr 
--train_image_dir="train2017" 
--val_image_dir="val2017" 
--test_image_dir="test2017" 
--train_annotations_file="annotations/train.json" 
--val_annotations_file="annotations/val.json" 
--testdev_annotations_file="annotations/test.json" 
--output_dir="output"

output 中有若干record ok