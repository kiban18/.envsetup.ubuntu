#!/bin/bash

INPUT=make.d
TEMP=${INPUT}.temp
OUTPUT=${INPUT}.strip

sed '/^$/d' $INPUT > $OUTPUT

cp $OUTPUT $TEMP; sed '/GNU Make/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/Copyright/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/이 프로그램은 자유/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/상품성이나 특정 목적/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/않습니다/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/This program built/d' $TEMP > $OUTPUT

cp $OUTPUT $TEMP; sed '/타겟/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/스템/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/규칙/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/파일/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/묵시적/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/프로세스/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/선행조건/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/메이크파일/d' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed '/Removing child/d' $TEMP > $OUTPUT

cp $OUTPUT $TEMP; sed 's/gcc .* -o/gcc ... -o/' $TEMP > $OUTPUT
cp $OUTPUT $TEMP; sed 's/ld .* -o/ld ... -o/' $TEMP > $OUTPUT

cp $OUTPUT $TEMP; sed '/TODO/d' $TEMP > $OUTPUT

rm $TEMP
