# Build from the Google Cloud SDK image with Firestore emulator. See:
# https://cloud.google.com/sdk/docs/downloads-docker
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:emulators

COPY start-firestore.sh .

RUN chmod +x start-firestore.sh

# Expose the default port
EXPOSE 8080

ENTRYPOINT ["./start-firestore.sh"]