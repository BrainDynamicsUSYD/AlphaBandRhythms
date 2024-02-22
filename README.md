# BrainDynamicsUsyd-AlphaBandRhythms

Introduction:

This documentation helps you use the code to plot the analytical figures plotted in th “Unified Theory of Alpha, Mu, and Tau Rhythms via Eigenmodes of Brain Activity” paper. In this document, we show you the steps needed to plot Fih 7 in that paper as an example although the code includes comments that help you plot the other figures too.

Installation:

To run this code, you need Matlab to be installed.
Download the Matlab scripts.
Requirements:

This code requires a file containing the eigenmodes.
In this code it is "lh.orig" for the cortical case and "lh.sphere" for the spherical case

Steps: To plot Fig 7:

Fig 7a
- Open the Tnew.m file
- Choose the value of r_e to be 70 and G_es and G_se to be 0.77 and 7.77, respectivel
- Open the powerspectrum_v1.m file and uncomment line 72
- Open the test_v1.m file
- Scroll down to the comment "%double alpha peak (Fig 7)"
- Select the code from the beginning up to line 18, then right click and evaluate selection
- Select the code from line 62 to 65 in test_v1 and evaluate selection
- Open the Tnew.m file and increase the gains G_es and G_se as given in Table 6
- Open the powerspectrum_v1.m file, comment line 72 then uncomment line 73
- Select lines 66 and 67 in test_v1 file and evaluate selection
- Open the powerspectrum_v1.m file, comment line 73 then uncomment line 74
- Select lines 68 and 69 in test_v1 file and evaluate selection, then select lines 71 to 78 and evaluate selection
- Output: The above step plots the power spectrum for the double peak case (Fig 7a).

Figs 7b and 7c
- Open the test_v1.m file and uncomment 129, 132 and 138
- Open the Tnew.m file and change the values of G_es and G_se to their original values in Table 6 (0.77 and 7.77, respectively)
- Select lines 127 to 141 in  test_v1.m file and evaluate selection
- Comment lines 132 and 138 and uncomment lines 130, 133 and 139
- Increase the values of G_es and G_se in T_new file according to Table 6
- Select lines 127 to 143 in  test_v1.m file and evaluate selection
- Output: The above steps plots Figs 7b and 7c.
- Repeat the same steps to plot topography figures for the upper alpha peak case (Figs 7d and 7e ) but instead comment line 129 and uncomment line 130 in the test_v1 file.
  


