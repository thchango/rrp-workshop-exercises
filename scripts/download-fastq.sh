#!/bin/bash

# Set error handling for the script (stops script if something fails)
set -euo pipefail

# Set the working directory to this file's directory
cd "$(dirname "${BASH_SOURCE[0]}")"

# "Constant" variables
study_id="SRP255885"
fastq_url="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

# Define files and directories
fastq_r1="SRR11518889_1.fastq.gz"
fastq_r2="SRR11518889_2.fastq.gz"
fastq_dir="../data/raw/fastq/$study_id"

# Create fastq directory
mkdir -p $fastq_dir

### Obtain and "process" the R1 fastq file

echo "Obtaining $fastq_r1"

# Download the file
# the -O flag keeps the original internet file name
curl -O $fastq_url/$fastq_r1

# Explore the file: how many lines?
echo "The number of lines in $fastq_r1 is... drumroll...."
gunzip -c $fastq_r1 | wc -l

# Move the fastq file to its home
mv $fastq_r1 $fastq_dir

#### Obtain R2

echo "Obtaining ${fastq_r2}"

# Download the file
# the -O flag keeps the original internet file name
curl -O $fastq_url/$fastq_r2

# Explore the file: how many lines?
echo "The number of lines in $fastq_r2 is... drumroll...."
gunzip -c $fastq_r2 | wc -l

# Move the fastq file to its home
mv $fastq_r2 $fastq_dir