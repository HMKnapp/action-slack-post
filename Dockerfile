FROM python:3.8-alpine

LABEL maintainer="Herbert Knapp <herbert.knapp@wirecard.com>; Lukas Deutz <lukas.deutz@wirecard.com>"
LABEL repository="https://github.com/hkp-wcd/action-slack-post"

LABEL com.github.actions.name="Post To Slack Github Action"
LABEL com.github.actions.description="Github Action Post to Slack"

RUN apk add --no-cache bash curl
RUN pip install pygit2

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
