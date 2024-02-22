function [transfer_function,C,D,I]=Tnew(k,om,sym)
%compute transfer function T(k,om) sym=+/- 1 

%define parameters of the model
 gamma_e=116;% Cortical damping rate 116 s^-1
% gains
G_ei=-4.11;
G_ee=2.07;
G_es=0.77; %trying changing the gain
G_se=7.77; 
G_sr=-3.3;
G_sn=8.10;
G_re=0.66;
G_rs=0.2;
G_ese= G_es*G_se;
G_erse=G_es*G_sr*G_re;
G_srs= G_sr*G_rs;
G_esn=G_es*G_sn;


%values
%alpha=83; %  Inverse synaptodendritic decay time 83.3 S^-1 (wake) 
alpha=50;
%beta=769;  %  Inverse synaptodendritic rise time 770 S^-1 (wake)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ; % Inverse synaptodendritic rise time 770 (wake)
beta=200;
%r_e=0.086;% citatory axon range 0.086 m
r_e=60;
R=0.1; % radius of the head
G_ee_LR=0.7665; %interhemispheric coupling to have I_ee=0.15
t_LR=0.02; %interhemispheric loop delay


%write all parameters in a file to output
% 
tau_es=0.020;
tau_se=0.060;


%new code

%t_0_eta=[0.0800    0.0808    0.0785    0.0801    0.0750    0.0915    0.0907    0.0850    0.0723];
%t_0_eta=[ 0.0800    0.0804    0.0792    0.0800    0.0796    0.0810    0.0809    0.0804    0.0793];


tau=0.08;


L=(1./(1.0-(1j.*om)./alpha)).*(1./(1.0-(1j.*om)./beta));

C= (L.^2.*G_esn.*exp(1j.*om.*tau_es))./((1-L.^2.*G_srs).*(1-L.*G_ei));

%D= (1-(1j.*om)./gamma_e).^2 + r_e.^2.*k.^2 - 1./(1-L.*G_ei).*(L.*G_ee+((L.^2.*G_ese+L.^3.*G_erse).*exp(1j.*om.*(tau_es+tau_se))./(1-L.^2.*G_srs))); %Natasha

D= (1-(1j.*om)./gamma_e).^2 + r_e.^2.*(k.^2)- 1./(1-L.*G_ei).*(L.*G_ee+((L.^2.*G_ese+L.^3.*G_erse).*exp(1j.*om.*(tau))./(1-L.^2.*G_srs))); %Rawan

I= (L.*G_ee_LR.*exp(1j.*om.*t_LR))./(1-L.*G_ei);


transfer_function= C./(D-sym.*I); 

 %parabola (Fig3)
 %q=(1-(1j*om)/gamma_e).^2; 

 %cyclic term (Fig3)
 %q=(((((1./(1-(1j*om)/alpha)).*(1./(1-(1j*om)/beta))).^2*G_ese+((1./(1-(1j*om)/alpha)).*(1./(1-(1j*om)/beta))).^3*G_erse)).*exp(1j*om*(tau)))./((1-(((1./(1-(1j*om)/alpha)).*(1./(1-(1j*om)/beta))).^2*G_srs))))



end