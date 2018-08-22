### This folder including the code testing image for cell simulation 

To simulating the cell dynamics, please set the working directory to the Sim folder. Add simcep, Functions and Functions_DNA into the path.  
The sine function for the cell DNA oscillation dynamic is in _Functions_DNA_  
  
Notice: Understanding whole mechanism may take some times. If you are interested in the setting of the oscillation functions for genes between nucleus and cytoplasm, please see the scripts in **Functions_DNA**.     


**simcep:**  
The tool package for cell image simulation. This package is already compiled. 
Some out-of-date Matlab functions (randint) have already updated to the related version in Matlab 2017b.  
Please see the readme file in simcep folder for the original reference and further information
If Simcep package not worked, please re-install and compile the simcep followed by the official instruction. 
Then replace the original folder in this directory or set ```addpath <simcep folder> ```  in the matlab
_It is strongly suggested to read the readme and get familiar with the scripts in simcep if you hope to know how
the scripts including scripts outside this folder work_


**simDynamic_RGB_opt** & **simDynamic_opt**  
The script containing parameters to control the cell image per frame in dynamic


**autoSim**  
The scripts for generating the cellular dynamic images in RGB channel  
The parallel computation in Matlab is **not** applied in the generation process


**autoTest2**  
The scripts for generating the cellular dynamic images in grey scale  
The noise about phases selection is involved  
The parallel computation in Matlab is applied in the generation process

**Functions**  
Two function scripts  
dna2bias: ```Convert sine function to the gene oscillation functions between cell nucleus and cytoplasm```  
bias2frames:  
```Transform cell dynamic bias samples to frames.```  
``` The noise about shape and texture randomness involved```  
Notice: please uncomment the code in this function if you need to sim cell in RGB channel
             

**Functions_DNA**  
Functions for generating 10 different DNA oscillation sine functions. Please uncomment the display section if you need to show this 10 functions (func10.m is used for current (grey) simulation. func7.m is used for RGB simulation)

### Simulation instructions: 
Run ***mkdir.py*** by python in data folder, then run the ***autoTest2*** by MATLAB in this directory
