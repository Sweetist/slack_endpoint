#!/bin/bash
set -e

# check for the expected command
if [ "$1" = 'start' ]; then
	foreman start
fi

# else default to run whatever the user wanted like "bash"
exec "$@"
