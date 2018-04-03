FROM openjdk:jre-alpine

ENV sbt_version 0.13.16
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin

# Install sbt
RUN apk add --no-cache --update bash wget tar && \
    mkdir -p "$sbt_home" && \
    wget -qO - --no-check-certificate "https://cocl.us/sbt-0.13.16.tgz" |  tar xz -C $sbt_home --strip-components=1 && \
    apk del wget && \
    sbt sbtVersion
    
WORKDIR /app
