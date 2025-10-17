#!/bin/bash
set -e

# Configure the GitHub self-hosted runner
./config.sh --unattended \
  --url https://github.com/Asritha03/github_lab \
  --token ${RUNNER_TOKEN} \
  --labels docker-runner \
  --name $(hostname)

# Cleanup function for graceful shutdown
cleanup() {
  echo "Removing runner..."
  ./config.sh remove --unattended --token ${RUNNER_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

# Start the runner
./run.sh

