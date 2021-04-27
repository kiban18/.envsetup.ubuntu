#!/bin/bash

#### check cnt of 2x and 3x
CNT_OF_2X=`find . -iname "*@2x.png" | wc -l`
echo "cnt of 2x: ${CNT_OF_2X}"
CNT_OF_3X=`find . -iname "*@3x.png" | wc -l`
echo "cnt of 3x: ${CNT_OF_3X}"
CNT_OF_2X_3X=`expr ${CNT_OF_2X} + ${CNT_OF_3X}`
echo "cnt of 2x+3x: ${CNT_OF_2X_3X}"
CNT_OF_TOTAL=`find . -iname "*.png" | wc -l`
echo "cnt of total: ${CNT_OF_TOTAL}"

if [ "${CNT_OF_2X}" != "${CNT_OF_3X}" ]; then
	echo "NG - cnt of 2x and 3x does NOT match"
	exit 1
fi
if [ "${CNT_OF_2X_3X}" != "${CNT_OF_TOTAL}" ]; then
	echo "NG - cnt of 2x and 3x is NOT equal to the cnt of all png"
	exit 1
fi
echo "OK - generating report"

#### report resolutions of 2x and 3x
find . -iname "*@2x.png" -exec file {} \; > ../resolution_2x.log
sort ../resolution_2x.log > ../resolution_2x.log.sorted
find . -iname "*@3x.png" -exec file {} \; > ../resolution_3x.log
sort ../resolution_3x.log > ../resolution_3x.log.sorted
bcompare ../resolution_3x.log.sorted ../resolution_2x.log.sorted &

echo "DONE"
