FROM stlhrt/consul
MAINTAINER Lukasz Wozniak

# get consul ui
ADD https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip /tmp/webui.zip
RUN cd /tmp && unzip /tmp/webui.zip && mv dist /opt/consul/ui && rm /tmp/webui.zip

# configure consul
ADD /supervisord-consul.conf /etc/supervisor/conf.d/supervisord-consul.conf
ADD /51-server.json /opt/consul/conf/51-server.json

# Cleanup test
RUN apt-get -qq clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV CLUSTER_SIZE 1

EXPOSE 8301 8302 8300 8500 53
CMD ["supervisord", "-n"]