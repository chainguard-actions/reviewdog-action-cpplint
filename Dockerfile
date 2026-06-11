FROM python:3.14-alpine

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache --update add git \
    && rm -rf /var/cache/apk/*

# install reviewdog
# The URL is pinned to a specific commit SHA for content integrity.
# The script is downloaded to a file first and executed separately (not piped to sh).
ENV REVIEWDOG_VERSION=v0.21.0
RUN wget -q -O /tmp/reviewdog-install.sh https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh \
    && sh /tmp/reviewdog-install.sh -b /usr/local/bin/ ${REVIEWDOG_VERSION} \
    && rm /tmp/reviewdog-install.sh

# install cpplint
RUN pip install cpplint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
