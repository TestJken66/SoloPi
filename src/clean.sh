#!/bin/bash

source_common() {
  pwd=$(
    cd $(dirname $0)
    pwd
  )
  source $pwd/common.sh
}

clean_task() {
  logw "[$filename]>>>>clean project<<<<"
  dir=("." "AdbLib"   "androidWebsockets" "app" "common" "mdlibrary" "permission" "portal" "shared")
  for element in "${dir[@]}"; do
    #clean task
    /bin/rm -rf $element/build/
    /bin/rm -rf $element/bin/
    /bin/rm -rf $element/gen/
    /bin/rm -rf $element/.externalNativeBuild
    /bin/rm -rf $element/.DS_Store
    /bin/rm -rf $element/__MACOSX
    /bin/rm -rf $element/firelineReport
    /bin/rm -rf $element/*.jar
    /bin/rm -rf $element/res/
    /bin/rm -rf $element/findbugs_result.html
    /bin/rm -rf $element/findbugs-3.0.1/
    /bin/rm -rf $element/dev-sdk-debug.aar
    /bin/rm -rf $element/classes.jar
    /bin/rm -rf $element/R.txt
    /bin/rm -rf $element/AndroidManifest.xml
    /bin/rm -rf $element/findbugs-3.0.1.tar.gz
    /bin/rm -rf $element/fireline_1.7.3.jar
    /bin/rm -rf $element/firelineReport/
    /bin/rm -rf $element/release/
    /bin/rm -rf $element/releasebak/
    /bin/rm -rf $element/sh.exe.stackdump
    /bin/rm -rf $element/classes.dex
    logd "[$filename]clean $element over."
  done
  /bin/rm -rf dev-sdk/src/androidTest/java/com/miqt/
  /bin/rm -rf dev-sdk/src/androidTest/java/com/analysys/plugin/
  /bin/rm -rf dev-sdk/src/main/java/com/analysys/plugin/

  if [ $# == 0 ]; then
    logi "[$filename]clean project success. "
  else
    loge "[$filename]clean project Failed!"
  fi

}

main() {
  source_common
  clean_task
## -f 参数判断 $file 是否存在
#  file="/bin/rm"
#  if [ -f "$file" ]; then
#    echo "$file 文件存在。。。"
#    # shellcheck disable=SC1065
#    clean_task $file
#  fi
#  file="/usr/bin/rm"
#  if [ -f "$file" ]; then
#      echo "$file 文件存在。。。"
#      clean_task $file
#    fi
}

main
