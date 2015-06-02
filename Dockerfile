#
# This is the integrated OpenShift Origin Docker registry. It is configured to
# publish metadata to OpenShift to provide automatic management of images on push.
#
# The standard name for this image is openshift3_beta/ose-docker-registry
#
FROM docker-registry.usersys.redhat.com/openshift3_beta/ose-base:0.5.2.2_1

ADD config.yml /config.yml
RUN yum install -y openshift-dockerregistry && \
    yum clean all

ENV REGISTRY_CONFIGURATION_PATH=/config.yml DISABLE_USER_AUTH=true

EXPOSE 5000
VOLUME /registry
CMD REGISTRY_URL=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT} /usr/bin/dockerregistry /config.yml
