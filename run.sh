#!/bin/sh

set -e -x

[ "$1" ] || {
    echo "Specify which flavor of busybox to build:"
    ls -d */
    exit 1
    }
[ -d "$1" ] || {
    echo "Could not find directory $1."
        exit 1
    }

docker build -t tarmaker:$1 $1/tarmaker || {
    echo "Something went wrong. Aborting."
        exit 1
    }

[ -f $1/tarmaker/rootfs.tar ] && mv $1/tarmaker/rootfs.tar $1/tarmaker/rootfs.tar.old
[ -f $1/tarmaker/rootfs.tar.md5 ] && mv $1/tarmaker/rootfs.tar.md5 $1/tarmaker/rootfs.tar.md5.old

docker run --name builder-$1 tarmaker:$1
docker cp builder-$1:/tmp/rootfs.tar $1
docker cp builder-$1:/tmp/rootfs.tar.md5 $1
sudo chown 1000:1000 $1/rootfs*

cd $1

docker rm -f builder-$1
docker rmi tarmaker:$1
docker build -t concourse/busyboxplus:$1 .
