# HackBio Stage One Submission
**Sylvia Onwuanabile**  
Medical Laboratory Scientist and Independent Researcher 

## Introduction

This project is my HackBio Stage One submission. It demonstrates two fundamental bioinformatics tasks implemented in R:

1. **GC% Calculator** — a function that computes the guanine-cytosine content of a DNA sequence, robust to both uppercase and lowercase inputs.
2. **Protein Molecular Weight Calculator** — a function that calculates the molecular weight of a protein sequence in kiloDaltons (kDa) using a lookup table of amino acid weights.

As a Medical Laboratory Scientist and Independent Researcher, I designed these functions to show how simple R scripts can be applied to solve real bioinformatics problems. The project highlights clean coding practices, robustness to invalid inputs, and clarity of explanation.



## Task 1: GC% Calculation

### Background
Proteins and genes often need analysis of nucleotide composition. One common measure is GC%, the percentage of guanine (G) and cytosine (C) bases in a DNA sequence.

This function is robust enough to handle nucleotide sequences written in upper and lower case.
For example, GCATTTAT and gcaTTTAT both return 25%.

---

## Step-by-Step Recipe

### Step 1. Function Definition
```r
GC_Cal <- function(nuc_seq) {
```
I defined a function called GC_Cal that takes one argument: nuc_seq (a nucleotide sequence string).

### Step 2: Convert to Uppercase
```r
nuc_seq_upper <- toupper(nuc_seq)
```
- **DNA sequences can be written in uppercase or lowercase.**

- **toupper() ensures everything is converted to uppercase so the function works consistently (e.g., gcaTTTAT becomes GCATTTAT)**


### Step 3: Split Sequence into Characters
```r 
nuc_seq_split <- strsplit(x = nuc_seq_upper, split = "")[[1]]
```
- **strsplit() breaks the string into individual characters.**

- **Example: "GCATTTAT" becomes c("G","C","A","T","T","T","A","T").**

- **The [[1]] extracts the first element of the list returned by strsplit.**


### Step 4:  Initialize Counter
```r
gc_counter <- 0
```
- **A variable gc_counter is set to zero.**

-**This will keep track of how many G’s and C’s are in the sequence.**

### Step 5: Loop Through Each Nucleotide
```r
for (nuc in nuc_seq_split) {
    if (nuc == 'G' | nuc == 'C') {
      gc_counter <- gc_counter + 1
    }
}
```
- **The for loop goes through each nucleotide in the sequence.**

- **If the nucleotide is either G or C, the counter increases by 1.**

- **Example: In "GCATTTAT", the loop finds 2 matches (G and C)**.


### Step 6: Calculate GC Percentage
```r
return((gc_counter / length(nuc_seq_split)) * 100)
```
gc_counter is divided by the total sequence length (length(nuc_seq_split)).

Multiply by 100 to get a percentage.

Example: For "GCATTTAT", GC bases = 2, total length = 8 → 2/8 X 100 = 25%


### Step 7: Test Cases
```r
geneA <- 'GCATTTAT'
geneB <- 'gcaTTTAT'

GC_Cal(geneA) # returns 25
GC_Cal(geneB) # returns 25
```
- **geneA is uppercase, geneB is mixed case.**

- **Both return 25%, proving the function is case‑insensitive and robust.**


## 🎯 Summary
- **Purpose: Calculate GC% of a DNA sequence.**

- **Robustness: Works for both uppercase and lowercase input.**

- **Logic: Convert → split → loop → count G/C → calculate percentage.**

- **Output: Returns GC content as a percentage.**


---


## Task 2: Protein Molecular Weight Calculator in R

### Background
Proteins are made up of amino acids, and each amino acid has a specific molecular weight.  
To calculate the molecular weight of a protein sequence, we need to add up the weights of all the amino acids in the sequence.  
In this project, I used R programming to build a function that performs this calculation and returns the result in kiloDaltons (kDa).

---

## Step-by-Step Recipe

