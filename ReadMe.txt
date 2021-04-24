Hello, thank you for checking out my comparison of MPC and impedance control performance in a powered knee prosthetic.

To run my project there are two simple steps:
1) Load the workspace into your instance of Matlab
2) Open the Simulink Model held within this repository.

Within the Simulink Model you will find reference signals for each of the five gait types I compared (Walking, Ramp Ascending, Ramp Descending, Stairs Ascending, Stairs Descending)
Using the switching network you may choose the reference to pass through the system.

The reference signals and plant were obtained or derived using the Open Source Leg Project developed by the Neurobionics Lab at the University of Michigan. I will be uploading their
script to plot the results of their impedance controller, which is the impedance controller I compared the performance of my MPC controller against.
