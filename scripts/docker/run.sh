#!/bin/bash

source /usr/share/yunohost/helpers

[ "$architecture" == "amd64" ] && image=collabora/code:4.0.1.1
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

[ "$(docker info 2>/dev/null | grep 'Storage Driver' | awk -F': ' '{print $2}')" == "aufs" ] \
 && ynh_die "Sorry ! Collabora don't work with 'aufs' Docker driver, please change it (ex : edit /etc/docker/daemon.json with { \"storage-driver\": \"overlay\" }. Next, restart docker engine service) (see more on : https://docs.docker.com/storage/storagedriver/select-storage-driver/)"

domaines=""
for d in $(yunohost domain list | grep \\. | sed 's/domains: //g' | sed 's/  - //g' | sed 's/\./\\./g' )
do
	domaines="$domaines|$d"
done
domaines=$(echo $domaines | sed 's/^|//g');

server_name=$(ynh_app_setting_get "$app" domain)

options="-p $port:9980 -e domain=$domaines -e server_name=$server_name --cap-add MKNOD"

docker run -d --name=$app --restart always $options $image 1>&2
RT=$?

sleep 20

echo $RT
