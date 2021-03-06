#!/usr/bin/env bash
set -e

xcrun -sdk iphoneos clang -o libhook.dylib hook.m -shared -lobjc -m32 -arch armv7 -miphoneos-version-min=7.1 -framework Foundation -F. -framework CydiaSubstrate && \
mv libhook.dylib libhook32.dylib && \
xcrun -sdk iphoneos clang -o libhook.dylib hook.m -shared -lobjc -m64 -arch arm64 -miphoneos-version-min=7.1 -framework Foundation -F. -framework CydiaSubstrate && \
mv libhook.dylib libhook64.dylib && \
lipo -create libhook32.dylib libhook64.dylib -output libhook.dylib && \
rm libhook32.dylib libhook64.dylib && \
mv libhook.dylib ../../../resources/ios/lib/
