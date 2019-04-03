#!/bin/bash

export SPARK_MASTER_URL=spark://${SPARK_MASTER_NAME}:${SPARK_MASTER_PORT}
export SPARK_HOME=/spark

/wait-for-step.sh

# /etc/simple_grid/site_config/site_level_config_file
# /etc/simple_grid/config/
# /etc/simple_grid/scripts/{pre_init or post_init}/{hook_name.sh}
cp /etc/simple_grid/config/spark-defaults.conf /spark/conf/spark-defaults.conf
