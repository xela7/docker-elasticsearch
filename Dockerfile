FROM ubuntu_base 

MAINTAINER GlobAllomeTree "globallometree@fao.org"

# elasticsearch
RUN curl http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main" >> /etc/apt/sources.list
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y elasticsearch

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

CMD ["supervisord", "-n"]
