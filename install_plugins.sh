#!/bin/bash

JENKINS_SERVER="http://192.168.39.132:8080"

java -jar jenkins-cli.jar -s $JENKINS_SERVER install-plugin git pipeline-maven chucknorris ws-cleanup

java -jar jenkins-cli.jar -s $JENKINS_SERVER safe-restart



