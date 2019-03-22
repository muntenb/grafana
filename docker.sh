#!/bin/bash

function run {
docker run -d -p 3000:3000 --name grafana \
	--volume grafana-storage:/var/lib/grafana \
	grafana/grafana
}

function create_storage {
docker volume create grafana-storage
}

if [[ $# -ne 1 ]]; then
	echo 'Usage: ./docker.sh (run|create_storage)'
elif [[ $1 = "run" ]]; then
	run
elif [[ $1 = "create_storage" ]]; then
	create_storage
else
	echo "Unknown keyword $1"
fi
