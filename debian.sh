#!/bin/bash

export GNUPGHOME=/srv/mirrors/.gnupg

logfile=/var/log/debian-mirrors.log

status=1
pid=$$

arch=amd64,i386,all
section=main,contrib,non-free,main/debian-installer
release=jessie
server=ftp.de.debian.org
inPath=/debian
proto=rsync
outPath=/srv/mirrors/debian

/usr/bin/debmirror       -a $arch \
                --nosource \
                -s $section \
		--i18n \
                -h $server \
                -d $release \
                -r $inPath \
                --progress \
		--getcontents \
		--diff=use \
		--ignore-small-errors \
		--ignore-missing-release \
		--ignore-release-gpg \
		--cleanup \
                -e $proto \
                $outPath >>$logfile
status=$?
