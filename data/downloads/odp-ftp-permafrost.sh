#!/usr/bin/env bash

BASE_URL="ftp://anon-ftp.ceda.ac.uk/neodc/esacci/permafrost/data/permafrost_extent/L4/area4/pp/v01.0/ESACCI-PERMAFROST-L4-MODIS-PFR-AREA4_PP"
START_DATE=2003-01-01
OUTPUT_FODLER=./download/permafrost

mkdir -p $OUTPUT_FODLER

for i in {0..14}
do
  NEXT_YEAR=$(date +%Y -d "$START_DATE + $i year")
  NEXT_DATE=$(date +%Y-%m-%d -d "$START_DATE + $i year")
  FILENAME=$OUTPUT_FODLER/$(date +%Y%m%d -d "$START_DATE + $i year").nc
  FTP_URL=$BASE_URL"-"$NEXT_YEAR"-fv01.0.nc"
  echo $FTP_URL

  curl --silent $FTP_URL > $FILENAME

  python ./data/add-time-coordinate.py --file $FILENAME --timestamp $NEXT_DATE
done
