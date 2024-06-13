#!/bin/sh
#  @author:       Alexandre Plennevaux
#  @description:  MIRROR DISTANT FOLDER TO LOCAL FOLDER VIA FTP
#
# FTP LOGIN
HOST='ftp.studio2.org.uk'
USER='neo6502@studio2.org.uk'
PASSWORD='neo6502doc'

cd neo6502/site
lftp -u "$USER","$PASSWORD" $HOST <<EOF
set ssl:verify-certificate no
set sftp:auto-confirm yes
mirror -R 
exit
EOF
echo
echo "Transfer finished"
date
