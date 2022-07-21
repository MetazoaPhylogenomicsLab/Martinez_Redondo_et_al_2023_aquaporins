#!/bin/sh
#SBATCH -n 1
#SBATCH -c 5
#SBATCH --mem=10G
#SBATCH -p cl-intel-shared
#SBATCH --qos=cl-intel-shared
#SBATCH --mail-type=END
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm.%j.%x.out
#SBATCH -e slurm.%j.%x.err
#SBATCH --time=0-5:0

module load cesga/2018
module load gcccore/6.4.0 trimal/1.4.1

trimal -keepheader -in aqps.aln -automated1 -out aqps_arth_trimmed.aln
