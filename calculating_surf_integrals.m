%clear
% mode surface integrals
%load Eigenmodes.mat

[em_lh, ev_lh, surf_lh]=spatial_eigen('lh22.white',eigN);

m1=em_lh(:,1);
m2=em_lh(:,2);
m3=em_lh(:,3);
m4=em_lh(:,4);
m5=em_lh(:,5);
m6=em_lh(:,6);
m7=em_lh(:,7);
m8=em_lh(:,8);
m9=em_lh(:,9);


% checking normalization
%calc_surf_integral(sphere_inflated,m3.*m3)
%calc_surf_integral(surf_lh,m3.*m3)

% checking orthoganility
%calc_surf_integral(surf_lh,m2.*m3)

calc_surf_integral(surf_lh,m8.*m2.*m8)

[em_sph, ev_sph, surf_sph]=spatial_eigen('lh.sphere',9);

s1=em_sph(:,1);
s2=em_sph(:,2);
s3=em_sph(:,3);
s4=em_sph(:,4);
s5=em_sph(:,5);
s6=em_sph(:,6);
s7=em_sph(:,7);
s8=em_sph(:,8);
s9=em_sph(:,9);

calc_surf_integral(surf_sph,s4.*s3.*s4)*100



%spherical harmonics

% theta=0:pi;
% phi=0:2*pi;

Y2=RYlm(1,-1,theta,phi);
Y4=RYlm(1,1,theta,phi);
Y5=RYlm(2,-2,theta,phi);
Y6=RYlm(2,-1,theta,phi);
Y8=RYlm(2,1,theta,phi);
Y9=RYlm(2,2,theta,phi);
Y3=Ylm(1,0,theta,phi);
Y7=Ylm(2,0,theta,phi);
Y1=Ylm(0,0,theta,phi);

calc_surf_integral(surf_lh,m2.*m1.*m2)
calc_surf_integral(surf_lh,m2.*m2.*m2)
calc_surf_integral(surf_lh,m2.*m3.*m2)
calc_surf_integral(surf_lh,m2.*m4.*m2)

%calculating expectation values



A=1.26;
 expec2=-A.*((0.008*10^(-2))*cosd(ang)+(0.0502*10^(-2))*sind(ang));
 expec3=-A.*((-0.0454*10^(-2))*cosd(ang)+(-0.0254*10^(-2))*sind(ang));
 expec4=-A.*((-0.0178e-02)*cosd(ang)+(-0.0019e-02)*sind(ang));
 expec5=-A.*((-0.0265e-02)*cosd(ang)+(-0.0005e-02)*sind(ang));
 expec6=-A.*(( 0.0754e-02)*cosd(ang)+(-0.0224e-02)*sind(ang));
 expec7=-A.*((  0.0579e-02)*cosd(ang)+(0.0917e-02)*sind(ang));
 expec8=-A.*(( 0.0715e-02)*cosd(ang)+(0.0302e-02)*sind(ang));
 expec9=-A.*(( -0.0884e-02)*cosd(ang)+(-0.0303e-02)*sind(ang));
 %time delay
t0_2=0.08+expec2;
t0_3=0.08+expec3;
t0_4=0.08+expec4;
t0_5=0.08+expec5;
t0_6=0.08+expec6;
t0_7=0.08+expec7;
t0_8=0.08+expec8;
t0_9=0.08+expec9;

t_0_eta=[0.08 t0_2 t0_3 t0_4 t0_5 t0_6 t0_7 t0_8 t0_9]  %expectation values needed to plot Fig 6

