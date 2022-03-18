FROM node:latest
WORKDIR .
COPY nodeapp/* /
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]
