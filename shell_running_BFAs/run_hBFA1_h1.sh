#!/bin/bash
#SBATCH -J hBFA1_p1  #job name for array
#SBATCH -n 1                    # Number of cores
#SBATCH -N 1                    # Ensure that all cores are on one machine
#SBATCH -t 0-08:00              # Runtime in D-HH:MM
#SBATCH -p serial_requeue       # Partition to submit to
#SBATCH --mem=40000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o hBFA1_p1.out      # File to which STDOUT will be written
#SBATCH -e hBFA1_p1.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL              # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=milo.s.johnson.13@gmail.com  # Email to which notifications will be sent

source activate MILO_ENV

python3 ../PLT_parse.py ../demult_maps/BFAs/hBFA1_part1_indices.csv ../../BFA_data/ /n/regal/desai_lab/mjohnson/PLT/BFAs/BFA_raw_reads/hBFA1_Harvard1/hBFA1_Harvard1_lane6_R1.fastq.gz,/n/regal/desai_lab/mjohnson/PLT/BFAs/BFA_raw_reads/hBFA1_Harvard1/hBFA1_Harvard1_lane7_R1.fastq.gz hBFA1_part1

python3 ../PLT_cluster.py ../../BFA_data/ hBFA1_part1

