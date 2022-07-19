#!/bin/sh
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=5G
#SBATCH -p cl-intel-shared
#SBATCH --qos=cl-intel-shared
#SBATCH --mail-type=END
#SBATCH --mail-user=gimartinezredondo@gmail.com
#SBATCH -o slurm.%j.%x.out
#SBATCH -e slurm.%j.%x.err
#SBATCH --time=0-1:0


#Load modules

module load gcccore/6.4.0 bitacora/1.3-python-3.7.7


#Set variables

DATA_TRANS="$SHARE/storage/longest_pep/arthropoda/"
DATA_ONYC="$SHARE/storage/longest_pep/onychophora/"
DATA_GEN="$SHARE/storage/genomes_pep/arthropoda/"
WORKSPACE=$HOME
TAXON_LIST=$WORKSPACE/taxon_list.txt


#Launch bitacora in batch mode
while read -r TAXON
do
        #Obtain species ID
        SPECIES=$(echo $TAXON | awk '{print $1}')

        #Create directory for bitacora output
        mkdir -p $WORKSPACE/BITACORA/$SPECIES

        cd $WORKSPACE/BITACORA/$SPECIES

	#Check if dataset is a transcriptome or a genome
	if [[ -f "$DATA_GEN/${SPECIES}_longiso.pep" ]]; then
		DATA=$DATA_GEN
	fi
	if [[ -f "$DATA_TRANS/${SPECIES}_longiso.pep" ]]; then
		DATA=$DATA_TRANS
	fi
	if [[ -f "$DATA_ONYC/${SPECIES}_longiso.pep" ]]; then
                DATA=$DATA_ONYC
        fi

        #Execute bitacora. It uses the runBITACORA_command_line.sh because the script runBITACORA_protein_mode.sh cannot be modified.

	runBITACORA_command_line.sh -m protein -q /mnt/netapp2/Store_csbye/databases/AQPs/database -p $DATA/${SPECIES}_longiso.pep -n $SPECIES -sp / -bp /opt/cesga/easybuild-cesga/software/Compiler/gcccore/6.4.0/ncbi-blast/2.11.0+-python-3.7.7/bin -hp /opt/cesga/easybuild-cesga/software/Compiler/gcccore/6.4.0/hmmer/3.2.1/bin -e 1e-5 -t 12 -r F -t $SLURM_CPUS_PER_TASK

	rm $DATA/${SPECIES}_longiso.pep.p*

done < $TAXON_LIST

