# mydicebot-docker
MyDiceBot Docker Files


Basic Usage:


```
git clone https://github.com/CodeCASH-Things/mydicebot-docker.git
docker build -t codecash-mydicebot .
docker run -it codecash-mydicebot

```


Docker Compose Usage:

```
version: '2'

services:
  dicebot-dev:
    image: codecash-mydicebot-docker:latest
    container_name: dicebot-dev
    environment:
      - REPO_URL:"https://github.com/CodeCASH-Things/mydicebot.github.io.git"
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
