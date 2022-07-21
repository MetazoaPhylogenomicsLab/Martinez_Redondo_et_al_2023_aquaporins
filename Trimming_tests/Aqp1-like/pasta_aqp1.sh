#!/bin/bash
#SBATCH -n 1
#SBATCH -c 10
#SBATCH --mem=10G
#SBATCH -p shared
#SBATCH --qos=shared
#SBATCH --mail-type=END
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm_pasta.%j.%x.out
#SBATCH -e slurm_pasta.%j.%x.err
#SBATCH --time=0-10:0

module load cesga/2020
module load pasta/1.8.6

run_pasta.py -i $HOME/AQP1_4_phyla/all_aqp1.fasta -d protein --num-cpus $SLURM_CPUS_PER_TASK
