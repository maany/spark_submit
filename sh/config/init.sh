#!/bin/bash

echo "Initializing the Spark Submit Container"
trap '' HUP
cat /etc/simple_grid/config/spark_env.conf >> ~/.bashrc
# Add the PySpark classes to the PYTHONPATH:
if [ -z "${PYSPARK_PYTHONPATH_SET}" ]; then
  export PYTHONPATH="${SPARK_HOME}/python:${PYTHONPATH}" >> ~/.bashrc
  export PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.7-src.zip:${PYTHONPATH}" >> ~/.bashrc
  export PYSPARK_PYTHONPATH_SET=1 >> ~/.bashrc
fi

source ~/.bashrc
echo "Copying spark-defaults.conf to /spark/conf"
cp /etc/simple_grid/config/spark-defaults.conf /spark/conf/

echo "All Set!"
