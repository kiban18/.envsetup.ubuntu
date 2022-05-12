#!/bin/bash

#export ADBHOST=172.30.117.185
#export ADBHOSTPORT=$ADBHOST:5555

#export HOME_MOUNTED=/usr/local/google/home/kihwanl
#export WORK_MOUNTED=/media/work2
export WORK_MOUNTED=~/work
#export WORK_MOUNTED=$HOME_MOUNTED/work2

#export PATH=/home/khlee/work/tool/swift-4.1.2-RELEASE-ubuntu16.04/usr/bin:"${PATH}"
export PATH=/home/khlee/work/tool/swiftenv/bin:"${PATH}"

case $OSTYPE in
	darwin*) OS=macosx;;
	linux*)  OS=ubuntu;;
esac

ENVSETUP=~/.envsetup.$OS

export TOOL_MOUNTED=$WORK_MOUNTED/work/tool
export SOURCEDIR=$WORK_MOUNTED/source/android

export AOSPDIR=$SOURCEDIR/aosp
export ANDROIDDIR=$SOURCEDIR/android
export GOOGLETVDIR=$SOURCEDIR/googletv
export CTSDIR=$SOURCEDIR/android-cts/android-cts-3.2_r5
export GCTSDIR=$SOURCEDIR/android-gcts/android-cts
export CTSTOOLSDIR=$CTSDIR/tools
export GCTSTOOLSDIR=$GCTSDIR/tools
export CTSREPODIR=$CTSDIR/repository
export GCTSREPODIR=$GCTSDIR/repository
export CTSTESTCASESDIR=$CTSREPODIR/testcases
export GCTSTESTCASESDIR=$GCTSREPODIR/testcases
export DEVADMIN_APK_FOR_CTS2dot3R4=$CTSTESTCASESDIR/CtsDeviceAdmin.apk
export GDEVADMIN_APK_FOR_CTS2dot3R4=$GCTSTESTCASESDIR/CtsDeviceAdmin.apk
export DELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2=$CTSTESTCASESDIR/CtsDelegatingAccessibilityService.apk
export GDELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2=$GCTSTESTCASESDIR/CtsDelegatingAccessibilityService.apk

export COLOR_PY=$ENVSETUP/coloredlogcat.py
export ENVSETUP_SH=$ENVSETUP/envsetup.sh
export SETPATH_SH=$ENVSETUP/setpath.sh
export REPEAT_SH=$ENVSETUP/repeat.sh
export ADBCON_SH=$ENVSETUP/adbcon.sh
export GDBATTACH_SH=$ENVSETUP/gdbattach.sh
export JDBATTACH_SH=$ENVSETUP/jdbattach.sh
export FINDLIB_SH=$ENVSETUP/findlib.sh
export FINDPKG_SH=$ENVSETUP/findpkg.sh
export WHICHPKG_SH=$ENVSETUP/whichpkg.sh
export FINDTEST_SH=$ENVSETUP/findtest.sh
export PUSHAPK_SH=$ENVSETUP/pushapk.sh
export PUSHJAR_SH=$ENVSETUP/pushjar.sh
export WHEREAMINOW_SH=$ENVSETUP/whereaminow.sh
export WHATAMIDOINGNOW_SH=$ENVSETUP/whatamidoingnow.sh
export GOTOWITHTHESAMEDEPTH_SH=$ENVSETUP/gotowiththesamedepth.sh
export KILLPROCESS_SH=$ENVSETUP/killprocess.sh
export MAKEWITHLOG_SH=$ENVSETUP/makewithlog.sh
export MAKEOTAWITHLOG_SH=$ENVSETUP/makeotawithlog.sh
export GTV_REINSTALL_SH=$ENVSETUP/gtv_reinstall.sh
export DO_ALL_AT_ONCE_SH=$ENVSETUP/do_all_at_once.sh

