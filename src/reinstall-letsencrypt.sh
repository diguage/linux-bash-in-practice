#!/usr/bin/env bash
#
#  Let's Encrypt 证书重新安装
#

link_file=/etc/nginx/sites-enabled/g.xiaozei.net
conf_file=/root/g.xiaozei.net/nginx.conf
auth_file=/root/g.xiaozei.net/nginx-auth.conf

restart_nginx() {
  for p in `lsof -i:80 | grep nginx | awk '{print $2}' | sort | uniq`; 
  do
    kill -9 $p;
  done

  /usr/local/nginx/nginx
}

rm -rf $link_file
ln -s $auth_file $link_file

cd /etc/letsencrypt/
rm -rf *

restart_nginx

letsencrypt certonly --webroot -w /var/www/g.xiaozei.net/ -d g.xiaozei.net

rm -rf $link_file
ln -s $conf_file $link_file

restart_nginx
