#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --nodes=1
#SBATCH --mincpus=12
#SBATCH --exclusive
#SBATCH --job-name=sample
#SBATCH --output=sample.log
#SBATCH --error=sample.log
#SBARCH --partition=small
# No account group specified
echo "Hello World"
sleep 130
