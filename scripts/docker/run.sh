#!/bin/bash

source /usr/share/yunohost/helpers

[ "$architecture" == "amd64" ] && image=collabora/code:3.0.0.5
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

domaines=""
for d in $(yunohost domain list | grep \\. | sed 's/domains: //g' | sed 's/  - //g' | sed 's/\./\\./g' )
do
	domaines="$domaines|$d"
done
domaines=$(echo $domaines | sed 's/^|//g');

options="-p $port:9980 -e domain=$domaines --cap-add MKNOD"

docker run -d --name=$app --restart always $options $image 1>&2
RT=$?

sleep 20

echo $RT
