#!/bin/bash

INCLUDE_PROJECT=$1

SCRIPTS="scripts"

mkdir -p $SCRIPTS

files=(
    'create_tag.sh'
    'delete_tag.sh'
    'edit_version.sh'
    'release_source.sh'
)
for file in "${files[@]}"
do
    echo "#!/bin/bash" > $SCRIPTS/$file
    echo "source \$envsetup/$SCRIPTS/\`basename \$0\`" >> $SCRIPTS/$file
    echo "    refresh $SCRIPTS/$file"
done

if [[ $INCLUDE_PROJECT == "" ]]; then
    exit 0
fi

REALPATH=`realpath $0`
#echo $REALPATH
TARGET_DIR=`dirname ${REALPATH}`
#echo $TARGET_DIR
cp $TARGET_DIR/$SCRIPTS/project.sh.include $SCRIPTS
echo "    refresh $SCRIPTS/project.sh.include"

exit 0
