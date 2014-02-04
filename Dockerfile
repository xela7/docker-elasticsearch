FROM ubuntu_base 

MAINTAINER GlobAllomeTree "globallometree@fao.org"

# elasticsearch
RUN curl http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/0.90.11/debian stable main" >> /etc/apt/sources.list
RUN apt-get -qq update && apt-get install -y elasticsearch
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD ["supervisord", "-n"]
