# !/bin/bash -e
middleman build
rm -Rf nodebob/app/*
mv build/* nodebob/app
cp -Rf public/* nodebob/app
VERSION=`node -e "console.log(require('./public/package.json').version);"`
cd nodebob
rm -Rf release.* manager-for-upyun-*
./build.linux.sh
./build.osx.sh
./build.win32.sh
mv release.linux-ia32/app release.linux-ia32/upyun_manager
mv release.linux-x64/app release.linux-x64/upyun_manager
mv release.win32/app.exe release.win32/UpYunManager.exe
mv release.osx/app.app release.osx/UpYun\ Manager.app

cd release.linux-ia32 && zip -r ../manager-for-upyun-$VERSION-linux-ia32.zip * && cd ..
cd release.linux-x64 && zip -r ../manager-for-upyun-$VERSION-linux-x64.zip * && cd ..
cd release.osx && zip -r ../manager-for-upyun-$VERSION-osx.zip * && cd ..
cd release.win32 && zip -r ../manager-for-upyun-$VERSION-win32.zip * && cd ..

