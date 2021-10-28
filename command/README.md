# cmd

## Port already binded

```
sudo netstat -lntp
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
