function [eigenf, eigenv, surfa]=spatial_eigen(file,eigN)
%use FEM function and read_surf


%define struct
surfa=struct('vertices',1,'faces',1); 

%store surface vertices and faces from freesurfer objects
[surfa.vertices, surfa.faces]=read_surf(file);

%correct faces index from 1 instead of from 0
surfa.faces=surfa.faces+1;
%correct surface value needed to compute FEM
surfa.vertices(1,:) = 1.*surfa.vertices(1,:) + 1e-6;

% normalisation 
area = calc_surf_area(surfa)
%norm= sqrt(area/0.0609)/1000
%surfa.vertices = surfa.vertices/sqrt(area/0.0609); % to get a sphere with same surface
%surfa.vertices = surfa.vertices/100; %cortex
% area = calc_surf_area(surfa)

%find solutions of Helmholtz eq
[A,C] = FEM(surfa);
%compute eigenfunctions and eigenvalues
[eigenf,eigenv] = eigs(C,A,eigN,'sm');

%eigenv %display k^2
eigenv=sqrt(eigenv); %to get k and not k^2 (optional)


end