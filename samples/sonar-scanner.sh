#!/bin/bash

export SONAR_SCANNER_VERSION=4.7.0.2747
export SONAR_SCANNER_HOME=$PWD/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux
curl --create-dirs -sSLo $PWD/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip
unzip -o $PWD/.sonar/sonar-scanner.zip -d $PWD/.sonar/
export PATH=$SONAR_SCANNER_HOME/bin:$PATH
export SONAR_SCANNER_OPTS="-server"

if [ ! -z $SONAR_TOKEN]; then exit 1; fi

sonar-scanner \
  -Dsonar.organization=alxito-corps \
  -Dsonar.projectKey=git-secure-workshop \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io
