# ThesisSystemsandControl
Thesis: Cyber-Attack Detection on an Industrial Control System Testbed using Dynamic Watermarking: a Power Grid Application, conducted at Delft University of Technology

There are four important files, which call on the remainder of the files:
1. For the MATLAB & Simulink simulations, a main MATLAB code is run: TwoAreaAGC_Parameters_Start_MA.m. This .m-file calls on multiple functions and the main Simulink model.
2. There is a separate MATLAB code dedicated to the generation of all results, which runs the Simulink model multiple times with different parameter settings and calls on certain csv- and mat-files. 
3. The TcPOU files are the structured text files which run on the PLCs. On the hierarchically highest PLC, i.e. PLC 1, the MAIN_PLC1.TcPOU file calls on multiple function blocks.
4. Similar to PLC 1, PLC 2 also has a main file, MAIN_PLC2.TcPOU, which also calls on multiple (though less) function blocks.
