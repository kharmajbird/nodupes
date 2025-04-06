#!/bin/bash

#
# python3 -m venv venv && source venv/bin/activate
# python3 -m pip install tinytag
#


DIR=$1
CFG="00-nodupes.cfg"
IDX=1

# first run; scan all
FILT="^[[Aa-Zz]"

# be choosy on subsequent runs
FILT="^[[Aa-Ii]"


list_dupe() {
    dupe="$1"

    echo

    for i in `ls "$CFG/$dupe"`; do
        num=`ls "$CFG/$dupe/$i"`
        val=`cat "$num"`
        ##echo val = "=$val="

        ls -l "$val"
    done
}


check_remove() {
    dupe="$1"

    echo

    for i in `ls "$CFG/$dupe"`; do
        num=`ls "$CFG/$dupe/$i"`
        val=`cat "$num"`

        ls -l "$val"
        echo
        echo -n "Do you wish to remove this duplicate: (N/y): " > /dev/tty
        read confirm < /dev/tty
        echo; echo

        if [ "$confirm" = "y" ]; then
            echo "Removing =$val="
            sudo rm "$val"
            echo; echo
        fi

    done

}



if [ ! -d $DIR ]; then
    echo "Bad or no directory specified"
    exit
fi

rm -rf $CFG

#
# create index files for each title
#

find $DIR -type f -name "*mp3"| while read i
do
    TITLE=$(python3 /usr/local/bin/nodupes.py "$i")

    mkdir -p "$CFG/$TITLE"
    echo "$i" > "$CFG/$TITLE/$IDX" 

    let "IDX +=1"
done

#
# get a count of how many numbered idx files created with a title dir
# within the config dir by the above block
#
# if count is > 1 then a dupe (or more) has been found
# 


ls -1 "$CFG"| while read i
do

    CNT=`ls -l "$CFG/$i"| wc| sed -e 's/^ *//'| cut -f1 -d " "`
    let "CNT -=1"

    if [ $CNT -gt 1 ]; then
        echo
        echo "Found dupe $i"
        echo

        title="$i"

        if [ `echo $title| cut -f1 -d' '| grep "$FILT"` ]; then
            echo Skipping "$title"

        elif [ "$title" = "None" ]; then
           echo "Skipping title None" 
        else
            list_dupe "$title"
            check_remove "$title"
        fi
    fi
done