#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#export JAVA_HOME=~/work/tool/jdk1.6.0_45
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export ANDROID_JAVA_HOME=$JAVA_HOME
#export WORKSPACE=$TOOL_MOUNTED/eclipse/workspace
export ADT_BUNDLE=$TOOL_MOUNTED/adt-bundle-linux
export WORKSPACE=$ADT_BUNDLE/workspace
export ANDROID_SWT=~/work/tool/adt-bundle-linux-x86_64-20140702/sdk/tools/lib/x86_64
#export ANDROID_SWT=~/work/tool/adt-bundle-linux-x86_64-20140321/sdk/tools/lib/x86_64
export USE_CCACHE=1
export CCACHE_DIR=~/work/tool/ccache
#export GDB=$GOOGLETVDIR/gitcorp_2/prebuilt/linux-x86_64/toolchain/arm-unknown-linux-gnueabi-4.5.3-glibc/bin/arm-unknown-linux-gnueabi-gdb
export GDB=$GOOGLETVDIR/gitv4.0/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-gdb

# set the number of open files to be 1024 for android
ulimit -S -n 1024

export adt_bundle_ubuntu=$TOOL_MOUNTED/android-adt/adt-bundle-linux-x86_64-20130219
export sdk=$adt_bundle_ubuntu/sdk
export skindir=$sdk/platforms/android-16/skins
sdcard=~/.android/sdcard.img
keyset=~/.android/default.keyset
emulator_cmd_common="emulator -sysdir $OUT -data $OUT/userdata.img -sdcard $sdcard -memory 1024 -gpu on -camera-front webcam0"
alias ls.skins='l $skindir'
alias emulator.build='$emulator_cmd_common'
alias emulator.build.skin='$emulator_cmd_common -skindir $skindir -skin '

alias agdb='$GDB'
alias gi='$ENVSETUP/grep_nwrIi_for_ios.sh'
alias ga='$ENVSETUP/grep_nwrIi_for_android.sh'

alias vijdbrc='vi $ENVSETUP/.jdbrc'
alias ln.gdbinit='ln -s $ENVSETUP/.gdbinit .gdbinit'
alias ln.jdbrc='ln -s $ENVSETUP/.jdbrc .jdbrc'
gdb_name=ln.gdb
alias ln.gdb='rm -f $gdb_name; ln -s $ANDROID_TOOLCHAIN/*gdb $gdb_name'
symbols_name=ln.symbols
alias ln.symbols='rm -f $symbols_name; ln -s $OUT/symbols $symbols_name'


alias whereaminow='$WHEREAMINOW_SH'
alias whatamidoingnow='$WHATAMIDOINGNOW_SH'

alias activitiesOnce='$ADBCON_SH && adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias activities4emul='$REPEAT_SH 1 adb shell dumpsys activity activities | grep Run'
alias logcatcolor='$ADBCON_SH && adb -s $ADBHOSTPORT logcat | $COLOR_PY'
alias logcatcolor4emul='adb logcat | $COLOR_PY'
alias logcattime='$ADBCON_SH && adb -s $ADBHOSTPORT logcat -v time'
alias logcattime4emul='adb logcat -v time'

alias adbcon='$ADBCON_SH'
alias adbrecon='adb disconnect; $ADBCON_SH'
alias adbremount='$ADBCON_SH && adb -s $ADBHOSTPORT remount'
alias adbsync='$ADBCON_SH && adb -s $ADBHOSTPORT sync'
alias adbpush='$ADBCON_SH && adb -s $ADBHOSTPORT push'
alias adbpull='$ADBCON_SH && adb -s $ADBHOSTPORT pull'
alias adbinstall.help='echo "adb -s $ADBHOSTPORT install [-r] bin/*.apk"'
alias adbinstall='$ADBCON_SH && adb -s $ADBHOSTPORT install'
alias adbkillemu='$ADBCON_SH && adb -s emulator-5554 device kill'

#alias adb='adb -s $ADBHOSTPORT'

alias howtomediatest='
echo "godir libstagefright/test";
echo "mm";
echo "adbcon";
echo "adbremount";
echo "adbshell android stop";
echo "adbsync";
echo "adbreboot";
echo "adbcon";
echo "adbshell /data/nativetest/MediaExtractor_test/MediaExtractor_test";
echo "adbshell /data/nativetest/MediaMetadata_test/MediaMetadata_test";
echo "adbshell /data/nativetest/MediaPlayback_test/MediaPlayback_test";
echo "adbshell /data/nativetest/MediaPlayer_test/MediaPlayer_test";
echo "or";
echo "runtest mediacoverage";
'
alias prepare.runtest='adbcon && adbremount && adbshell android stop && adbsync && adbreboot'
alias runtest.cts.MediaCoverageTest='$ADBCON_SH && runtest cts-tv -c com.google.android.tv.media.cts.MediaCoverageTest'
alias runtest.mediacoverage='$ADBCON_SH && runtest mediacoverage'

