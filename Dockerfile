FROM alpine
MAINTAINER mwaeckerlin
ARG wwwuser="nginx"
ARG lang="en_US.UTF-8"

# change in childern:
ENV CONTAINERNAME     "very-base"

ENV WWWUSER           "${wwwuser}"
ENV RUN_USER          "somebody"
ENV RUN_GROUP         "somebody"
ENV RUN_HOME          "/home/somebody"

ENV LANG              "${lang}"
ENV SHARED_GROUP_NAME "shared-access"
ENV SHARED_GROUP_ID   "500"
ENV PS1               '\[\033[36;1m\]\u\[\033[97m\]@\[\033[32m\]${CONTAINERNAME}[\[\033[36m\]\h\[\033[97m\]]:\[\033[37m\]\w\[\033[0m\]\$ '

RUN addgroup -g $SHARED_GROUP_ID $SHARED_GROUP_NAME \
 && addgroup "${RUN_GROUP}" \
 && adduser -S -D -G "${RUN_GROUP}" "${RUN_USER}" \
 && adduser ${RUN_USER} ${SHARED_GROUP_NAME} \
 && apk upgrade --no-cache --purge --clean-protected

# allow derieved images to overwrite the language
ONBUILD ARG lang
ONBUILD ENV LANG=${lang:-${LANG}}
