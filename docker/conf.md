## conf

### change data-directory


TL;DR
1. `sudo systemctl stop docker` ou `sudo service stop docker` 

2. `sudo vim /etc/docker/daemon.json` 

```
{
	"data-root": "/new/path"
}
```

(par défaut le fichier `daemon.json` n'existe pas)

3.

```
sudo mkdir -m 711 /new/path
sudo rsync -aP /var/lib/docker/ /new/path
sudo mv /var/lib/docker /var/lib/docker.old
```

4. `sudo systemctl start docker` ou `sudo service start docker` 

source:
+ https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/
+ https://docs.docker.com/config/daemon/systemd/
