#!/bin/sh
#SBATCH -n 1
#SBATCH -c 48
#SBATCH --mem=150G
#SBATCH -p cl-intel-shared
#SBATCH --qos=cl-intel-shared
#SBATCH --mail-type=END
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm.%j.%x.out
#SBATCH -e slurm.%j.%x.err
#SBATCH --time=0-48:0

module load cesga/2020
module load iq-tree/2.1.2

iqtree2 -s aqps.aln -m LG+C10+F+G -B 1000 -T 48 -ft aqps_arth_fasttree_no_trimmed.treefile
