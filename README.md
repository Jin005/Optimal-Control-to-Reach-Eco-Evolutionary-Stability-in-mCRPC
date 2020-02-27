Software for simulations in manuscript and user's manual.

Created by Jessica Cunningham (jessica.cunningham at moffitt.org) in the department of Imaging at the Moffitt Cancer Research Institute, Tampa, FL and the Department of Data Science and Knowledge Engineering at University of Maastricht, Netherlands.

Publication: In review.

## Table of Contents

##### Matlab Setup to run simulation
1. System requirements
2. Downloading simulation
3. Matlab path requirements

##### Running simulations
1. Forwards Backwards Sweep Method
2. Titration Method
3. Plotting scripts

##### Copyright and disclaimer

##### Acknowledgements

## Matlab Setup to run simulation

#### 1. System requirements
To setup and run the simulation you will need a computer running version Matlab 2010a or higher. No special toolboxes are required.

#### 2. Downloading simulation
Download the ZIP of all contents from https://github.com/cunninghamjj/Optimal-Control-to-Reach-Eco-Evolutionary-Stability-in-mCRPC into a folder of your choice. Once downloaded, unzip the contents and discard the .zip file.

#### 3. Matlab path requirements
Open Matlab and change path the folder with the downloaded files. Then go to File -> Set Path -> Add with Subfolders and select the folder with the downloaded files.

## Running Simulation and Plotting Scripts

#### 1. Forwards Backwards Sweep Method
The FBS method described in the manuscript is available in FBSMethod.m. After choosing the parameters described below this will run the FBS method from the 100 pre-selected starting points and create a results structure which includes the optimized path to the desired stability point and the treatment that created that path.

###### Uncomment the desired coarseness of the state dynamics.

###### Uncomment the desired stability point. Either the 2-species of the 3-species as defined in the paper.

Only one choice should be uncommented at a time.

#### 2. Titration Method
The titration method described in the manuscript is available in TitrationMethod.m. This will create a structure labeled by the treatment protocol chosen that has the results for all 10,000 start points. If an individual recreation is selected, it will create a Matlab figure as well as a structure with only that selected output in it.

###### Uncomment the desired treatment protocol from MTD, AT, Va_1, Va_0, Vb_1, and Vb_0.

###### It is also possible to uncomment one of the specific parameter sets that will recreate the figures in the manuscript. These can be found between the %% %% in the file.  

Only one choice should be uncommented at a time.


#### 3. Plotting scripts
Any of the plotting scripts that begin with Plotting_ will recreate figures that are included in the manuscript. They use the data that is included in the download so make sure to set the Matlab paths appropriately.


## COPYRIGHT AND DISCLAIMER

This software and documentation contained with it are copyright © 2016 by Jessica Cunningham and the Moffitt Cancer Research Institute.  All rights are reserved.

This software is supplied 'as is' without any warranty or guarantee of support.  The Moffitt Cancer Research Institute is not responsible for its use, misuse, or functionality.  In no event shall the authors or copyright holders be liable for any claim, damages, or other liability arising from, out of, or in connection with this software.


## ACKNOWLEDGEMENTS

Thanks to Frank Thuijsman and Ralf Peeters for helping design the underlying mathematical model and helping extensively with how to display the results. Yannick Viossat has been an incredible resource for the theory and understanding of this work. Thanks to both Joel Brown and Robert Gatenby for their unending support in the completion of this work. None of this is possible without Katerina Stankova as the glue that holds all of it together. 
