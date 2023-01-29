#!/bin/bash
BASEDIR="$HOME"
PROFILE="$1"
DOWNLOADS=/opt/vbox/media/shared/downloads
ABSBASEDIR="$(realpath $BASEDIR)"
PROFILEDIR="${ABSBASEDIR}/secffprofile/${PROFILE}"
LIBGL_ALWAYS_INDIRECT=1

if [ -d "${PROFILEDIR}" ] ; then
    docker run --name "firefox-${PROFILE}" --rm --net=host \
	   --ipc private \
	   --shm-size 2g \
	   --env="DISPLAY" \
	   -v "${HOME}/.Xauthority:/home/surfer/.Xauthority:rw" \
	   -v "${PROFILEDIR}:/home/surfer/profile:rw" \
	   -v "${DOWNLOADS}:/home/surfer/Downloads:rw" \
	   andzuc/debian-secff:2020012800
else
    echo "Profile not found: ${PROFILE}"
fi
