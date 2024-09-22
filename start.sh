#!/bin/bash
BASEDIR="$HOME"
PROFILE="$1"
DOWNLOADS="${HOME}/Downloads"
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
	   andzuc/debian-secff:12.7.44.20240922.10
else
    echo "Profile not found: ${PROFILE}"
fi
