1. Copy the simulated or downloaded data zip folder to  **DataConstruct:\\data** folder and unzip the file  
``` Notice: this folder is used for data with both sampling rate as 5 and sampling as 10.```  
```After step2, you can simply put the constructed data with sampling rate as 5 in **Network_S5** and sampling rate as 10 in **Network_S10** ```  
  
  
2. Run ```dataConstruct.py``` in **DataConstruct** folder  

3. Copy all new file with ```.mat``` format and entire **outputDAT** folder in **DataConstruct** folder to the **data** 
folder in **Network_Sx** folder (x=5 for sampling rate as 5; x=6 for sampling rate as 10)  

4. run ```train.py``` to train the simple network model and store the training and evaluation history in the **history** folder
