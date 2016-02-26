# Specifing the base image
FROM        vaibhavtodi/ubuntu_java:latest

# Maintainer
MAINTAINER  "Vaibhav Todi" <vaibhavtodi1989@gmail.com>

# Specifing the Label
LABEL       Description="Elasticsearch Docker image"                                               \
            Version="1.7"

# Setting the Environment Variables
ENV         ES_CLUSTER_NAME=graylog                                                                   \
            ES_DATA_PATH=/var/lib/elasticsearch
            ES_LOG_PATH=/var/log/elasticsearch
            ES_NETWORK_HOST=0.0.0.0
            ES_HTTP_PORT=9200
            ES_UNICAST=

# Downloading & Installing the Elasticsearch package using curl
RUN         wget   -qO -  https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -   \
       &&   echo          echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-1.7.list  \
       &&   apt-get       update                                                                   \
       &&   apt-get       install   -y   elasticsearch

# Clearing the Docker image
RUN        apt-get   -y    clean                                                                   \
      &&   rm        -rf   /var/lib/apt/lists/*                                                    \
      &&   rm        -rf   /var/cache/*

# Copying the Entrypoint Script
COPY     entrypoint.sh     /entrypoint.sh

# Copying the Elasticsearch default configuration file
COPY     elasticsearch.yml /etc/elasticsearch/elasticsearch.yml 

# Exposing the Ports 
EXPOSE   9200     9300

# Mounting the log & data directory
VOLUME ["/var/lib/elasticsearch", "/var/log/elasticsearch"]

# Specifing the entrypoint
CMD ["/entrypoint.sh"]
