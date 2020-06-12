#!/bin/bash -e
export LC_ALL=C.UTF-8

sites="1N, 291, 292C"

Dir=`pwd`
for state in prot deprot
do
    frames=`cd gros_${state}; ls *.gro`
    mkdir -p pkas_${state}
    mkdir -p titrations_${state}

    for i in $frames
    do
        frame=${i::-4}

        # Edit parameters file
        sed "s/__GRONAME__/${frame}/" template.dat > parameters.dat
        sed -i "s/__SITES__/${sites}/" parameters.dat
        sed -i "s/__STATE__/${state}/" parameters.dat

        # Run pypka
        pypka parameters.dat

    done
done

rm -f pKeff_*

for state in prot deprot
do
    awk '!/^\#/ && $4!=0 && $4!=1 {s[$1]+=$1+log($4/(1-$4))/log(10);n[$1]++};END{for(pH in n){print pH,s[pH]/n[pH],n[pH]}}' titrations_${state}/titration_*.txt | sort -n > pKeff_${state}.txt
done

for pH in `cat pKeff_deprot.txt pKeff_prot.txt | sort -n | awk '{print $1}' | uniq`
do
    prot=`awk -v pH=$pH '$1==pH{print $2}' pKeff_prot.txt`
    deprot=`awk -v pH=$pH '$1==pH{print $2}' pKeff_deprot.txt`
    echo $prot $deprot | awk -v pH=$pH 'NF==2{print pH, ($1+$2)/2}' >> pKeff_avx.txt
done