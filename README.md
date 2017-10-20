# RNA-SPOTs Analysis
Scripts for image processing used in RNA SPOTs as described in the publication of "Profling the transcriptome with RNA SPOTs".

# Dependencies
This software requires
1. Matlab
2. ImageJ/Fiji

# Hardware Requirement
64GB and multiple cores are recommended for running the scripts, particularly for barcode calling.

# Scripts
1. make12channel.m - compile images from every 4 serial hybridizations into 1 composite image.
2. correctbackground.m - correct background illuminations for each image.
3. alltforms.m - create affine transformations to align images.
4. poshybnum.m - pre-processing before barcode calling, compile different variables of all images.
5. parallelbatchanalysis.m - barcode calling to identify transcript copy number for each gene based on predesigned codebook.

# Updates
updated on 10/19/2017

# License
Free for non-commercial and academic research. The software is bound by the licensing rules of California Institute of Technology (Caltech)

# Contact
Long Cai (lcai@caltech.edu)




