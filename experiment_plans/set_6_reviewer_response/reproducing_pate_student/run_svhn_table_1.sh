#!/bin/bash
set -x

# run a script in a tmux terminal
BASE_OUT_DIR=$HOME/code/data/out/
BASE_OUT_DIR=/datadrive1/CleverHans/individualized_pate/pate_for_idpsgd/SVHN/
BASE_OUT_DIR=/mfsnic/adam/idpsgd/roy/PATE/SVHN/

mkdir -p $BASE_OUT_DIR
CODE_DIR=$HOME/code/individualized-pate-pets-submission-

INPUT_DATA_DIR=$HOME/code/data/inputs/
YAML_DIR=$CODE_DIR/experiment_plans/set_6_reviewer_response/mnist_table_1
YAML_DIR=$CODE_DIR/experiment_plans/set_6_reviewer_response/reproducing_pate_student/svhn_table_1


# run a script in a tmux terminal
#BASE_OUT_DIR=$HOME/code/data/out/
#CODE_DIR=$HOME/code/personalized-pate/per-point-pate

#INPUT_DATA_DIR=$HOME/code/data/inputs/
#YAML_DIR=$CODE_DIR/experiment_plans/set_6_reviewer_response/svhn_table_1
TIME_TO_SLEEP=0

for i in 1 2 3
do 
    # run the run_single_experiment for each of the yamls for upsample
        YAML_NAME="svhn_weight_row_1"
	
        SUFFIX_NAME="exp_${i}"
        
        /$CODE_DIR/experiment_plans/set_6_reviewer_response/run_single_experiment.sh $YAML_NAME $YAML_DIR $TIME_TO_SLEEP $SUFFIX_NAME $BASE_OUT_DIR

done
