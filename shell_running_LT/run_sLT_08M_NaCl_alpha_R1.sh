#!/bin/bash
#SBATCH -J sLT_08M_NaCl_alpha-R1  #job name for array
#SBATCH -n 1                    # Number of cores
#SBATCH -N 1                    # Ensure that all cores are on one machine
#SBATCH -t 0-24:00              # Runtime in D-HH:MM
#SBATCH -p general       # Partition to submit to
#SBATCH --mem=25000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o sLT_08M_NaCl_alpha-R1.out      # File to which STDOUT will be written
#SBATCH -e sLT_08M_NaCl_alpha-R1.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL              # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=milo.s.johnson.13@gmail.com  # Email to which notifications will be sent

source activate MILO_ENV

python3 ../PLT_parse.py ../demult_maps/Lineage_Tracking/Stanford_hap_08M_NaCl_alpha-R1_indices.csv ../../LT_data/ /n/regal/desai_lab/mjohnson/PLT/LT/alpha_LT_Stanford_R1.fastq.gz 08M_NaCl_alpha_R1

python3 ../PLT_cluster.py ../../LT_data/ 08M_NaCl_alpha_R1
