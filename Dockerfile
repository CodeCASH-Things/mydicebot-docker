FROM node:latest

MAINTAINER CodeCASH



ENV REPO_URL="https://github.com/CodeCASH-Things/mydicebot.github.io.git"
ENV APP_PATH="/app"
ENV SCRIPT_PATH="/script"

WORKDIR ${APP_PATH}

ADD entrypoint.sh /entrypoint.sh


EXPOSE 57432

CMD ["node","./src/index.js"] 

ENTRYPOINT ["/entrypoint.sh"]






