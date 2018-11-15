#!/bin/bash
FILENAME=$1
LINES=$2
HDR=$(head -1 ${FILENAME})
split -l $LINES ${FILENAME} xyz
n=1
for f in xyz*
do
    if [[ ${n} -ne 1 ]]; then
        echo ${HDR} > part-${n}-${FILENAME}
    fi
    cat ${f} >> part-${n}-${FILENAME}
    rm ${f}
    ((n++))
done