### Step 1: Define the Protein Sequence 
```r 
protein_seq <- "SYLVIA" 
```

### Step 2: Create a Lookup Table of Amino Acid Weights
Next, I created a vector in R that stores the molecular weights of all 20 standard amino acids:
simple_aa_weight
```r
simple_aa_weight <- c(
  A = 89.09, R = 174.20, N = 132.12, D = 133.10, C = 121.15,
  E = 147.13, Q = 146.15, G = 75.07, H = 155.16, I = 131.18,
  L = 131.18, K = 146.19, M = 149.21, F = 165.19, P = 115.13,
  S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
)
```

### Step 3: Write the Function
```r
protein_mol_wgt <- function(protein_seq) {
  protein_seq_upper <- toupper(protein_seq) # convert to uppercase
  protein_seq_split <- strsplit(x = protein_seq_upper, split = "")[[1]] # split sequence
  
  total_weight <- 0 # initialize
  
  for (aa in protein_seq_split) {
    if (aa %in% names(simple_aa_weight)) {
      total_weight <- total_weight + simple_aa_weight[aa]
    } else {
      total_weight <- total_weight + 0
    }
  }
  
  return(total_weight / 1000) # convert to kDa
}
```

Here, I wrote a function called protein_mol_wgt that accepts a protein sequence and calculates its molecular weight.
- **Convert to uppercase:** Since R is case‑sensitive, I used toupper() to ensure that lowercase inputs are converted to uppercase.

- **Split the sequence:** I used strsplit() to break the sequence into individual amino acids.

- **Initialize total weight:** I set a variable total_weight <- 0 to start counting from zero.


### Step 4: Loop Through Each Amino Acid
Inside the function, I used a **for loop** to go through each amino acid in the sequence.

- **Check validity:** With an if statement, I checked if the amino acid exists in the lookup table.

- **Add weight:** If valid, I added its weight to the total.

- **Handle invalid characters:** If not valid, I added 0 to avoid errors.


### Step 5: Convert to kDa
Finally, I divided the total weight by 1000 to convert Daltons into kiloDaltons.


### Step 6: Test the Function
I tested the function with different sequences.
```r
protein_mol_wgt("SYLVIA")       # to see if it can carry my name as a protein
protein_mol_wgt("MASSCOM")      # another protein
protein_mol_wgt("BX")           # X is not an amino acid → 0
```
---

## Usage

### 1.
- **Clone this repository:** 
Open your terminal and run:
```bash
git clone https://github.com/YourUsername/protein-weight-calculator.git
cd protein-weight-calculator
```
Replace YourUsername with your own GitHub username if you fork or copy this repository.

### 2.
- **Open protein_weight_calculator.R in RStudio or run it directly in R:**
You can either open protein_weight_calculator.R in RStudio or execute it from the terminal:
```bash
Rscript protein_weight_calculator.R
```

### 3.
- **Modify the sequence inside the script or call the function with your own protein sequence.**
Inside the script, change the protein sequence to your own, or call the function directly in R:
```r
protein_mol_wgt("YOURSEQUENCE")
```
Replace YOURSEQUENCE with any protein sequence you want to calculate (e.g., "SYLVIA", "MASSCOM", etc.).

---

## 🎯 Summary
- **Purpose: Calculate the molecular weight of a protein sequence in kiloDaltons (kDa).**

- **Robustness: Works for both uppercase and lowercase input, and handles invalid amino acids gracefully by assigning them a weight of 0.**

- **Logic: Convert → split → loop → check amino acid validity → sum weights → convert to kDa.**

- **Output: Returns the protein’s molecular weight in kDa.**



## Conclusion
By following these steps, I successfully built two robust bioinformatics functions in R:

- **A GC% calculator that handles both uppercase and lowercase nucleotide sequences.**

- **A protein molecular weight calculator that uses a lookup table of amino acid weights and returns results in kiloDaltons.**

Both functions are simple, efficient, and handle invalid inputs gracefully.