#!/bin/bash
#SBATCH -n 1
#SBATCH -c 10
#SBATCH --mem=20G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm_fasttree.%j.%x.out
#SBATCH -e slurm_fasttree.%j.%x.err
#SBATCH --time=0-10:0

module load fasttree/2.1.11

FastTree -lg all_aqp1_trimmed.aln > all_aqp1_trimmed_fasttree.treefile
