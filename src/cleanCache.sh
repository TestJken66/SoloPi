#!/usr/bin/env bash

source_common() {
  pwd=$(
    cd $(dirname $0)
    pwd
  )
  source $pwd/common.sh
}

clean_caches() {

  logw "[$filename]clean android studio cache!"
  dir=("." "AdbLib"   "androidWebsockets" "app" "common" "mdlibrary" "permission" "portal" "shared")

  for element in "${dir[@]}"; do
    #clean task
    /bin/rm -rf $element/build/
    /bin/rm -rf $element/bin/
    /bin/rm -rf $element/gen/
    /bin/rm -rf $element/.settings/
    /bin/rm -rf $element/.externalNativeBuild
    /bin/rm -rf $element/$element.iml
    /bin/rm -rf $element/.gradle
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
  /bin/rm -rf google-java-format-1.12.0-all-deps.jar
  /bin/rm -rf spoon-runner-1.7.1-jar-with-dependencies.jar
  /bin/rm -rf dev-sdk/src/androidTest/java/com/miqt/costtime/ProguardJson.java
  /bin/rm -rf dev-sdk/src/main/java/com/analysys/plugin/Key.java
  /bin/rm -rf dev-sdk/src/androidTest/java/com/miqt/
  /bin/rm -rf dev-sdk/src/androidTest/java/com/analysys/plugin/
  /bin/rm -rf dev-sdk/src/main/java/com/analysys/plugin/
#  base_dir=("." "TestCaseBase" "MultiProcess" "NezhaAppList")
#  for element in "${base_dir[@]}"; do
#    rm -rf $element/build/
#    rm -rf $element/release/
#    rm -rf $element/releasebak/
#    rm -rf $element/*.iml
#    rm -rf $element/.gradle/
#    rm -rf $element/.idea/
#    rm -rf $element/sh.exe.stackdump
#    rm -rf $element/classes.dex
#    rm -rf $element/local.properties
#    rm -rf $element/.vs/
#    rm -rf $element/.vscode/
#    rm -rf $element/.DS_Store
#    rm -rf $element/__MACOSX
#  done

  if [ $# == 0 ]; then
    logw "[$filename]clean project success."
    loge "[$filename]>>>>you must close android studio<<<<"
  else
    loge "[$filename]>>clean project Failed!<<"
  fi

}

main() {
  source_common
  clean_caches
}

main
