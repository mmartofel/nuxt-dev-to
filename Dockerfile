# Dockerfile
FROM registry.access.redhat.com/ubi9/nodejs-18:1-17

# set destination work directory
RUN mkdir -p /opt/app-root/src/nuxt
WORKDIR /opt/app-root/src/nuxt

# copy the app, note .dockerignore
# COPY . /opt/app-root/src
COPY . /opt/app-root/src/nuxt
RUN chmod 777 /opt/app-root/src/nuxt

RUN ls -al
RUN npm install
RUN npm run build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "start" ]
