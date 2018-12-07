FROM gcc:latest
ADD ../code/gcc/ /usr/src/myapp/
WORKDIR /usr/src/myapp
# RUN sh run.sh
RUN chmod 777 myapp
ENTRYPOINT ["./myapp"]
