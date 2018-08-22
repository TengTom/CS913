#### Uploading not finished yet. But you can see TS_Conv_MobileNet.py and Ts_MobileNet.py for finished network structure

This is the python scripts for training data construction and network training  
As the training data is huge. The memory for the computer may not enough to load all training data once.
The original training data have to be segmented and converted to the memmap format for quick load.  

To do this, please run the MATLAB simulation code in this repo (Sim for simple cell simulation and Sim2 for complex cell simulation)  
Or download the data that is already simulated by me from link below:  
 **Link Upload Later** 
   
Than put the data in the ***DataConstruct*** folder in the corresponding workspace folder and run ```dataConstruct.py```  
followed by copy all new data file in ```.mat``` format and entire ***outputDAT*** folder to the ***Network://data*** folder  

The parameter setting for training is different due to the the number of class and sample is different in simple and complex cell simulation.  
You can directly run the training.py in workspace1 for simple cell version and in workspace_complex for complex cell version as the params in the 
corresponding training.py is already been set   
 
