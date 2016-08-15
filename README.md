Probably run it like:

`docker run -p 80:80 -v /host/phpdocroot:/usr/share/nginx/html/ dpedu/nginxfpm`

And optionally:

`-v /host/nginx_site_config:/etc/nginx/sites-enabled/default`