alias prepare.cts='adbinstall -r $DEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $DELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'
alias prepare.gcts='adbinstall -r $GDEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $GDELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'

alias adbshell='adb wait-for-device shell'
alias adbreboot='adbshell reboot'
alias adbrmdata='adbshell "rm -rf /data; reboot"'
alias adblist='adbshell ps'
alias amstart.help='echo "Usage:   am start [-a ACTION] [-c CATEGORY] [-d DATA] [-t TYPE] [-n COMPONENT]"; echo "Example: am start -a android.intent.action.VIEW -d file:///mnt/sdcard/DCIM/Camera/video-2010-08-20-08-49-48.mp4 -t video/mp4 -n com.sec.android.app.videoplayer/.activity.MoviePlayer"'
alias amstart='adbshell am start'
alias adbsql='adbshell "sqlite3"'
alias adbsqldump='adbsql /data/data/com.android.providers.media/databases/external.db .dump'
alias adbsqlvolumes='adbsql /data/data/com.android.providers.media/databases/external.db "select * from volumes"'
alias adbsqlshortcut='adbsql /data/data/com.google.tv.launcher/databases/launcher.db "select * from shortcuts"'
alias useomx='adbshell setprop media.moo.others true'
alias useavapi='adbshell setprop media.moo.others false'
alias getomx='adbshell getprop media.moo.others'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias killprocess='$KILLPROCESS_SH'
alias killqemu='$KILLPROCESS_SH qemu'

alias createapp.help='echo "Example: android create project -n ProjectName -t 1 -p ./projectname -k com.example.projectname -a ProjectActivity"; android --help create project'
alias createapp='android create project'
alias updateapp.help='echo "Example: android update project -l $TOOL_MOUNTED/android-sdk-linux/platforms/android-11 -p ./projectname"; android --help update project'
alias updateapp='android update project'

#alias eclipse='eclipse -vm $TOOL_MOUNTED/jdk1.6.0_33/bin &'

#alias lunch.android.master='cd $ANDROIDDIR/master; . build/envsetup.sh; lunch full-eng; source.devsetup'
#alias lunch.android.jb-mr1.1-dev='cd $ANDROIDDIR/jb-mr1.1-dev; . build/envsetup.sh; lunch full-eng; source.devsetup'
#alias lunch.android.jb-mr1-aah-dev='cd $ANDROIDDIR/jb-mr1-aah-dev; . build/envsetup.sh; lunch full-eng; source.devsetup'

alias lunch.aosp.master='cd $AOSPDIR/master; . build/envsetup.sh; lunch full-eng; source.devsetup'
#alias lunch.aosp.jb-mr1-dev='cd $AOSPDIR/jb-mr1-dev; . build/envsetup.sh; lunch full-eng; source.devsetup'
#alias lunch.aosp.android-4.2.1_r1='cd $AOSPDIR/android-4.2.1_r1; . build/envsetup.sh; lunch full-eng; source.devsetup'
alias lunch.aosp.android-4.2.2_r1='cd $AOSPDIR/android-4.2.2_r1; . build/envsetup.sh; lunch full-eng; source.devsetup'

#alias lunch.gtv.3.0.cosmo='cd $GOOGLETVDIR/gitcorp_2; . build/envsetup.sh; lunch cosmo-eng; source.envsetup'

