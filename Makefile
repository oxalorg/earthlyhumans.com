.PHONY: deploy

deploy:
	ssh -t ark "cd /var/www/earthlyhumans.com &&\
		git pull && \
		./hugo"

nginx:
	ssh -t ark "cd /var/www/earthlyhumans.com/conf && \
		cp earthlyhumans.com.conf /etc/nginx/sites-available/earthlyhumans.com.conf && \
		ln -s earthlyhumans.com.conf /etc/nginx/sites-enabled/ && \
		sudo nginx -t && sudo nginx -s reload"
