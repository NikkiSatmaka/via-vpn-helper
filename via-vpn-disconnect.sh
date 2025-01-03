#!/usr/bin/env bash

# Configuration
VIA_CLI="/usr/bin/via-cli"

# Disconnect VPN
echo "Disconnecting VPN..."
# Check status
if ! $VIA_CLI vpn disconnect; then
  echo "Failed to disconnect the VPN. Exiting."
  exit 1
fi

# Start a new VIA session
echo "Stopping VIA session..."
if ! $VIA_CLI session stop; then
  echo "Failed to stop VIA session. Exiting."
  exit 1
fi

echo "VPN disconnected successfully!"
