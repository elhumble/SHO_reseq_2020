**Chromosomal-level genome assembly of the scimitar-horned oryx: insights into diversity and demography of a species extinct in the wild**

[Emily Humble](http:/elhumble.github.io/), Pavel Dobrynin, Helen Senn, Justin Chuven, Alan F Scott, David W Mohr, Olga Dudchenko, Arina D Omer, Zane Colaric, Erez Lieberman Aiden, David Wildt, Shireen Oliaji, Gail Tamazian, Budhan Pukazhenthi, Rob Ogden, Klaus-Peter Koepfli

This repository contains the scripts used for aligning reads and calling SNPs for resequenced individuals, running ANGSD, running PSMC and assembling mitogenomes

**Data**
-------------
Sequencing reads required to run the pipeline are available at the European Nucleotide Archive (https://www.ebi.ac.uk/ena/browser) under study accession PRJEB37295  

Genome assembly used in the pipeline is available on the [DNA ZOO](www.dnazoo.org/assemblies/Oryx_dammah) website. For the analyses run here, only the 29 chromosomal-level scaffolds were used. 

**Notes**
------------- 
`4.2_boot_PSMC.sh`, `6.1_angsdHet.sh` and `6.1_realSFS.sh` are designed to be run using the respective scripts `run_4.2_boot_PSMC.sh`, `run_6.1_angsdHet.sh` and `run_6.1_realSFS.sh`

`/file_lists` contains text files required for running pipeline

###### Please feel free to [get in touch](mailto:emily.humble@ed.ac.uk) if you have any questions.