#alias lunch.gtv.4.0-mr0='cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup'
#alias build.gtv.4.0-mr0='cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; makewithlog; makeotawithlog; gtv_reinstall'
#alias night.gtv.4.0-mr0='cd $GOOGLETVDIR/gtv-4.0-jb-mr0; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; repo sync -j20; makewithlog; makeotawithlog'
#alias lunch.gtv.4.0-mr0.berlin='cd $GOOGLETVDIR/gtv-4.0-jb-mr0.berlin; . build/envsetup.sh; lunch berlin-eng; source.devsetup'
#alias build.gtv.4.0-mr0.berlin='cd $GOOGLETVDIR/gtv-4.0-jb-mr0.berlin; . build/envsetup.sh; lunch berlin-eng; source.devsetup; makewithlog; makeotawithlog; gtv_reinstall'
#alias night.gtv.4.0-mr0.berlin='cd $GOOGLETVDIR/gtv-4.0-jb-mr0.berlin; . build/envsetup.sh; lunch berlin-eng; source.devsetup; repo sync -j20; makewithlog; makeotawithlog'

#alias lunch.gtv-4.0-aosp-jb-mr1='cd $GOOGLETVDIR/gtv-4.0-aosp-jb-mr1; . build/envsetup.sh; lunch cosmo-eng; source.devsetup'
#alias build.gtv-4.0-aosp-jb-mr1='cd $GOOGLETVDIR/gtv-4.0-aosp-jb-mr1; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; makewithlog; makeotawithlog; gtv_reinstall'
#alias night.gtv-4.0-aosp-jb-mr1='cd $GOOGLETVDIR/gtv-4.0-aosp-jb-mr1; . build/envsetup.sh; lunch cosmo-eng; source.devsetup; repo sync -j20; makewithlog; makeotawithlog'

alias deletelog='echo "delete logfiles below..."; ll make_*.log 2>/dev/null; rm ./make_*.log; echo "remained logfiles below..."; find . -name "make_*.log"'
#alias makewithlog='$MAKEWITHLOG_SH'
alias makeotawithlog='$MAKEOTAWITHLOG_SH'
alias gtv_reinstall='$GTV_REINSTALL_SH'
alias do_all_at_once='$DO_ALL_AT_ONCE_SH'

export kernel=${WORK_MOUNTED}/work/tool/adt-bundle-linux/sdk/system-images/android-17/armeabi-v7a/kernel-qemu
alias emulator.avd='emulator -kernel $kernel -system $OUT/system.img -datadir $OUT/userdata.img -ramdisk $OUT/ramdisk.img'
export system_images=/home/kihwanl/work/tool/adt-bundle-linux/sdk/system-images/android-16/armeabi-v7a
export system_images_org=/home/kihwanl/work/tool/adt-bundle-linux/sdk/system-images/android-16.org/armeabi-v7a
alias cp.emulator='cp -ar $OUT/*.img $system_images'
alias rb.emulator='cp -ar $system_images_org/*.img $system_images'
alias cp.userdata='cp -ar $system_images_org/userdata.img $OUT'

#alias makeepkwithlog='time make epk -j8 2>&1 | tee make_epk_build.log; ll $OUT/cosmo.epk | grep $OUT/cosmo.epk'
#alias copyepk='cp $OUT/cosmo.epk /var/lib/tftpboot/cosmo/cosmo.epk; sudo chmod -R 777 /var/lib/tftpboot/*; ls -alRh /var/lib/tftpboot'

alias mmwithlog='time mm -j8 2>&1 | tee make_mm_build.log'
# alias make GtvVideoViewTest -j8
alias pushapk='$PUSHAPK_SH'
alias pushjar='$PUSHJAR_SH'
alias do_apk_at_once='mmwithlog && pushapk'
alias do_jar_at_once='mmwithlog && pushjar'


# for debug
alias jdbattach='$JDBATTACH_SH'
alias gdbattach='$GDBATTACH_SH'

alias whatamidoingnowAll='
gotogit0; whatamidoingnow;
gotogit1; whatamidoingnow;
gotogit2; whatamidoingnow;
gotogitv2.1; whatamidoingnow;
gotogitv3.0; whatamidoingnow;
gotogitv4.0; whatamidoingnow;
gotolg0; whatamidoingnow;
gotolgv3.0; whatamidoingnow;
'

alias checkremote.help='echo "repo start checkremote ."; echo "git remote update"; echo "git branch -a"; echo "git diff checkremote remotes/m/master"; echo "repo abandon checkremote"'
alias checkremote='repo start checkremote .; git remote update; git branch -a; git diff checkremote remotes/m/master; repo abandon checkremote'


