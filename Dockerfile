FROM alpine:3.11

# Install requirements
RUN apk add --no-cache curl jq git openssh-client bash ca-certificates

RUN mkdir -p ~/.ssh && touch ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa

ENV TERRAFORM_VERSION 0.12.24

RUN wget https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /bin \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY ./compliant_check /deploy
COPY ./deploy.sh /deploy

WORKDIR /deploy

ENTRYPOINT ["/bin/bash", "deploy.sh"]
CMD [  ]
