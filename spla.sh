#! /bin/bash

# Check if mandatory arguments are correctly given
if [ ! $# -eq 3 ]; then
  echo "usage: ./spla.sh splahscreen file folder" >&2
  echo "       ./spla.sh icon file folder" >&2
  exit 1
fi

# Check if ImageMagick is installed
if [ ! -x $(which convert) ]; then
  echo "Please install imagemagick tools." >&2
  exit 2
fi

# Create output folders if it does not exist
mkdir -p $3/android/drawable
mkdir -p $3/android/drawable-hdpi
mkdir -p $3/android/drawable-ldpi
mkdir -p $3/android/drawable-mdpi
mkdir -p $3/android/drawable-xhdpi
mkdir -p $3/ios

case $1 in
  "splashscreen")
    # Android
    convert $2 -resize 720x960^ -gravity center -extent 720x960 $3/android/drawable/splash.png
    convert $2 -resize 480x640^ -gravity center -extent 480x640 $3/android/drawable-hdpi/splash.png
    convert $2 -resize 320x426^ -gravity center -extent 320x426 $3/android/drawable-ldpi/splash.png
    convert $2 -resize 320x470^ -gravity center -extent 320x470 $3/android/drawable-mdpi/splash.png
    convert $2 -resize 720x960^ -gravity center -extent 720x960 $3/android/drawable-xhdpi/splash.png

    # iOS
    convert $2 -resize 640x1136^  -gravity center -extent 640x1136  $3/ios/Default-568h@2x~iphone.png
    convert $2 -resize 2048x1536^ -gravity center -extent 2048x1536 $3/ios/Default-Landscape@2x~ipad.png
    convert $2 -resize 1024x768^  -gravity center -extent 1024x768  $3/ios/Default-Landscape~ipad.png
    convert $2 -resize 1536x2016^ -gravity center -extent 1536x2016 $3/ios/Default-Portrait@2x~ipad.png
    convert $2 -resize 768x1024^  -gravity center -extent 768x1024  $3/ios/Default-Portrait~ipad.png
    convert $2 -resize 640x960^   -gravity center -extent 640x960   $3/ios/Default@2x~iphone.png
    convert $2 -resize 320x480^   -gravity center -extent 320x480   $3/ios/Default~iphone.png
    ;;

  "icon")
    # Android
    convert $2 -resize 96x96^ -gravity center -extent 96x96 $3/android/drawable/icon.png
    convert $2 -resize 72x72^ -gravity center -extent 72x72 $3/android/drawable-hdpi/icon.png
    convert $2 -resize 36x36^ -gravity center -extent 36x36 $3/android/drawable-ldpi/icon.png
    convert $2 -resize 48x48^ -gravity center -extent 48x48 $3/android/drawable-mdpi/icon.png
    convert $2 -resize 96x96^ -gravity center -extent 96x96 $3/android/drawable-xhdpi/icon.png

    # iOS
    convert $2 -resize 40x40^     -gravity center -extent 40x40     $3/ios/icon-40.png
    convert $2 -resize 50x50^     -gravity center -extent 50x50     $3/ios/icon-50.png
    convert $2 -resize 60x60^     -gravity center -extent 60x60     $3/ios/icon-60.png
    convert $2 -resize 72x72^     -gravity center -extent 72x72     $3/ios/icon-72.png
    convert $2 -resize 76x76^     -gravity center -extent 76x76     $3/ios/icon-76.png
    convert $2 -resize 29x29^     -gravity center -extent 29x29     $3/ios/icon-small.png
    convert $2 -resize 57x57^     -gravity center -extent 57x57     $3/ios/icon.png

    convert $2 -resize 80x80^     -gravity center -extent 80x80     $3/ios/icon-40@2x.png
    convert $2 -resize 100x100^   -gravity center -extent 100x100   $3/ios/icon-50@2x.png
    convert $2 -resize 120x120^   -gravity center -extent 120x120   $3/ios/icon-60@2x.png
    convert $2 -resize 144x144^   -gravity center -extent 144x144   $3/ios/icon-72@2x.png
    convert $2 -resize 152x152^   -gravity center -extent 152x152   $3/ios/icon-76@2x.png
    convert $2 -resize 58x58^     -gravity center -extent 58x58     $3/ios/icon-small@2x.png
    convert $2 -resize 114x114^   -gravity center -extent 114x114   $3/ios/icon@2x.png
    ;;
esac
