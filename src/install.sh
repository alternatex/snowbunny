#!/bin/bash

# home sweet home (liar)
base=`pwd`

# settings (some)
nodewebkitversion="v0.5.0"
nodewebkit="node-webkit-${nodewebkitversion}-osx-ia32.zip"

# fetch node-webkit prebuilt binaries
curl -O "https://s3.amazonaws.com/node-webkit/${nodewebkitversion}/${nodewebkit}" 
unzip $nodewebkit && rm -rf $nodewebkit 
mv node-webkit.app snowbunny.app 

# cleanup 
rm -rf nwsnapshot

# inject snowbunny sources
mkdir -p snowbunny.app/Contents/Resources/app.nw 
mkdir ../temp && cp -R ./ ../temp/ && mv ../temp/* snowbunny.app/Contents/Resources/app.nw/ && rm -rf ../temp
mkdir snowbunny.app/Contents/Resources/app.nw/workspace/content
cd snowbunny.app/Contents/Resources/app.nw

# add resources
cp "${base}/assets/nw.icns" ../

# fetch sling standalone (TODO: auto-mirror selection ?)
mkdir -p system/bin/sling && cd $_ 
curl -O http://mirror.switch.ch/mirror/apache/dist//sling/org.apache.sling.launchpad-6-standalone.jar 
cd ..

# fetch sourcemint 
npm install sm --dev

# export sourcemint path
export PATH=$PATH:`pwd`/../../node_modules/sm/bin

# clone/install cloud9 
git clone https://github.com/ajaxorg/cloud9.git && cd cloud9

# avoid bogus * 
npm cache clear 

# install cloud9 
sm install

# go home
cd $base

# app configuration adjustments
echo "<?php file_put_contents(__DIR__.'/snowbunny.app/Contents/Resources/app.nw/system/bin/cloud9/node_modules/optimist/index.js', str_replace('if (process.argv[1] == process.env._) {', 'if (false && process.argv[1] == process.env._) {', file_get_contents(__DIR__.'/snowbunny.app/Contents/Resources/app.nw/system/bin/cloud9/node_modules/optimist/index.js'))); file_put_contents(__DIR__.'/snowbunny.app/Contents/Resources/app.nw/system/bin/cloud9/configs/default.js', str_replace('projectDir: projectDir', 'projectDir: projectDir+\"/workspace\"', file_get_contents(__DIR__.'/snowbunny.app/Contents/Resources/app.nw/system/bin/cloud9/configs/default.js'))); file_put_contents(__DIR__.'/snowbunny.app/Contents/Info.plist', str_replace('node-webkit', 'snowbunny', file_get_contents(__DIR__.'/snowbunny.app/Contents/Info.plist')));" > configure.php && php configure.php && rm -rf configure.php

# adjust executable name as referenced in Info.plist
mv snowbunny.app/Contents/MacOS/node-webkit snowbunny.app/Contents/MacOS/snowbunny

# create dist *
mkdir ../dist && mv snowbunny.app ../dist/

# make noise
printf "\e[33mhophop...\e[0m ../dist/snowbunny.app\n\n"