alias make.ctags='$ENVSETUP/makectags.sh'
alias make.cscope='$ENVSETUP/makecscope.sh'
alias make.filelist='rm filelist'
alias make.allDBs='make.ctags; make.cscope; make.filelist'

alias findlib='$FINDLIB_SH'
alias findpkg='$FINDPKG_SH'
alias whichpkg='$WHICHPKG_SH'
alias findtest='$FINDTEST_SH'
alias listtest='runtest -l'

alias mk='make clean; make; make calm_clean'

alias chrome='google-chrome'

alias test.launchHome='amstart -a android.intent.action.MAIN -c android.intent.category.HOME -n com.google.tv.launcher/.HomeActivity'
alias test.onBoot='amstart -a android.intent.action.BOOT_COMPLETED -f 0x00000010'

alias ecosenv='. /opt/ecos/ecosenv.sh'

alias copy2glibc='croot; cp out/target/product/fox_glibc/system/lib/* out/target/product/fox/system/glibc; find ./out -name libOmxCore.so -exec ls -al {} \;'

export T32SYS=/opt/t32
export T32TMP=/tmp
export T32ID=T32

alias gerrit='ssh -p 29418 kiban18@dev.nousco.net gerrit'

export ADOBE_PATH=/opt/Adobe/Reader9

#Hierarchy Viewer Variable
export ANDROID_HVPROTO=ddm

alias cdks='    cd ~/work/kecureos; . ./build/envsetup.sh'
alias cdos='    cd ~/work/secureos; . ./build/envsetup.sh'

alias cdtest='  cd ~/test'
alias cda='     cd ~/work/artik/artik5'
alias cdak='    cd ~/work/arndale_k'
alias cdbuild=' cd ~/work/secureos/build'
alias cdree='   cd ~/work/secureos/REE'
alias cdtee='   cd ~/work/secureos/TEE'
alias cdsdk='   cd ~/work/secureos/SDK'
alias pushree=' pushd ~/work/secureos/REE'
alias pushtee=' pushd ~/work/secureos/TEE'
alias cdkern='  cd ~/work/secureos/TEE/kernel'
alias cdlib='   cd ~/work/secureos/TEE/lib'
alias cdusr='   cd ~/work/secureos/TEE/usr'
alias cdwork='  cd ~/work'
alias cddoc='   cd ~/doc'
alias cdtool='  cd ~/work/tool'
alias cdrt='    cd ~/ref/trustonic/SVN/Products'


alias toss='pushd ~/work/secureos 1>/dev/null; . ./build/envsetup.sh; popd 1>/dev/null'
#alias toss='pushd ~/work/secureos/SDK/toss_sdk_ubuntu 1>/dev/null; . ./build/envsetup.sh; popd 1>/dev/null'
alias toss+='videvsetup +/"alias toss="'
alias toss?='echo $TOPDIR'


#alias make='make'
#alias make='make TARGET_BOARD=artik5'
alias make='make TARGET_BOARD=espresso'
alias make+='videvsetup +/"alias make="'
alias make?='alias make'

alias makeerror='make 2>&1 | egrep "error:.*|undefined reference .*|Error .*"'
func_go()
{
    make clean $* && make $*
    RESULT=$?
    if [ $RESULT -ne 0 ]; then
        #make 2>&1 | egrep "error:.*|undefined reference .*|Error .*"
        makeerror
        return $RESULT
    fi
}
#alias go='func_go'
#alias go='         (make clean V=1 && make V=1 || RESULT=$?;makeerror)'
alias gor='        (go; make result)'
alias goi='        (go && make install)'
alias goki='       (go && make kinstall)'
alias gooi='       (go && make otainstall)'
alias goall='      (cdtee && go && cdree && go && cdtee)'
alias goresult='   (cdtee && make result && echo "" && cdree && make result && cdtee)'
alias goinstall='  (cdtee && make install && cdree && make install && cdtee)'
alias gokinstall=' (cdtee && make kinstall)'
#alias GODEV='      (goall && goinstall && gokinstall && adb reboot)'
alias GODEV='      (goall && goinstall && gokinstall && adb reboot && ./kernel/fastboot.flash.sh)'
alias GOREL='      (goall && goinstall && gokinstall && ./make_firstboot.sh && adb reboot && ./kernel/fastboot.flash.sh)'
alias IDEV='       (goinstall && gokinstall && adb reboot && ./kernel/fastboot.flash.sh)'
alias IREL='       (goinstall && gokinstall && ./make_firstboot.sh && adb reboot && ./kernel/fastboot.flash.sh)'
alias teeinstall=' (make install -C kernel && make install -C lib)'
alias reeinstall=' (make install -C ../REE/drivers && make install -C ../REE/lib && make install -C ../REE/tee_daemon)'

