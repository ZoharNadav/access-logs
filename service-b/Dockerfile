FROM nginx

RUN apt-get update && apt-get install -y wget && \
wget https://aka.ms/downloadazcopy-v10-linux && \
tar -xvf downloadazcopy-v10-linux && \
cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

COPY index.html /usr/share/nginx/html/index.html

COPY . .

RUN rm -f /var/log/nginx/access.log

RUN apt-get update && apt-get install -y cron && service cron start && \
echo "*/5 * * * * bash /start.sh" >> mycron \
&& crontab mycron && rm mycron

CMD ["bash" , "script.sh"]

