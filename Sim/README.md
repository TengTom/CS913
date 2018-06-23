### This folder including the code testing image for cell simulation 

To simulating the cell dynamics, please set working directory to the Sim folder. Add simcep, Functions and Functions_DNA into the path.  
The sine function for the cell DNA oscillation dynamic is in _Functions_DNA_

**simcep:**  
The tool package for cell image simulation. This package is already compiled. 
Some out-of-date Matlab functions (randint) have already updated to the related versionin Matlab 2017b.  
Please see readme file in simcep folder for the original reference and further information    
_It is strongly suggested to read the readme and get familar with the scripts in simcep if you hope to know how
the scripts including scripts outside this folder work_


**simDynamic_RGB_opt** & **simDynamic_opt**  
The script containing parameters to control the cell image per frame in dynamic


**autoSim**  
The scripts to generating the cell dynamic images in RGB channel  
The parallel computation in Matlab is **not** applied in the generation process


**autoPar**  
The scripts to generating the cell dynamic images in gey scale  
The parallel computation in Matlab is applied in the generation process

**Functions**  
Two function scripts  
dna2bias: ```Convert sine function to the gene oscillation functions between cell nucleus and cytoplasm```  
bias2frames: ```Transform cell dynamic bias samples to frames.```  
             Notice: please uncomment the code in this function if you need to sim cell in RGB channel
             

**Functions_DNA**  
Functions that use to generate 10 different DNA oscillation sine functions. Please uncomment the display section if you need to show this 10 functions (func10.m is used for current simulation. func7.m is used for RGB simulation)