alias viconfig='     (cdos; vi ./Config.mk)'
alias viree='        pushree && vi ./Config.mk && popd'
alias vitee='        pushtee && vi ./Config.mk && popd'
alias vica='         pushree && vi apps/testcase/Makefile && popd'
alias goca='         pushree && pushd apps/testcase && go && make install && popd && popd'
alias vita='         pushtee && vi usr/testcase/Makefile && popd'
alias gota='         pushtee && pushd usr/testcase && go && make install && popd && popd'
alias godr='         push ~tee && pushd usr/testcase && go && make install && popd && popd'

#alias gotest='     time (make clean && make && make result && make install && adb shell /system/test/`echo $(basename $PWD)`)'

alias install='    time (cdtee && make kinstall && cd kernel && make install && cd ../lib && make install && cd ../usr/testcase/000_* && make install && cdree && cd drivers && make install && cd ../lib && make install && cd ../tee_daemon && make install && cd ../apps/testcase/000_* && make install && cdtee && adb reboot && echo "Success")'
alias run='    time (adb wait-for-device shell /data/.toss/start_tz_driver.sh && adb shell /data/.toss/tee_daemon)'

alias min='minicom 2>&1| tee minicom.log'
alias min1='minicom usb1 2>&1| tee minicom1.log'
alias grep.min='tail -f ./minicom.log | grep "RUN\|FAIL"'
alias log='minicom 2>&1| tee adb.log'
alias grep.log='tail -f ./adb.log | grep "RUN\|FAIL"'

alias aws.s3='ssh -i "aws201603s3.pem" ubuntu@ec2-52-78-81-28.ap-northeast-2.compute.amazonaws.com'
alias aws.cloudwatch.infomark='ssh -i "infomark-dev.pem" ubuntu@ec2-52-78-46-95.ap-northeast-2.compute.amazonaws.com'
alias aws.cloudwatch.vinaphone='ssh -i "infomark-dev.pem" ubuntu@ec2-52-78-46-95.ap-northeast-2.compute.amazonaws.com'
alias aws.cloudwatch.pepcall='ssh -i "pepcall.pem" ubuntu@ec2-52-211-211-160.eu-west-1.compute.amazonaws.com'
alias aws.getlog.pcbeta='time scp -i ~/work/infomark/kidsphone/server/pcbeta/sshaws/pepcall.pem ubuntu@ec2-34-253-49-185.eu-west-1.compute.amazonaws.com:/var/crazy/log/crazy-logger.log ./kidsphone_pcbeta.log'
#alias aws.getlog.pcbeta='time scp -i ~/work/infomark/kidsphone/server/pcbeta/sshaws/pepcall.pem ubuntu@ec2-52-210-3-72.eu-west-1.compute.amazonaws.com:/var/crazy/log/crazy-logger.log ./kidsphone_pcbeta.log'
alias aws.getlog.vinaphone='time scp -i ~/work/joon2/june2-global/sshaws/kidzone-s.pem ubuntu@ec2-54-169-237-92.ap-southeast-1.compute.amazonaws.com:/var/crazy/log/crazy-logger.log ./kidsphone_vina.log'
alias aws.getlog.demo='time scp -i ~/work/joon2/june2-global/sshaws/infomark-dev.pem ubuntu@ec2-52-78-151-73.ap-northeast-2.compute.amazonaws.com:/var/crazy/log/crazy-logger.log ./kidsphone_demo.log'

