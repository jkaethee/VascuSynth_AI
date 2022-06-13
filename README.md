# VascuSynth_copy
VascuSynth - Vascular Tree Synthesis Software
Preet S. Jassi, May 5 2011

Please visit the Insight Journal and read the paper here http://www.insight-journal.org/browse/publication/794 for proper instructions on how to compile and execute VascuSynth.  VascuSynth requires CMake and ITK.  Instructions on how to install CMake and ITK are in the paper above.

## Motivation
This repository is a modified version of VascuSynth to generate 3D vascular trees with tumourous regions. The goal is to generate realistic MIPs of 3D vasculature trees with hypoxic regions that reflect key features such as tortuosity, dilated vessels, and dense branching in contrast to the organized nature of healthy vasculature.

## Build and Generate Vascular Trees
This application can be built and run using Docker.
> It will first prompt the user to enter parameters such as # of trees, # of nodes, and whether they would like to generate tumourous or healthy vasculature. After the configuration files are built, the program will ask the user if they would like to generate the vascular trees. The container exits after the trees have been generated (or if the user decides not to generate them at all)

First, clone the repo:  

`git clone https://github.com/jkaethee/VascuSynth_copy.git`  

Then, start Docker, navigate to the `Source` directory with the Dockerfile, and build the image:  

`docker build -t vascusynth .`  

Finally, spin up a container in interactive mode to run the application:  

`docker run -it vascusynth`

The user can now follow the interactive prompts and generate their desired vascular trees!
> Tumourous vascular trees can be found in the `/VascuSynth/Tumourous_Trees` directory, while healthy vascular trees can be found in the `/VascuSynth/Healthy_Trees` directory (both of these paths are on the container file system)

### Copying files from container to host
To get the files generated within the container onto the user's host system, use the following command:  
`docker cp <container_name>:/VascuSynth/<Tumourous_Trees or Healthy_Trees> ../`

Note that the container name can be found by running `docker ps -a` and that the above command assumes the user is still in the `Source` directory.
If successful, the user should see the folders and files corresponding to the generated trees on their host system.

## Capture Maximum Intensity Projections of 3D Vascular Trees
This section utilizes Jupyter Notebook.
