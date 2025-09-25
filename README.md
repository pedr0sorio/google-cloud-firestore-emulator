# Firestore Emulator

Docker container for running Google Cloud Firestore emulator locally. Built out of necessity because [mtlynch/firestore-emulator-docker](https://hub.docker.com/r/mtlynch/firestore-emulator-docker), [mtlynch/firestore-emulator](https://hub.docker.com/r/mtlynch/firestore-emulator/tags) and [PathMotion/firestore-emulator-docker](https://github.com/PathMotion/firestore-emulator-docker) did not work for my set up. They were likely using outdated base Google Cloud SDK images.

This container will remain up to date since it uses the maintained google cloud cli image for emulators. See [here](https://cloud.google.com/sdk/docs/downloads-docker).

## Quick Start

```bash
# Build
docker build -t firestore-emulator .

# Run
docker run -p 8080:8080 -e FIRESTORE_PROJECT_ID=your-project-id firestore-emulator
```

## Environment Variables

- `FIRESTORE_PROJECT_ID` (required) - Your GCP project ID
- `FIRESTORE_PORT` (optional) - Port to run on (default: 8080)

## Usage

Set emulator host in your application:
```bash
export FIRESTORE_EMULATOR_HOST=localhost:8080
```

Or in Python:
```python
import os
os.environ["FIRESTORE_EMULATOR_HOST"] = "localhost:8080"
```