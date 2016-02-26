#!/bin/sh

exec 2>&1
set -e


# Setting up ElasticSearch
sed    -i     's/es_cluster//'     elasticsearch.yml
sed    -i     's/es_data_path//'    elasticsearch.yml
sed    -i     's/es_log_path//'    elasticsearch.yml
sed    -i     's/es_network_host//'    elasticsearch.yml
sed    -i     's/es_http_port//'    elasticsearch.yml
sed    -i     's/es_unicast//'    elasticsearch.yml

# Starting the elasticsearch
exec   /bin/sh service   elasticsearch   start

