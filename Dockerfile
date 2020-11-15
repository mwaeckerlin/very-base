FROM alpine AS alpine
RUN apk upgrade --no-cache --purge --clean-protected

FROM mwaeckerlin/scratch AS user

FROM mwaeckerlin/scratch
ARG lang="en_US.UTF-8"

ENV CONTAINERNAME "very-base"
COPY --from=alpine / /
COPY --from=user /etc/passwd /etc/passwd
COPY --from=user /etc/group /etc/group
CMD ["/bin/sh"]
USER root

# allow derieved images to overwrite the language
ONBUILD ARG lang
ONBUILD ENV LANG=${lang:-${LANG}}
