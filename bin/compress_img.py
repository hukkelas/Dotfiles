#!/usr/bin/env python
import argparse
import shutil
from PIL import Image
parser = argparse.ArgumentParser()
parser.add_argument("image_path")
parser.add_argument("-size", default=1)
args = parser.parse_args()

shutil.copy(args.image_path, args.image_path+".old")
im = cv2.imread(args.image_path)
im = cv2.resize(im, fx=args.size, fy=args.size)
cv2.imwrite(args.image_path, im)