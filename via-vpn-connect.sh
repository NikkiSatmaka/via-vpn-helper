#!/usr/bin/env bash

# Load environment variables from the .env file
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ENV_FILE="$SCRIPT_DIR/.env"

if [[ -f "$ENV_FILE" ]]; then
  set -o allexport # Enable exporting of all variables
  # shellcheck source=/dev/null
  source "$ENV_FILE"
  set +o allexport # Disable exporting of all variables
else
  echo "Environment file ($ENV_FILE) not found. Exiting."
  exit 1
fi

# Configuration
VIA_CLI="/usr/bin/via-cli"

# Start a new VIA session
echo "Starting VIA session..."
if ! $VIA_CLI session start; then
  echo "Failed to start VIA session. Exiting."
  exit 1
fi

# Initiate VPN connection in an interactive shell
echo "Initiating VPN connection. Please authorize the OTP on your smartphone."
if ! sh -c "$VIA_CLI vpn connect --username $VIA_USER --userpass $VIA_PASS"; then
  echo "Failed to connect to the VPN. Exiting."
  exit 1
fi

echo "VPN connection successful!"
