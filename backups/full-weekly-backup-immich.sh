#!/bin/sh

FILENAME_TIMESTAMP=$(date +%Y%m%d)
tar -cvjf "/honor/backups/immich_weekly_$FILENAME_TIMESTAMP.tar.bz2" /honor/immich/upload/
zstd -16 "/honor/backups/immich_weekly_$FILENAME_TIMESTAMP.tar.bz2" -o "/honor/backups/immich_weekly_$FILENAME_TIMESTAMP.tar.bz2.zst"

aws s3 cp "/honor/backups/immich_weekly_$FILENAME_TIMESTAMP.tar.bz2.zst" s3://home-lab-backups-94401a152a94c4b9e97bc4bbd15449d8/immich

# Decompress with
# zstd -d images.tar.bz2.zst
# tar -xf images.tar