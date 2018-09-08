#### You can see TS_Conv_MobileNet.py and Ts_MobileNet.py for finished network structure in workspace folder

This is the python scripts for training data construction and network training  
As the training data is huge. The memory for the computer may not enough to load all training data once.
The original training data have to be segmented and converted to the memmap format for quick load.  

To do this, please run the MATLAB simulation code in this repo (Sim for simple cell simulation and Sim2 for complex cell simulation)  
Or download the data that is already simulated by me from link below:  
##### 1.	Datasets
**1.1	Simple Simulation Data zip file**   
(10 classes, 900 samples per class, 128 frames per sample, 64x64 resolution per frame)  
https://www.dropbox.com/s/7co5gqfnhps6o5m/data.zip?dl=0

**2.2	Complex Simulation Data zip file (Sampling Rate = 5)**  
(3 classes, 1000 samples per class, 128 frames per sample, 64x64 resolution per frame)  
https://www.dropbox.com/s/r8zltsix5n1ltev/data5.zip?dl=0

**3.3	Complex Simulation Data zip file (Sampling Rate = 10)**  
(3 classes, 1000 samples per class, 128 frames per sample, 64x64 resolution per frame)  
   https://www.dropbox.com/s/ex6n2pwbtqqhzu1/data6.zip?dl=0

   
Than put the data in the ***DataConstruct*** folder in the corresponding workspace folder and run ```dataConstruct.py```  
followed by copy all new data file in ```.mat``` format and entire ***outputDAT*** folder to the ***Network://data*** folder  

The parameter setting for training is different due to the the number of class and sample is different in simple and complex cell simulation.  
You can directly run the training.py in workspace1 for simple cell version and in workspace_complex for complex cell version as the params in the 
corresponding training.py is already been set   
 
