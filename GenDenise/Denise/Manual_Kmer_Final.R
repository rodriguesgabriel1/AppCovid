# ADVANCING VIRAL GENOME CLASSIFICATION: ASSESSING THE EFFICIENCY AND ACCURACY
# OF THE ALIGNMENT-FREE K-MER METHOD IN EMERGING PANDEMICS

# Denise Paiva - Aug/2023

# Install Packages
install.packages('Biostrings')
install.packages('kmer')

# If you encounter issues while installing 'Biostrings', please ensure that you have at least
# R version 4.3.1 and try running this script:

sessionInfo()

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")

################################################################
# Load Libraries:
library(Biostrings)
library(kmer)

# It may be helpful to consider shortening the sequence identifiers in the .fasta files
# to make them more concise and informative. Otherwise, the names could become excessively long.

# Load the current directory - getwd(c://documents/Fasta_files)
getwd()

# Load sequences (sequences already downloaded into the R project)

# List all files in the current directory
list.files()

# Get a list of FASTA files in the directory
(fasta_files <- list.files(pattern = '\\.fasta$'))

# Read the nucleotide sequences in FASTA format.
sequences <- readAAStringSet(fasta_files)

# Now, you need to ensure that all sequences have the same length
# by determining the number of base pairs in each sequence and trimming 
# all sequences to have the same number of bases as the shortest sequence.

# Count the number of base pairs in each sequence
(lengths <- lengths(sequences))

# Print the length of the shortest sequence
(shortest_length <- min(lengths))

# Trim sequences to the shortest length
trimmed_sequences <- subseq(sequences, end = shortest_length)

# Convert to a matrix for grouping
seqs <- as.matrix(trimmed_sequences)

# Generate clustering. Here, k=6, but you can experiment with other values of k.
# Remember that for k = n, you need to set nstart = n.
w <- cluster(seqs, k = 6, nstart = 6, residues = NULL, gap = "-")
plot(w, main = "", horiz = TRUE)