alias 000='time (./test_repeat.sh 000 10000 2>&1 | tee test_000.log)'
alias 001='time (./test_repeat.sh 001 10000 2>&1 | tee test_001.log)'
alias 002='time (./test_repeat.sh 002 10000 2>&1 | tee test_002.log)'
alias 003='time (./test_repeat.sh 003 10000 2>&1 | tee test_003.log)'
alias 004='time (./test_repeat.sh 004 10000 2>&1 | tee test_004.log)'
alias 005='time (./test_repeat.sh 005 10000 2>&1 | tee test_005.log)'
alias 006='time (./test_repeat.sh 006 10000 2>&1 | tee test_006.log)'
alias 007='time (./test_repeat.sh 007 10000 2>&1 | tee test_007.log)'
alias 008='time (./test_repeat.sh 008 10000 2>&1 | tee test_008.log)'
alias 009='time (./test_repeat.sh 009 10000 2>&1 | tee test_009.log)'
alias 010='time (./test_repeat.sh 010 10000 2>&1 | tee test_010.log)'
alias 011='time (./test_repeat.sh 011 10000 2>&1 | tee test_011.log)'
alias 012='time (./test_repeat.sh 012 10000 2>&1 | tee test_012.log)'
alias 013='time (./test_repeat.sh 013 10000 2>&1 | tee test_013.log)'
alias 014='time (./test_repeat.sh 014 10000 2>&1 | tee test_014.log)'
alias 015='time (./test_repeat.sh 015 10000 2>&1 | tee test_015.log)'
alias 016='time (./test_repeat.sh 016 10000 2>&1 | tee test_016.log)'
alias 017='time (./test_repeat.sh 017 10000 2>&1 | tee test_017.log)'
alias 018='time (./test_repeat.sh 018 10000 2>&1 | tee test_018.log)'
alias 019='time (./test_repeat.sh 019 10000 2>&1 | tee test_019.log)'
alias 020='time (./test_repeat.sh 020 10000 2>&1 | tee test_020.log)'
alias 022='time (./test_repeat.sh 022 10000 2>&1 | tee test_022.log)'
alias 777='time (./test_repeat.sh 777 10000 2>&1 | tee test_777.log)'
alias 800='time (./test_repeat.sh 800 10000 2>&1 | tee test_800.log)'
alias 999='time (./test_repeat.sh 999 10000 2>&1 | tee test_999.log)'
alias 1006='time (./test_repeat.sh 1006 10000 2>&1 | tee test_1006.log)'
alias 1007='time (./test_repeat.sh 1007 10000 2>&1 | tee test_1007.log)'
alias 1200='time (./test_repeat.sh 1200 10000 2>&1 | tee test_1200.log)'
alias 1201='time (./test_repeat.sh 1201 10000 2>&1 | tee test_1201.log)'
alias 1202='time (./test_repeat.sh 1202 10000 2>&1 | tee test_1202.log)'
alias 1203='time (./test_repeat.sh 1203 10000 2>&1 | tee test_1203.log)'
alias 1204='time (./test_repeat.sh 1204 10000 2>&1 | tee test_1204.log)'
alias 1205='time (./test_repeat.sh 1205 10000 2>&1 | tee test_1205.log)'
alias 1206='time (./test_repeat.sh 1206 10000 2>&1 | tee test_1206.log)'
alias 1207='time (./test_repeat.sh 1207 10000 2>&1 | tee test_1207.log)'
alias 1208='time (./test_repeat.sh 1208 10000 2>&1 | tee test_1208.log)'
alias 1300='time (./test_repeat.sh 1300 10000 2>&1 | tee test_1300.log)'
alias 2010='time (./test_repeat.sh 2010 10000 2>&1 | tee test_2010.log)'
alias 2011='time (./test_repeat.sh 2011 10000 2>&1 | tee test_2011.log)'
alias 2012='time (./test_repeat.sh 2012 10000 2>&1 | tee test_2012.log)'
alias 2013='time (./test_repeat.sh 2013 10000 2>&1 | tee test_2013.log)'
alias 2014='time (./test_repeat.sh 2014 10000 2>&1 | tee test_2014.log)'
alias 2015='time (./test_repeat.sh 2015 10000 2>&1 | tee test_2015.log)'
alias 2016='time (./test_repeat.sh 2016 10000 2>&1 | tee test_2016.log)'
alias 2017='time (./test_repeat.sh 2017 10000 2>&1 | tee test_2017.log)'
alias 2019='time (./test_repeat.sh 2019 10000 2>&1 | tee test_2019.log)'
alias 2020='time (./test_repeat.sh 2020 10000 2>&1 | tee test_2020.log)'
alias 2030='time (./test_repeat.sh 2030 10000 2>&1 | tee test_2030.log)'
alias 2031='time (./test_repeat.sh 2031 10000 2>&1 | tee test_2031.log)'
alias 3000='time (./test_repeat.sh 3000 10000 2>&1 | tee test_3000.log)'
alias all='time (./test_all_repeat.sh 10000 2>&1 | tee test_all.log)'

