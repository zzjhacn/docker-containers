#!/bin/sh
[ -z "$2" ] && echo "Usage : $0 [app_name] [port]" && exit 1

port=9999
[ -n "$2" ] && port=$2

base_dir=/opt/apps/$1

echo "Initializing app[$1] with tomcat on port[$port]..."

mkdir -p $base_dir/tomcat_conf
mkdir -p $base_dir/tomcat_log
mkdir -p $base_dir/app
mkdir -p $base_dir/app/ROOT

# --tlscacert=~/.docker/ca.pem
echo "
docker run -d --privileged=true --restart always \\
  -p $port:8080 \\
  -v $base_dir/tomcat_conf:/tomcat/conf:Z \\
  -v $base_dir/tomcat_log:/usr/local/tomcat/logs:Z \\
  -v $base_dir/app:/usr/local/tomcat/webapps:Z \\
  --name $1 zzjhacn/tomcat9jdk8
" > $base_dir/dockerrun.sh

echo "
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Redirecting...</title>
    <meta http-equiv='refresh' content='0.2;url=/$1'>
    <script type='text/javascript'>
      window.location.href='/$1';
    </script>
  </head>
  <body>
    If web page not redirect to automatically, you can <a href='/$1'>click here</a> to go.
  </body>
</html>
" > $base_dir/app/ROOT/index.html

echo "Done!
You can run [ $base_dir/dockerrun.sh ] when place your war file into dir [ $base_dir/app/ ].
Docker container named[$1] will listen on local port $port.
"
