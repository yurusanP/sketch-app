docker build --platform=linux/amd64 --pull --rm -f "Dockerfile" -t sketchapp:latest "."
docker run --platform=linux/amd64 -it --rm sketchapp:latest
