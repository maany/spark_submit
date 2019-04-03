#!/bin/bash
docker build -t spark_submit_sh_pre_config ./sh/pre_config/
docker run -it -e "EXECUTION_ID=2" -v $(pwd)/:/component_repository spark_submit_sh_pre_config bash