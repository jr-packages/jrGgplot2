FROM jrpackages/jrnotes

ARG jr_pkg=jrGgplot2

RUN install2.r -n -1 -d TRUE  --error $jr_pkg \
    && rm -rf /tmp/downloaded_packages/
