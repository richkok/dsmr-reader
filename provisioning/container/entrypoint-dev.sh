#!/bin/sh

# Trigger an error if non-zero exit code is encountered
set -e

# Only installs the current lock file state.
uv sync

# This could collide if you happen to work on a migration yourself and you restart the container.
uv run /app/src/manage.py migrate --noinput

# Reset password.
uv run /app/src/manage.py dsmr_superuser

# E.g. "uv run /app/src/manage.py runserver 8000"
echo "Running: ${@}"
exec ${@}
