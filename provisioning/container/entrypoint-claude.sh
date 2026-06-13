#!/bin/sh

# Trigger an error if non-zero exit code is encountered
set -e

# Only installs the current lock file state.
uv sync

echo "Running: ${@}"
exec ${@}
