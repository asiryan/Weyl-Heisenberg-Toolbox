# Weyl-Heisenberg Bases Toolbox

This MATLAB toolbox was developed to study the optimal **Weyl-Heisenberg bases** and their properties in the field of signal processing and compression in time-frequency domain. The toolbox includes m-files that allow the synthesis and analysis of forming WH-functions and their corresponding orthogonal WH-bases.

# Installation
Add to MATLAB path toolbox scripts and samples folders:  
```matlab  
addpath('[...] /MATLAB/Scripts')  
addpath('[...] /MATLAB/Samples')  
addpath('[...] /MATLAB/Samples/Images')  
```
Run sample script:  
```matlab
>> plotgauss3
Number of samples = 128
Standard deviation = 0.00025
```

<p align="left"><img width="60%" src="Docs/truncgaussian.png" /></p>

# Example of the WH-function synthesis  
Run sample script:
```
>> filterf
Number of frequency shifts M = 16
Number of time shifts L = 16
Beta-parameter = 2
```
<p align="left"><img width="60%" src="Docs/filterf.png" /></p>

# Referencess
A full list of references is given in a separate [file](Docs/References.pdf)
