# Dockerfile
FROM registry.access.redhat.com/ubi8/nodejs-16:latest

# set destination work directory
WORKDIR /opt/app-root/src

# copy the app sorces
COPY . /opt/app-root/src

RUN npm install -loglevel silent
RUN npm run build

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

EXPOSE 3000

CMD [ "npm", "start", "-loglevel silent" ]
