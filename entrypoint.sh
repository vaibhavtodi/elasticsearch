#!/bin/sh

exec 2>&1
set -e

# Exporting the java path
export JAVA=/usr/lib/jvm/java-8-oracle

# Setting up ElasticSearch Configguartion file

  # Setting the Cluster name
  sed    -i     's/es_cluster/graylog/'                                /etc/elasticsearch/elasticsearch.yml

  # Setting the path for storing the data
  sed    -i     's/es_data_path/\/var\/lib\/elasticsearch/'            /etc/elasticsearch/elasticsearch.yml

  # Setting the path for storing the logs
  sed    -i     's/es_log_path/\/var\/log\/elasticsearch/'             /etc/elasticsearch/elasticsearch.yml

  # Setting the network host - IP
  sed    -i     's/es_network_host/0\.0\.0\.0/'                        /etc/elasticsearch/elasticsearch.yml

  # Setting the http port
  sed    -i     's/es_http_port/9200/'                                 /etc/elasticsearch/elasticsearch.yml

  # Setting the unicast
  sed    -i     's/es_unicast/[\"0\.0\.0\.0:9300\"]/'                  /etc/elasticsearch/elasticsearch.yml

# Starting the elasticsearch
exec service elasticsearch start
