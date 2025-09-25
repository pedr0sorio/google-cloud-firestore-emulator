#!/usr/bin/env bash

# Check user environment variable
if [[ -z "${FIRESTORE_PROJECT_ID}" ]]; then
  echo "Missing FIRESTORE_PROJECT_ID environment variable" >&2
  exit 1
fi

# Check user environment variable
if [[ -z "${FIRESTORE_PORT}" ]]; then
  FIRESTORE_PORT=8080
  echo "Missing FIRESTORE_PORT environment variable. Set default one to ${FIRESTORE_PORT}" >&2
fi

# Config gcloud project
gcloud config set project "${FIRESTORE_PROJECT_ID}"

# Start emulator
gcloud emulators firestore start --host-port=0.0.0.0:${FIRESTORE_PORT}
