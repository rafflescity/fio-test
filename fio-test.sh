#!/bin/bash -x

storage=$1 # storage name
[ -z $storage ] && echo "Must specify storage" && exit 1

mkdir -vp /mnt/fio-test # testing device should be mounted here
mkdir -vp "/tmp/fio-result/${storage}"

for i in rw randrw; do
    for j in 4 8 16 32 64 128 256 512 1024; do
        for k in 0 10 20 30 40 50 60 70 100; do
            fio --name=${storage}_${i}_${j}k_${k} \
                --filename=/mnt/fio-test/file \
                --direct=1 \
                --rw=${i} \
                --rwmixwrite=${k} \
                --bs=${j}k \
                --ioengine=libaio \
                --iodepth=256 \
                --size=10G \
                --time_based \
                --runtime=120 \
                --numjobs=8 \
                --group_reporting \
                --output-format=json \
                --eta-newline=1 | tee "/tmp/fio-result/${storage}/${i}_${j}k_${k}.json" 
        done
    done
done