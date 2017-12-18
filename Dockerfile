FROM golang:1.9

ENV CLOUD_SDK_URL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-170.0.1-linux-x86_64.tar.gz
ENV PATH $PATH:/google-cloud-sdk/bin

RUN apt-get update && apt-get install -y \
  libmecab2 \
  libmecab-dev \
  mecab \
  mecab-utils \
  parallel \
  awscli \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN curl -o google-cloud-sdk.tar.gz ${CLOUD_SDK_URL} \
  && tar zxf google-cloud-sdk.tar.gz \
  && mv google-cloud-sdk /google-cloud-sdk \
  && /google-cloud-sdk/install.sh \
  && gcloud components update -q

RUN go get github.com/golang/dep/cmd/...
