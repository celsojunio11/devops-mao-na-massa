FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -S notes -G notes
USER notes:notes
ENV MAVEN_VERSION 3.5.4
ENV MAVEN_HOME /usr/lib/mvn 
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \ 
          tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
          rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
          mv apache-maven-$MAVEN_VERSION /usr/lib/mvn 
ARG JAR_FILE=*.jar 
COPY ${JAR_FILE} easy-note.jar
COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/easy-note.jar"]