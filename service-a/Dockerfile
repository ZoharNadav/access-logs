FROM nginx

RUN apt-get update && apt-get install -y wget && \
wget https://aka.ms/downloadazcopy-v10-linux && \
tar -xvf downloadazcopy-v10-linux && \
cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

COPY nginx.conf /etc/nginx/ 

COPY index.html /usr/share/nginx/html/

COPY rotate.sh start.sh ./

RUN mkdir -p /var/log/nginx/logs-per-minute && chmod u+x rotate.sh

RUN rm -f /var/log/nginx/access.log

RUN apt-get update && apt-get install -y cron && service cron start && \
echo "* * * * * bash /rotate.sh" >> mycron \
&& crontab mycron && rm mycron

CMD ["bash", "start.sh"]

