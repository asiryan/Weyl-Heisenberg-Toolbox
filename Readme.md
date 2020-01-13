# Weyl-Heisenberg Bases Toolbox

This MATLAB toolbox was developed to study the optimal **Weyl-Heisenberg bases** and their properties in the field of signal processing and compression in time-frequency domain. The toolbox includes m-files that allow the synthesis and analysis of forming WH-functions and their corresponding orthogonal bases.  
  
The classic procedure for the synthesis of Weyl-Heisenberg bases is described in detail in this [article](https://www.researchgate.net/publication/221003716_Orthogonal_well-localized_Weyl-Heisenberg_basis_construction_and_optimization_for_multicarrier_digital_communication_systems). The fast algorithm which uses discrete **Wigner transforms** is described in [paper](https://fruct.org/publications/fruct6/files/Pet.pdf) or **Zak-transforms** in [paper](https://ieeexplore.ieee.org/document/564174).  

# Installation
Add to MATLAB path toolbox scripts and samples folders:  
```matlab  
addpath('[...] /matlab/toolbox_scripts')  
addpath('[...] /matlab/toolbox_samples')  
```
Run sample script:  
```matlab
>> plotgauss3
Number of samples = 128
Standard deviation = 0.00025
```

<p align="center"><img width="60%" src="docs/plotgauss3.png" /></p>

# Basis synthesis  
Example of the bases construction: Gabor (*non-orthogonal*) and Weyl-Heisenberg (*orthogonal*).  
Run sample script:  
```matlab
>> basis
Number of frequency shifts M = 16
Number of time shifts L = 16
Alfa-parameter = 8
Standard deviation = 0.0025
```
<p align="center"><img width="60%" src="docs/basis.png" /></p>

# Referencess
A full list of references is given in a separate [file](docs/references.pdf) (**primarily in Russian**).
