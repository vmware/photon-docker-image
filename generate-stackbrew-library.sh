#!/bin/bash
set -e

cd "$(dirname "$(greadlink -f "$BASH_SOURCE")")"

latest=`cat latest`
versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( release-dockerfiles/* )
fi
versions=( "${versions[@]%/}" )
url='git://github.com/frapposelli/photon-docker-image'

cat <<-'EOH'
# maintainer: Fabio Rapposelli <fabio@vmware.com> (@frapposelli)
EOH

commitRange='master..dist'
commitCount="$(git rev-list "$commitRange" --count 2>/dev/null || true)"
if [ "$commitCount" ] && [ "$commitCount" -gt 0 ]; then
	echo
	echo '# commits:' "($commitRange)"
	git log --format=format:'- %h %s%n%w(0,2,2)%b' "$commitRange" | sed 's/^/#  /'
fi

for version in "${versions[@]}"; do
  tag=$(basename $version)
	commit="$(git log -1 --format='format:%H' -- "$tag")"
	echo
	echo "# $version"
	echo "$tag: ${url}@${commit} $tag"
  if [ "$tag" == "$latest" ]; then
    echo "latest: ${url}@${commit} $tag"
  fi
done
