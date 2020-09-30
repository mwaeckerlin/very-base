FROM alpine AS alpine
FROM mwaeckerlin/scratch
MAINTAINER mwaeckerlin
ARG lang="en_US.UTF-8"

ENV CONTAINERNAME "very-base"
COPY --from=alpine / /
RUN addgroup -g $SHARED_GROUP_ID $SHARED_GROUP_NAME \
 && addgroup "${RUN_GROUP}" \
 && adduser -S -D -G "${RUN_GROUP}" "${RUN_USER}" \
 && adduser ${RUN_USER} ${SHARED_GROUP_NAME} \
 && apk upgrade --no-cache --purge --clean-protected
CMD ["/bin/sh"]

# allow derieved images to overwrite the language
ONBUILD ARG lang
ONBUILD ENV LANG=${lang:-${LANG}}
