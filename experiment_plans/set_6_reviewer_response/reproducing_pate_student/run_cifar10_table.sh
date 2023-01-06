#!/bin/bash
set -x

# run a script in a tmux terminal
BASE_OUT_DIR=/mfsnic/adam/idpsgd/roy/PATE/CIFAR10
mkdir -p $BASE_OUT_DIR

CODE_DIR=$HOME/individualized-pate-pets-submission-

INPUT_DATA_DIR=$HOME/code/data/inputs/

YAML_DIR=/h/321/royrinberg/individualized-pate-pets-submission-/experiment_plans/set_6_reviewer_response/reproducing_pate_student/cifar10_table_1


TIME_TO_SLEEP=0

for i in 1 2 3 
do 
    # run the run_single_experiment for each of the yamls for upsample
        YAML_NAME="cifar10_weight_row_1"
	
        SUFFIX_NAME="exp_${i}"
        
        /$CODE_DIR/experiment_plans/set_6_reviewer_response/run_single_experiment.sh $YAML_NAME $YAML_DIR $TIME_TO_SLEEP $SUFFIX_NAME $BASE_OUT_DIR

done
