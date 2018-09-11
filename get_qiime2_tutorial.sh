#!/bin/bash
 
#SBATCH -p serial                   # Send this job to the serial partition
#SBATCH -n 2                        # number of cores
#SBATCH -t 0-12:00                  # wall time (D-HH:MM)
##SBATCH -A drzuckerman             # Account to pull cpu hours from (commented out)
#SBATCH -o slurm.%j.out             # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err             # STDERR (%j = JobId)
#SBATCH --mail-type=END,FAIL        # notifications for job done & fail
#SBATCH --mail-user=myemail@asu.edu # send-to address

module load qiime2/2018.4 r/3.3.2
echo "qiime2 and r loaded"
source activate qiime2-2018.4
echo "qiime activated"
mkdir qiime2test
cd qiime2test
wget https://github.com/hshcao/microbiome/blob/master/qiime2.test.sh
chmod 777 qiime2.test.sh
time ./qiime2.test.sh 2>err.log
