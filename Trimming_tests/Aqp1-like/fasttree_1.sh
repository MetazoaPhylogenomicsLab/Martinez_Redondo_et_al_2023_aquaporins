#!/bin/bash
#SBATCH -n 1
#SBATCH -c 10
#SBATCH --mem=20G
#SBATCH -p cl-intel-shared
#SBATCH --qos=cl-intel-shared
#SBATCH --mail-type=END
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm_fasttree.%j.%x.out
#SBATCH -e slurm_fasttree.%j.%x.err
#SBATCH --time=0-10:0

module load fasttree/2.1.11

FastTree -lg $HOME/AQP1_4_phyla/all_aqp1_trimmed_1.aln > aqp1_fasttree_trimmed_1.treefile
