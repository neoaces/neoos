FROM arm64v8/alpine:3.14
COPY build/out /data/main
RUN chmod +x /data/main
CMD ["bin/sh", "/data/main"]