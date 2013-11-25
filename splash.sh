#! /bin/bash

# Check if mandatory arguments are correctly given
if [ ! $# -eq 2 ]; then
  echo "usage: ./splash.sh file folder" >&2
  exit 1
fi

# Check if ImageMagick is installed
if [ ! -x $(which convert) ]; then
  echo "Please install imagemagick tools." >&2
  exit 2
fi

# Create output folders if it does not exist
mkdir -p $2/android/drawable
mkdir -p $2/android/drawable-hdpi
mkdir -p $2/android/drawable-ldpi
mkdir -p $2/android/drawable-mdpi
mkdir -p $2/android/drawable-xhdpi
mkdir -p $2/ios

# Android
convert $1 -resize 720x960^ -gravity center -extent 720x960 $2/android/drawable/splash.png
convert $1 -resize 480x640^ -gravity center -extent 480x640 $2/android/drawable-hdpi/splash.png
convert $1 -resize 320x426^ -gravity center -extent 320x426 $2/android/drawable-ldpi/splash.png
convert $1 -resize 320x470^ -gravity center -extent 320x470 $2/android/drawable-mdpi/splash.png
convert $1 -resize 720x960^ -gravity center -extent 720x960 $2/android/drawable-xhdpi/splash.png

# iOS
convert $1 -resize 640x1136^  -gravity center -extent 640x1136  $2/ios/Default-568h@2x~iphone.png
convert $1 -resize 2048x1536^ -gravity center -extent 2048x1536 $2/ios/Default-Landscape@2x~ipad.png
convert $1 -resize 1024x768^  -gravity center -extent 1024x768  $2/ios/Default-Landscape~ipad.png
convert $1 -resize 1536x2016^ -gravity center -extent 1536x2016 $2/ios/Default-Portrait@2x~ipad.png
convert $1 -resize 768x1024^  -gravity center -extent 768x1024  $2/ios/Default-Portrait~ipad.png
convert $1 -resize 640x960^   -gravity center -extent 640x960   $2/ios/Default@2x~iphone.png
convert $1 -resize 320x480^   -gravity center -extent 320x480   $2/ios/Default~iphone.png
