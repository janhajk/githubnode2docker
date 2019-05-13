FROM node:latest
 
ENV NODE_VERSION stable
ENV NPM_SCRIPT start
ENV GIT_URL https://github.com/janhajk/tradetracker.git
ENV APP_PORT 8080
 
ENV APP_HOME .
ENV APP_STARTUP "app.js"
# JUST_RUN specifies whether node should be installed and git should be cloned
ENV JUST_RUN N
 
COPY ./docker-work /code
 
WORKDIR /code
 
#RUN chown -R app:app /code/*
RUN chmod +x /code/bootstrap.sh
 
RUN npm install -g n --silent
RUN n stable
 
ENTRYPOINT ["/code/bootstrap.sh"]