Collabora for Yunohost
==========

[![Install Collabora with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=collabora)

Collabora Online is a powerful LibreOffice-based online office suite

To use it, please follow these steps :
 - your Docker Engine must use overlay or devicemapper driver, **don't work with aufs** (please see ``docker info``)
 - need a **dedicate domain name** (ex : collabora.example.com)
 - need a **valid certificate** (ex : letsencrypt it's ok)
 - already install **Nextcloud on the same Yunohost instance**
 - install Yunohost Collabora App
 - configure Nextcloud :
   - on app settings page, install Nextcloud Collabora App
   - on admin page, configure Collabora section to point on the dedicate domain name (ex : https://collabora.example.com)
   - Enjoy !

**[See more](https://nextcloud.com/collaboraonline/)**

This app is inside a [Docker image](https://hub.docker.com/r/collabora/code/).

-----------------

*It was generated with [DockerApp Yunohost](https://github.com/aymhce/dockerappmodel_ynh/)*
