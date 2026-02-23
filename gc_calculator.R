# HackBio Stage One Submission 
# Sylvia Onwuanabile 
# Medical Laboratory Scientist and Independent Researcher

# STAGE 1

# Task 1: GC% Calculation

# QUESTION
# For the GC% calculation, make it robust enough to handle nucleotide sequences 
# written in upper and lower case.
# I.e., GCATTTAT and gcaTTTAT should both return 25%.

# SOLUTION
# This function calculates the GC content of a DNA sequence.

# GC% CALCULATION
# let my input_gene be nuc_seq

# Let my nucleotide sequence be represented by geneA & geneB
geneA <- 'GCATTTAT' #as a string
geneB <- 'gcaTTTAT' #as a string

GC_Cal <- function(nuc_seq) {
  
  # convert any lower case to upper case because case sensitive
  nuc_seq_upper <- toupper(nuc_seq)
  
  #split the nucleotide sequence as string
  nuc_seq_split <- strsplit(x = nuc_seq_upper, split = "")[[1]] 
  
  gc_counter<-0 #initialize with zero
  
  for (nuc in nuc_seq_split) { #for loop
    print(nuc)
    
    if (nuc=='G'| nuc =='C') { # if statement
      gc_counter = gc_counter +1
    }
  }
  return((gc_counter / length(nuc_seq_split)) * 100) #operation) 
}

geneA <- 'GCATTTAT' #as a string
geneB <- 'gcaTTTAT' #as a string

my_final_percent_geneA <- GC_Cal(geneA)
print(my_final_percent_geneA)

my_final_percent_geneB <- GC_Cal(geneB)
print(my_final_percent_geneB)

