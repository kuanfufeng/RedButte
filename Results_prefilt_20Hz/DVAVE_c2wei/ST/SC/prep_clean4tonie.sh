#!/bin/bash

for fn in `ls dv_ave_COR_sn5_20Hz_*_R0.out`
do
  echo $fn
  st=`echo $fn | gawk -F_ '{print $8}'`
  fband=`echo $fn | gawk -F_ '{print $9}'`

  out=DV_ave_${st}_${fband}.txt
  echo "dv/v,err,date" > $out
  gawk '{print $1","$2","$3}' $fn >> $out

done
