#!/bin/sh
#SBATCH -n 1
#SBATCH -c 48
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm.%j.%x.out
#SBATCH -e slurm.%j.%x.err
#SBATCH --time=0-48:0

module load cesga/2020
module load iq-tree/2.1.2

iqtree2 -s all_aqp1_trimmed.aln -m LG+C10+F+G -B 1000 -T 48 -alrt 1000 -ft all_aqp1_trimmed_fasttree.treefile
