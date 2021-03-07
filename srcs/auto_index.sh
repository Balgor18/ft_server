if ((ps -ef | grep -v grep | grep nginx | wc -l) > 0 )
	then if [ "$AUTOINDEX" = "off" ]
		then cp /tmp/server_auto_off.conf /etc/nginx/sites-available/default;
	else
		cp /tmp/nginx.conf /etc/nginx/sites-available/default;
	fi
	service nginx reload
fi