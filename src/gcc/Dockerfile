FROM ubuntu:latest
WORKDIR /usr/src/myapp
COPY ./ ./
RUN ls -l
RUN chmod +x myapp
# RUN sh run.sh
ENTRYPOINT ["./myapp"]
