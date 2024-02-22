% Power spectrum generator for left hemisphere 

clear
eigN=9;
rng(1);
[em_lh, ev_lh, surf_lh]=spatial_eigen('lh.orig',eigN);
%[em_lh, ev_lh, surf_lh]=spatial_eigen('lh.sphere',eigN);
fprintf('Left hemisphere spatial eigenmodes computed.\n')


t=0:0.005:40;
L = length(t);
dt= t(3)-t(2);    % Sampling period
Fs = 1/dt;      
% Sampling frequency  
fr = Fs*(0:L/2)/L; 
om=2*pi*fr;




%Fig 2
num_TF=Tnew(max(ev_lh(:,1)),om,0);
num_TF2=Tnew(max(ev_lh(:,2)),om,0);
num_TF3=Tnew(max(ev_lh(:,3)),om,0);
num_TF4=Tnew(max(ev_lh(:,4)),om,0);

plot(fr,(abs(num_TF).^1))
hold on
plot(fr,(abs(num_TF2).^1))
hold on
loglog(fr,(abs(num_TF3).^2))
hold on
loglog(fr,(abs(num_TF4).^2))
xlim([6 20])
legend('η=00','η=1-1','η=10','η=11');
set(findall(gcf,'type','line'),'linewidth',1.3)
xlabel('{\it{log f}} [Hz]')
ylabel('{\it{log [P({f})]}}')




%single alpha peak (Fig 6)
eigss=[1 2];
in='white';
O1=158707; % Occipital
pO1=power_spectrum_v1(t,eigss,em_lh,ev_lh,O1,in);  %pO1 for the uniform mode and pO11 for the second eigenmode with higher gain based on Table 6
hold on
Fp1=44907;
pFp1=power_spectrum_v1(t,eigss,em_lh,ev_lh,Fp1,in); %pFp1 for the uniform mode and pFp11 for the second eigenmode with higher gain based on Table 6
plot(fr,(pO1+a1-1.*pO11).^2)  %choose a1-1
hold on
plot(fr,(pFp1+a1-1.*pFp11).^2)
xlim([6 14])
set(findall(gcf,'type','line'),'linewidth',1.3)
legend('O1','Fp1');
xlabel('f [Hz]')
ylabel('Power')


%double alpha peak (Fig 7)
eigss=[1 2 4];
pO1=power_spectrum_v1(t,eigss,em_lh,ev_lh,O1,in);  %uniform mode
pFp1=power_spectrum_v1(t,eigss,em_lh,ev_lh,Fp1,in); %uniform mode
pO11=power_spectrum_v1(t,eigss,em_lh,ev_lh,O1,in); %second eigenmode with higher gain according to Table 6
pFp11=power_spectrum_v1(t,eigss,em_lh,ev_lh,Fp1,in); %second eigenmode with higher gain according to Table 6
pO12=power_spectrum_v1(t,eigss,em_lh,ev_lh,O1,in); %fourth eigenmode with higher gain according to Table 6
pFp12=power_spectrum_v1(t,eigss,em_lh,ev_lh,Fp1,in); %fourth eigenmode with higher gain according to Table 6

plot(fr,(pO1.^2+(0.69.*pO11+1.1.*pO12).^2))
hold on
plot(fr,(pFp1.^2+(0.69.*pFp11+1.1.*pFp12).^2))
xlim([6 14])
set(findall(gcf,'type','line'),'linewidth',1.3)
legend('O1','Fp1');
xlabel('f [Hz]')
ylabel('Power')


%mu (Fig 8)

in='white';
eigss=[1 3];
Cz=1; 
p11=power_spectrum_v1(t,eigss,em_lh,ev_lh,Cz,in);
hold on
T3=68286;
p22=power_spectrum_v1(t,eigss,em_lh,ev_lh,T3,in);
plot(fr,(p1-a10.*p11).^2)
hold on
plot(fr,(p2-a10.*p22).^2)
xlim([15 18])
set(findall(gcf,'type','line'),'linewidth',1.3)
legend('Cz','T3');
xlabel('f [Hz]')
ylabel('P(r,f) [arbitrary unit]')

%tau (Fig 8)


in='white';
eigss=[1 4];
T3=68286;
p33=power_spectrum_v1(t,eigss,em_lh,ev_lh,T3,in);
O1=158707; 
p44=power_spectrum_v1(t,eigss,em_lh,ev_lh,O1,in);
plot(fr,(p3+a11.*p33).^2)
hold on
plot(fr,(p4+a11.*p44).^2)
xlim([15 17.5])
 set(findall(gcf,'type','line'),'linewidth',1.3)
legend('T3','O1');
xlabel('f [Hz]')
ylabel('Power')





%plotting eigenmodes figure (Fig2)
plotsurf3(surf_lh,em_lh(:,9))



%Topography figures
k1=max(ev_lh(:,2));
k3=max(ev_lh(:,4));
%om=52.3; %lower peak
%om=57.3  %upper peak
R=1:163842;
%p0=zeros(1,size_R);
%p1=zeros(1,size_R);
in='white';
eigss=[1 2];
for n=1:163842

   %p0(n)=p0(n)+(((abs(Tnew(0,om,0))).*em_lh(:,1))).^2;
   %p1(n)=p1(n)+(((abs(Tnew(k1,om,0))).*0.69.*em_lh(:,2))+(abs(Tnew(k3,om,0))).*1.1.*em_lh(:,4)).^2;

end

plotsurf3(surf_lh,p0+p1);




%plotting locations of points on the cortex


map=ones(163842,1);
map(O1)=100;
map(Cz)=100;
map(Fp1)=100;
plotsurf3(surf_lh,map)




% theta=linspace(0,pi);
% 
%  %theta=1.571;
%    
% %phi=linspace(-pi,pi);
% 
%       phi=1.571;
%        [theta,phi]=meshgrid(theta,phi);
%        r=100;
%        %[x, y, z]=sph2cart(theta,phi,r);
%        x=r.*sin(theta).*cos(phi);
%        y=r.*sin(theta).*sin(phi);
%        z=r.*cos(theta);
%        plot3(x,y,z)
% set(findall(gcf,'type','line'),'linewidth',1.3)
% 
% map=ones(163842,1);
% 
%   map(44907)=100;
%    map(1)=100;
%     map(68286)=100;
% 
% 
% 
%         
%         map(124034)=100;
%         map(121962)=100;
%        map(89284)=100;
%    map(21057)=100;
%    map(14553)=100;
% 
% plotsurf3(surf_lh,map)




% num_TF3=Tnew(max(ev_lh(:,3)),om,0);
% x=real(num_TF3);
% y=imag(num_TF3);
% plot(x,y)
% xlim([-2 2])
% ylim([-2 2])
% 
% hold on
% 
% num_TF1=Tnew(max(ev_lh(:,1)),om,0);
% x=real(num_TF1);
% y=imag(num_TF1);
% plot(x,y)
% 
% ylim([0.261 0.263])
% 
% 
% num_TF2=Tnew(max(ev_lh(:,2)),om,0);
% semilogx(fr,abs(num_TF).^2+(abs(num_TF2).^2))
% xlim([6 14])
% set(findall(gcf,'type','line'),'linewidth',1.3)
% xlabel('f [Hz]')
% ylabel('Power')
% hold on


%Finding the spherical coordinates
% [theta_O1,phi_O1,z1]=cart2sph(-16.2968,-99.7438,4.3347)
% [theta_Cz,phi_Cz,z2]=cart2sph(-15.7177,-36.5732,72.5493)
% [theta_Fz,phi_Fz,z3]=cart2sph(-8.9914,20.7601,60.1393)















