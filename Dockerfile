FROM httpd:2.4
COPY . /usr/local/apache2/htdocs/

# SSL set-up
COPY server.crt /usr/local/apache2/conf/
COPY server.key /usr/local/apache2/conf/
COPY site.conf /usr/local/apache2/sites-enabled/
RUN sed -i \
		-e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
		-e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
		-e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
		conf/httpd.conf