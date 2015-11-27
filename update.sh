#!/bin/bash
set -ex

cd "$(dirname "$BASH_SOURCE")"

IFS=', ' read -r -a array <<< "$string"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( release-dockerfiles/* )
fi
versions=( "${versions[@]%/}" )

for v in "${versions[@]}"; do
  tag=$(basename $v)
  echo "Building ${tag}"
  cd "$v"
  docker build --rm -t build-photon:${tag} .
  cd -
  [ -d ${tag} ] || mkdir ${tag}
  cd $tag
  docker run --rm build-photon:${tag} | tar -xpf -
  cd -
done
