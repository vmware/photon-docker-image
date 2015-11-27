# tl;dr: NO PULL REQUESTS PLEASE
## OPEN ISSUES TO DISCUSS CHANGES

Git is not a fan of what we're doing here.  To combat this, we use
`git checkout --orphan`, which very effectively discards all the history of
the branch for each tarball.  The benefit is much shorter download times,
since there's no big binary history.

Please feel free to open issues and discuss these images.  I've
intentionally left the issue tracker here open for just such discussion!
However, please do not submit pull requests.

(blatantly stolen from [Tianon](https://github.com/tianon)'s [CONTRIBUTING.md file](https://github.com/tianon/docker-brew-ubuntu-core/blob/master/CONTRIBUTING.md))
