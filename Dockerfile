FROM base:v2
MAINTAINER testge
ADD ./target/platform-0.0.1-SNAPSHOT.jar  demo.jar
EXPOSE 7778
ENTRYPOINT ["java","-jar","demo.jar"]
