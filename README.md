# Firestore Emulator

Docker container for running Google Cloud Firestore emulator locally. Built out of necessity because [mtlynch/firestore-emulator-docker](https://hub.docker.com/r/mtlynch/firestore-emulator-docker), [mtlynch/firestore-emulator](https://hub.docker.com/r/mtlynch/firestore-emulator/tags) and [PathMotion/firestore-emulator-docker](https://github.com/PathMotion/firestore-emulator-docker) did not work for my set up. They were likely using outdated base Google Cloud SDK images.

This container will remain up to date since it uses the maintained google cloud cli image for emulators. See [here](https://cloud.google.com/sdk/docs/downloads-docker).

## Docker Hub

Available on Docker Hub: [pedr0sorio99/google-cloud-firestore-emulator](https://hub.docker.com/r/pedr0sorio99/google-cloud-firestore-emulator)

```bash
# Pull and run directly from Docker Hub
docker run -p 8080:8080 -e FIRESTORE_PROJECT_ID=your-project-id pedr0sorio99/google-cloud-firestore-emulator
```

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

## Publishing

To publish this image to Docker Hub with AMD64 architecture:

```bash
# Build for AMD64 architecture
docker build --platform linux/amd64 -t pedr0sorio99/google-cloud-firestore-emulator:latest .

# Tag with version
docker tag pedr0sorio99/google-cloud-firestore-emulator:latest pedr0sorio99/google-cloud-firestore-emulator:1.0.0

# Login to Docker Hub
docker login

# Push both tags
docker push pedr0sorio99/google-cloud-firestore-emulator:latest
docker push pedr0sorio99/google-cloud-firestore-emulator:1.0.0
```

**Note:** Use `docker build` (not `docker buildx`) to avoid potential certificate issues with custom builders.