#!/bin/bash
# Homework 8.1
# Required:
# bash
# ansible 2.10 or later
# docker installed and configured to run without sudo privileges
# (current user should be in group 'docker')

docker run --name centos7 -d --rm pycontribs/centos:7 sleep 1200
docker run --name ubuntu -d --rm pycontribs/ubuntu:latest sleep 1200
docker run --name fedora -d --rm pycontribs/fedora:latest sleep 1200

ansible-playbook --ask-vault-pass -i inventory/prod.yml site.yml

docker ps -q | xargs docker stop

