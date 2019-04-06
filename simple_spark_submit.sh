#!/bin/bash
docker stop simple_spark_submit && docker rm simple_spark_submit
### BOOT EVENT ###
sudo docker build -t simple_spark_submit sh/
sudo docker run -itd \
    --name simple_spark_submit \
    --privileged \
    -p 8081:8081 \
    -v $(pwd)/sh/config:/etc/simple_grid/config \
    -v $(pwd)/augmented_site_level_config_file.yaml:/etc/simple_grid/augmented_site_level_config_file.yaml \
    simple_spark_submit \
#### PRE INIT HOOKS #####


### INIT EVENT ######
sudo docker exec -t simple_spark_submit /etc/simple_grid/config/init.sh
sudo docker exec -it simple_spark_submit bash
#### POST INIT HOOKS ######