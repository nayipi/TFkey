import json
import  os
import shutil

imgSrcPath = 'datasets/fingerups/'
imgDstPath = 'test2017/'
annotationsFile = 'annotations/test.json'


def main():
    with open(annotationsFile, 'rt', encoding='UTF-8') as annotations:
        coco = json.load(annotations)
        info = coco['info']
        licenses = coco['licenses']
        images = coco['images']
        annotations = coco['annotations']
        categories = coco['categories']

        usedImgPath =  []
        for imagesObj in images:
            imgPath = imagesObj['path']
            imgName = imgPath.split('/')[3]
            print(f'imgPath: {imgPath}')
            print(f'imgName: {imgName}')

            srcPath = imgSrcPath + imgName
            if os.path.exists(srcPath):
                dstPath = imgDstPath + imgName
                shutil.move(srcPath, dstPath)
                print(f'dstPath: {dstPath} copy success')
            else:
                print(f'srcPath: {srcPath} not exist' )

            print('------')

            





if __name__ == "__main__":
    main()
 