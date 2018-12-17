Minimum Base Docker Image without Codingrule Enforcement
========================================================

Docker image as very first base, even before [mwaeckerlin/base](https://github.com/mwaeckerlin/base), Use this image as base for all your docker container only if there is a good reason for not using [mwaeckerlin/base](https://github.com/mwaeckerlin/base).

Built from Alpine Linux with nicer prompt, without defined start script and
health check.


Shared Volumes
--------------

If you need access to the same external volume path from two containers, add your user to the group specified in environment variable `SHARED_GROUP_NAME` and give access rights and ownership of the sared ressource to this group, e.g., if your user is in variable `USER`, add to `Dockerfile`:

    RUN addgroup $USER $SHARED_GROUP_NAME
    VOLUME /var/common

And add to `start.sh`:

    chgrp $SHARED_GROUP_NAME /var/common
    chmod g+rwx /var/common
