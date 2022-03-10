# cmd

- [Mount](#mount)

## Port already binded

```
sudo netstat -lntp
sudo lsof -i -P -n | grep LISTEN | grep 4000
sudo netstat -tulpn | grep LISTEN
sudo ss -tulpn | grep LISTEN
sudo lsof -i:22
sudo nmap -sTU -O IP-address-Here
```

## Copy ssh key

```
cat ~/.ssh/id_rsa.pub | ssh user@ip_machine "cat - >> ~/.ssh/authorized_keys"
```

## upgrade a .deb already installed

```
sudo cp *.deb /var/cache/apt/archives/
apt-get upgrade
```

## sometimes the text menu disapear

Alt+F2 and then type r and confirm with enter - this will restart gnome-shell -- perhaps this helps avoiding restarts 

## search patern

```
grep -rnw '/path/to/somewhere/' -e 'pattern'
```

## du

```
du -sh ./*/
```

## find

```
find . -name thisfile.txt
```

## json

```
jq or python3 -m json.tool
```

## mount

```
mkfs.ext4 /dev/sda # if block has not ext4
sudo mount /dev/sda /docker
```
