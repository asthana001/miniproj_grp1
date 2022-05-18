Explanation of Code:  

The first step in the modelling of spinodal decomposition is the identification of order parameter.

In this scenario, it is the composition, and the order parameter which describes the microstructure. 

Subsequently, the thermodynamics of the system is described by writing the Free energy functional, which depends on the concentration, and its gradient. 

The next step is writing the phase field equation for the evolution. We are employing the use of the Cahn Hilliard Equation for the same.

The final step is to solve the equation. 

Here, we employ a semi implicit spectral fourier implementation, which assumes periodic boundary conditions implicitly. 
           
We take a square domain of the microstructure and add a small noise profile to the composition, to create the initial profile of the microstructure prior to its evolution to phases 

For evolving the system, we take the fourier transform of the free energy functional, and the concentration while applying the periodic boundary conditions. 

After evolving the system, we take the concentration to the real space, by taking an inverse fourier transform in 2 dimensions. 

