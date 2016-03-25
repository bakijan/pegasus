#!/bin/bash

PEG_ROOT=$(dirname ${BASH_SOURCE})/..

CLUSTER_NAME=test-cluster

peg up ${PEG_ROOT}/examples/spark_master.yml &
peg up ${PEG_ROOT}/examples/spark_workers.yml &

wait

peg fetch ${CLUSTER_NAME}

peg install ${CLUSTER_NAME} ssh
peg install ${CLUSTER_NAME} aws
peg install ${CLUSTER_NAME} spark

peg port-forward ${CLUSTER_NAME} 1 7777:7777
