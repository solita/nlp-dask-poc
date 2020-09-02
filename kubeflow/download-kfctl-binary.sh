#!/usr/bin/env bash

BASEDIR=$(cd $(dirname $0); /bin/pwd)

echo "This will download kfctl binary version 1.1.0 for MacOS from kubeflow Github releases page."
echo "Download will start in 7 seconds."
echo "Press CTRL + C to abort now."

#sleep 7

(
  cd $BASEDIR

  api=https://api.github.com/repos
  owner=kubeflow
  repo=kfctl

  # curl \
  #   -H "Accept: application/vnd.github.v3+json" \
  #   $api/$owner/$repo/releases

  curl --remote-name --location https://github.com/$owner/$repo/releases/download/v1.1.0/kfctl_v1.1.0-0-g9a3621e_darwin.tar.gz

  sleep 1

  tar zxvf kfctl_v1.1.0-0-g9a3621e_darwin.tar.gz
  rm kfctl_v1.1.0-0-g9a3621e_darwin.tar.gz

  echo "Downloaded and extracted kfctl binary to $BASEDIR/kfctl"
)

