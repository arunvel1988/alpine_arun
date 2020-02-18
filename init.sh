#!/bin/sh
  su solr -c "bin/solr -cloud"
  
  su solr -c 'while :; do echo "Init loop ."; sleep 1; done'
