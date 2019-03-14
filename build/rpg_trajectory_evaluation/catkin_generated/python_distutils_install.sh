#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/xiangyu/Library/IISLAM/src/rpg_trajectory_evaluation"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/xiangyu/Library/IISLAM/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/xiangyu/Library/IISLAM/install/lib/python2.7/dist-packages:/home/xiangyu/Library/IISLAM/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/xiangyu/Library/IISLAM/build" \
    "/usr/bin/python" \
    "/home/xiangyu/Library/IISLAM/src/rpg_trajectory_evaluation/setup.py" \
    build --build-base "/home/xiangyu/Library/IISLAM/build/rpg_trajectory_evaluation" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/xiangyu/Library/IISLAM/install" --install-scripts="/home/xiangyu/Library/IISLAM/install/bin"
