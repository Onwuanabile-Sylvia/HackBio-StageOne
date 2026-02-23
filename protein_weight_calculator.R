# HackBio Stage One Submission 
# Sylvia Onwuanabile 
# Medical Laboratory Scientist and Independent Researcher 

# Stage 1

# Task 2: Protein Molecular Weight Calculator

# QUESTION:
# With the amino acid given
# Write a function that returns the molecular weight of any protein in KiloDalton
# Let the function accept your name as an input by default
# if your name or any input contains a non-protein character by default (such as B), return 0 for that value.
# Write an essay describing the step-by-step recipe with which you solved the (protein weight calculator) task in R
# Hint: Think of how you will break the input protein into individual elements of a vector and search for them in the table provided.

# SOLUTION:
# This function calculates the molecular weight of a protein sequence in kDa.

# Let input_gene = protein_seq = "SYLVIA"
# Let the mol weight be amino_acid_weight (aa_weight)

# Protein sequence
protein_seq <- "SYLVIA"

# Lookup table of amino acid weights (Da)
simple_aa_weight <- c(
  A = 89.09, R = 174.20, N = 132.12, D = 133.10, C = 121.15,
  E = 147.13, Q = 146.15, G = 75.07, H = 155.16, I = 131.18,
  L = 131.18, K = 146.19, M = 149.21, F = 165.19, P = 115.13,
  S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
)

# Function to calculate molecular weight in kDa
protein_mol_wgt <- function(protein_seq) {
  protein_seq_upper <- toupper(protein_seq) # convert to uppercase
  protein_seq_split <- strsplit(x = protein_seq_upper, split = "")[[1]] # split sequence
  
  total_weight <- 0 # initialize total weight
  
  for (aa in protein_seq_split) {
    if (aa %in% names(simple_aa_weight)) {
      total_weight <- total_weight + simple_aa_weight[aa]
    } else {
      total_weight <- total_weight + 0
    }
  }
  
  return(total_weight / 1000) # convert to kDa
}

# Test the function
protein_mol_wgt("SYLVIA")   # should return ~0.9 kDa
protein_mol_wgt("MASSCOM")  # another protein
protein_mol_wgt("BX")       # X is not an amino acid → 0
