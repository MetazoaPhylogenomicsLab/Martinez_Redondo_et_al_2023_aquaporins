#!/bin/bash
#SBATCH -n 1
#SBATCH -c 10
#SBATCH --mem=10G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm_pasta.%j.%x.out
#SBATCH -e slurm_pasta.%j.%x.err
#SBATCH --time=0-10:0

module load cesga/2020
module load pasta/1.8.6

run_pasta.py -i all_aqp1.fasta -d protein --num-cpus $SLURM_CPUS_PER_TASK
