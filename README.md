# mydicebot-docker
MyDiceBot Docker Files

*** 
Currently this is using my repository for mydicebot, my repo contains enhancements and bug fixes. 
Presently the official mydicebot repo does not work with Docker due to absolute URLs being used. 
My scripts are also being used in this example.
To use the offical builds just change the respective APP_REPO_URL to 

https://github.com/mydicebot/mydicebot.github.io.git

***

Enviromental Varaibles:

| Variable Name | Value
| ------------- |:-------------
|  APP_REPO_URL    | https://github.com/CodeCASH-Things/mydicebot.github.io.git
|  SCRIPT_REPO_URL      | https://github.com/CodeCASH-Things/mydicebot-scripts.git 


Basic Usage:


```
git clone https://github.com/CodeCASH-Things/mydicebot-docker.git

docker build -t codecash-mydicebot mydicebot-docker

docker run -d \
 -p 57432:57432 \
 -v $(pwd)/app:/app \
 -v $(pwd)/script:/script \
 -e APP_REPO_URL=https://github.com/CodeCASH-Things/mydicebot.github.io.git \
 -e SCRIPT_REPO_URL=https://github.com/CodeCASH-Things/mydicebot-scripts.git \
 codecash-mydicebot

```


Docker Compose Usage:

```
version: '2'

services:
  dicebot-dev:
    image: codecash-mydicebot-docker:latest
    container_name: dicebot-dev
    environment:
      - APP_REPO_URL:"https://github.com/CodeCASH-Things/mydicebot.github.io.git"
      - SCRIPT_REPO_URL="https://github.com/CodeCASH-Things/mydicebot-scripts.git"
    volumes:
      - dicebot_data:/app
      - dicebot_script:/script
    networks:
        - bot_network
    ports:
      - 32787:57432
      

networks:
   - bot_network
      
      
      
volumes:
   dicebot_data:
     driver: local
     
   dicebot_script:
     driver: local
```
