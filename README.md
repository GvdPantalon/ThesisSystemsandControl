# ThesisSystemsandControl
Thesis: Cyber-Attack Detection on an Industrial Control System Testbed using Dynamic Watermarking: a Power Grid Application, conducted at Delft University of Technology

For the MATLAB & Simulink simulations, a main MATLAB code is run, which calls on multiple functions and the main Simulink model. Secondly, there is a separate MATLAB code dedicated to the generation of all results, which runs the Simulink model multiple times with different parameter settings and calls on certain csv and matfiles. Then, each PLC has its own main programme, written in ST, which calls on multiple function blocks.
