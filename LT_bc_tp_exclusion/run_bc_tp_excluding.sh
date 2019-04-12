#!/bin/bash
#SBATCH -J LT_bc_tp_exclusion  #job name for array
#SBATCH -n 1                    # Number of cores
#SBATCH -N 1                    # Ensure that all cores are on one machine
#SBATCH -t 0-01:00              # Runtime in D-HH:MM
#SBATCH -p serial_requeue       # Partition to submit to
#SBATCH --mem=10000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o LT_bc_tp_exclusion.out      # File to which STDOUT will be written
#SBATCH -e LT_bc_tp_exclusion.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL              # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=milo.s.johnson.13@gmail.com  # Email to which notifications will be sent

source activate MILO_ENV

python PLT_LT_bc_tp_excluding.py Environment_BC_calls_Feb_2018_simple.csv ../../LT_data/Combined_Counts/ ebc_specific_calls.csv evolution_tps_excluded.csv  ../../LT_data/Clean_Counts/
