# mydicebot-docker
MyDiceBot Docker Files



Enviromental Varaibles:

| Variable Name | Value
| ------------- |:-------------
|  APP_REPO_URL    | https://github.com/CodeCASH-Things/mydicebot.github.io.git
|  SCRIPT_REPO_URL      | https://github.com/CodeCASH-Things/mydicebot-scripts.git 


Basic Usage:


```
git clone https://github.com/CodeCASH-Things/mydicebot-docker.git
docker build -t codecash-mydicebot mydicebot-docker
docker run -d -p 57432:57432 -v $(pwd)/app:/app -v $(pwd)/script:/script codecash-mydicebot

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
        - default
    ports:
      - 32787:57432
      

networks:
  default:
    external:
      name: bot_dev_network
      
      
      
volumes:
   dicebot_data:
     driver: local
     
   dicebot_script:
     driver: local
```
