# Phase Diagrams
The PDF's obtained from the Fokker Planck equations of the higher order interaction model contains the normalisation constant P_0.  
In order to plot the phase diagrams with h(triad interaction rate) and c(pairwise interaction rate) as the axes, the expectation value of |m| is obtained.  
For such an expectation value, it is required to know the value of P_0.  
The models discussed in the paper contains four parameters : s, N, h and c.  
I have still not figured out a way to map this four parameter problem to a three parameter problem.  
Therefore, for the moment, the required phase diagrams can be obtained by fixing the values of s and N and varying h, c since these two parameters form the axes.  
For each value of h, c, N and s, a corresponding value of P_O is obtained and stored by noramlizing the PDF.
This forms the first part of the code.  
The second part of the code used this stored P_0's and for the correspondingly finds the expectation value of |m|.  
