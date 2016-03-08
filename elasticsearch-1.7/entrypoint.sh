#!/bin/sh

exec chpst -P -U elasticsearch -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch --default.path.conf=/etc/elasticsearch

