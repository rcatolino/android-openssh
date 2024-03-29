
.PHONY : android-ndk android-openssh prepare all

all : prepare
	ndk-build
	echo "Build successful, you can find the binaries in libs/"

prepare : android-ndk android-openssh

android-openssh : jni

jni : Android.mk private
	-git clone "git://github.com/CyanogenMod/android_external_openssh.git" jni
	cp -f Android.mk jni/
	cp -rf private jni/

android-ndk :
	@if which ndk-build 2> /dev/null;\
		then echo "ndk present";\
		else echo "No ndk present. You need to install the android ndk at \
http://developer.android.com/tools/sdk/ndk/index.html";\
		exit 1;\
		fi;

clean :
	ndk-build clean