alias n='nautilus .&'
alias makewarning='make 2>&1 | grep warning:.*'
func_makelog()
{
    if [ "$1" != "" ]; then
        make clean; make 2>&1 -p > make.print.$1
        make clean; make 2>&1 -d > make.debug.$1
        make clean; make 2>&1 > make.log.$1
    else
        make clean; make 2>&1 -p > make.print
        make clean; make 2>&1 -d > make.debug
        make clean; make 2>&1 > make.log
    fi
}
alias makelog='func_makelog'

alias t32='pushd /opt/t32/iTSP; sudo /opt/t32/iTSP/start_powerview.sh'

alias todolist='grep -nwr TODO .; grep -nwr TODO . | wc'

alias git.merged='CUR=`__git_ps1 | sed -e "s/(//" | sed -e "s/)//"`; git checkout master && git pull && git checkout -B $CUR'

alias elf.info.header='arm-none-linux-gnueabi-readelf -l'
alias elf.info.symbol='arm-none-linux-gnueabi-nm -l -S --size-sort'

alias ssh.vdi='ssh root@192.168.1.149'

alias genignore='basename $PWD >> .gitignore'
#alias android-studio-working='~/work/tool/android-studio-2.2-working/bin/studio.sh &'
#alias android-studio-2.2='~/work/tool/android-studio-2.2/bin/studio.sh &'
alias android-studio-3.0='~/work/tool/android-studio-3.0.1/bin/studio.sh &'
alias android-studio-3.2='~/work/tool/android-studio-3.2.0/bin/studio.sh &'
alias android-studio-3.4='~/work/tool/android-studio-3.4/bin/studio.sh &'
alias android-studio-3.5='~/work/tool/android-studio-3.5/bin/studio.sh &'
alias android-studio-4.0='~/work/tool/android-studio-4.0/bin/studio.sh &'
alias android-studio-ilink='android-studio-new'
alias android-studio-kidsphone='android-studio-3.0'

alias android-studio-latest='~/work/tool/android-studio-4.0/bin/studio.sh &'

alias postman-latest='~/work/tool/Postman/app/Postman &'

alias argouml='~/work/tool/argouml-0.34/argouml.sh &'
alias argouml2='~/work/tool/argouml-0.34/argouml2.sh &'

alias pconf.demo='adb shell imutil pconf ro.pconf.kidslink.url https://demo.kidslink.co.kr/1.0'
alias pconf.filip='adb shell imutil pconf ro.pconf.kidslink.url https://joon-api.myfilip.com:443/1.0'
alias pconf.show='adb shell imutil pconf'

alias aosp='cd ~/work/opensource/aosp/'

alias cdinsole='cd ~/work/4ten/dw2/android/insole-android/'

#`which s3fs` com.crazyupinc.share /home/khlee/s3/khlee -o allow_other -o use_cache=/tmp -o endpoint=ap-northeast-2

alias repeat_git_pull='~/.envsetup.ubuntu/scripts/repeat_git_pull.sh 10'

# for mediaizent
alias ssh-callbell='echo pw: qqqq1234; ssh -p 2222 ubuntu@125.143.160.151'

# for markt-clova-ext
alias c='/work/source/markt/clova/markt-clova-cdms-curl/check.sh'
alias s='/work/source/markt/clova/markt-clova-cdms-curl/status.sh'
alias p='/work/source/markt/clova/markt-clova-cdms-curl/package.sh'
alias cdkapp='adb shell cdkapp-som-test'

export ANDROID_SDK_ROOT=/work/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

echo "    ~/.envsetup.$OS/devsetup.sh sourced!!!"
