#!/bin/sh
set -eu

# The shared volume is served by nginx. Copy the compiled SPA there each time
# the container starts so that a new image updates the static site on the VM.
mkdir -p /frontend_static
cp -a /app/build/. /frontend_static/

exec "$@"
