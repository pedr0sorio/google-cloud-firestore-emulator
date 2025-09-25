# Build from the Google Cloud SDK image with Firestore emulator. See:
# https://cloud.google.com/sdk/docs/downloads-docker
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:emulators

# Metadata labels for Docker Hub
LABEL maintainer="pedro.c.osorio@gmail.com" \
      description="Google Cloud Firestore Emulator for local development" \
      version="1.0.0" \
      org.opencontainers.image.source="https://github.com/pedr0sorio/google-cloud-firestore-emulator" \
      org.opencontainers.image.documentation="https://github.com/pedr0sorio/google-cloud-firestore-emulator#readme"

COPY start-firestore.sh .

RUN chmod +x start-firestore.sh

# Expose the default port
EXPOSE 8080

ENTRYPOINT ["./start-firestore.sh"]