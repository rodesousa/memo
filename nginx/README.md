## nginx 

### Setup nginx not to crash if host in upstream is not found

```
 location /foo {
   resolver 127.0.0.1 valid=30s;
   # or some other DNS (your company's internal DNS server)
   #resolver 8.8.8.8 valid=30s;
   set $upstream_foo foo;
   proxy_pass http://$upstream_foo:80;
 }

 location /bar {
   resolver 127.0.0.1 valid=30s;
   # or some other DNS (your company's internal DNS server)
   #resolver 8.8.8.8 valid=30s;
   set $upstream_bar foo;
   proxy_pass http://$upstream_bar:80;
 }
```

https://stackoverflow.com/questions/32845674/setup-nginx-not-to-crash-if-host-in-upstream-is-not-found
