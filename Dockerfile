FROM node:latest
 
ENV NODE_VERSION stable
ENV NPM_SCRIPT start
ENV GIT_URL https://github.com/janhajk/tradetracker.git
ENV LOG true
ENV APP_PORT 8080
ENV SQLHOST db
ENV SQLPORT 3307
ENV SQLUSER root
ENV SQLPSW 1234
ENV SQLDB tradetracker
ENV UID 1
ENV USER jan
ENV PSW 1234
ENV COOKIESECRET oq3r87gh38rhq0r87fqh039487vbdoiie
ENV CRONSECRET fsoiufhr78osdvih932regdfdvt74r
ENV APIOKEX_KEY 1234
ENV APIOKEX_SECRET 1234

 
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