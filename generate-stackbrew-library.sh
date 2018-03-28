#!/bin/bash
set -e

versions="2.0 1.0"

self="$(basename "$BASH_SOURCE")"

# get the most recent commit which modified any of "$@"
fileCommit() {
  git log -1 --format='format:%H' HEAD -- "$@"
}

cat > photon << EOF
# this file is generated via https://github.com/vmware/photon-docker-image/blob/$(fileCommit "$self")/$self

Maintainers: Fabio Rapposelli <fabio@vmware.com> (@frapposelli),
             Alexey Makhalov <amakhalov@vmware.com> (@YustasSwamp)
GitRepo: https://github.com/vmware/photon-docker-image.git
Directory: docker

EOF

latestTag=", latest"

for version in $versions ; do
  extraTags=", $version$latestTag"
  latestTag=""
  git ls-remote --heads origin $version\* | sort -r -k2 | while read branchLine ; do
    branch=${branchLine: -12}
    commit=${branchLine:0:40}
    echo "Tags: $branch$extraTags" >> photon
    echo "GitFetch: refs/heads/$branch" >> photon
    echo "GitCommit: $commit" >> photon
    echo >> photon
    extraTags=""
  done
done

cat >> photon << EOF
Tags: 1.0GA
GitFetch: refs/heads/dist
GitCommit: 2043d10673cdb19ef656cbe0686e62345f4517b2
EOF
