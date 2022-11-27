# Dockerfile
FROM registry.access.redhat.com/ubi8/nodejs-16:latest

# set destination work directory
WORKDIR /opt/app-root/src

# copy the app, note .dockerignore
# COPY . /opt/app-root/src
COPY . /opt/app-root/src
RUN chmod 666 /opt/app-root/src/*.json

RUN whoami
RUN id
RUN ls -al
RUN npm install
RUN npm run build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "start" ]
