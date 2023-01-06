#!/bin/bash
set -x
# Note: run script in a tmux terminal

# Arg 1 - YAML name 
# Arg 2 - YAML dir [ optional ]
# Arg 3 - time to sleep [ optional ]


### Params that don't changes:
CODE_DIR=$HOME/code/personalized-pate/per-point-pate
CODE_DIR=$HOME/code/individualized-pate-pets-submission-

INPUT_DATA_DIR=$HOME/code/data/inputs/
YAML_DIR=$CODE_DIR/experiment_plans/set_6_reviewer_response/

### ARGs
EXPERIMENT_TYPE=${1:-"mnist_upsample_figure_2"}
YAML_DIR=${2:-$YAML_DIR}
TIME_TO_SLEEP=${3:-0} # 7200 is 2 hours, in seconds
OUT_SUFFIX=${4:-}
BASE_OUT_DIR=${5:-${HOME}/code/data/out/}
OUT_DIR=$BASE_OUT_DIR/${EXPERIMENT_TYPE}__${OUT_SUFFIX}

mkdir -p $OUT_DIR    

echo $EXPERIMENT_TYPE
echo "Experiment dir : $YAML_DIR/$EXPERIMENT_TYPE.yaml" 

#source /h/321/royrinberg/miniconda3/bin/activate
source /h/321/royrinberg/.cache/pypoetry/virtualenvs/individualized-pate-4IqngVQy-py3.9/bin/activate

#which python

#exit 0
#conda activate py39

EXECUTABLE="ppp-run -p $YAML_DIR/$EXPERIMENT_TYPE.yaml -o $OUT_DIR -d $INPUT_DATA_DIR"


## logging
echo "Will sleep for $TIME_TO_SLEEP"
echo "Will run command : \'$EXECUTABLE\'"
sleep $TIME_TO_SLEEP

## Run the experiment
pushd $CODE_DIR
#poetry shell
popd

#poetry run 
ppp-run -p $YAML_DIR/$EXPERIMENT_TYPE.yaml -o $OUT_DIR -d $INPUT_DATA_DIR

