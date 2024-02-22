function [P_om]=power_spectrum_v1(t,eigS,eigenmodes_L,eigenvalues_L,r,input)

L = length(t);
dt= t(3)-t(2);    % Sampling period
Fs = 1/dt;          % Sampling frequency
fr = Fs*(0:L/2)/L;
om=2*pi*fr;
size_om=length(om);
num_modes=length(eigS);
P_om=zeros(1,size_om); % P(r,om)

switch input
    case 'white'
        M=10; % number of iterations to sum modes over, M>1 for white noise
        c=1;  % white noise flag for loop
    case 'deltar'
        M=1;
        c=0; % delta_r flag for loop
end

% Loop over modes and frequencies

a=1; % amplitude for modes
phin_norm=1; % normalization for phi_n
for n=1:size_om % loop over omega
    pn_delta=a*exp(1j*rand()*2*pi); % random phase depending on om (delta_r)
    for j=1:M % sum over M instances of modes
        for eta=1:num_modes
            k_L=eigenvalues_L(eigS(eta),eigS(eta)); % eigenvalues (k_eta)
            pn_white=a*exp(1j*rand()*2*pi); % random phase depending on eta, om and j (white noise)
            if c==1 % white noise case
                phi_n=phin_norm*pn_white;
            else    % delta_r case
                r0=9663;  % delta(r-r0) stimulus (cortical case)
             % r0=142242;%spherical test case
                phi_n=phin_norm*pn_delta*eigenmodes_L(r0,eigS(eta));
            end
            u1=eigenmodes_L(:,1);
             u2=eigenmodes_L(:,2);
                 u3=eigenmodes_L(:,3);
                     u4=eigenmodes_L(:,4);
                     k1=max(eigenvalues_L(:,2));
                     k2=max(eigenvalues_L(:,3));
                     k3=max(eigenvalues_L(:,4));


            y_eta=eigenmodes_L(:,eigS(eta));
            y_eta_r=y_eta(r);
            phi_nLs=phi_n;
            [~, C_Lp,D_Lp,~]=Tnew(k_L,om(n),0); % unihemispheric TF (left hemisphere)
            phi_om_L=C_Lp*D_Lp*phi_nLs/(D_Lp.^2);
          
        
            
         % P_om(n)=P_om(n)+abs(phi_om_L*y_eta_r).^2;   % update P(r,om) (Fig 5)


       

  %single alpha peak:CORRELATED

          
           % P_om(n)=P_om(n)+((abs(Tnew(0,om(n),0)))).*((u1(r))); %(uniform mode)
           %P_om(n)=P_om(n)+((abs(Tnew(k1,om(n),0)))).*((u2(r))); %(alpha Fig6)
           %P_om(n)=P_om(n)+((abs(Tnew(k2,om(n),0)))).*((u3(r))); %(mu Fig8)
           %P_om(n)=P_om(n)+((abs(Tnew(k3,om(n),0)))).*((u4(r))); %(tau Fig8)
  


 %Two alpha peaks:UNCORRELATED

 %P_om(n)=P_om(n)+((abs(Tnew(0,om(n),0))).^2).*((u1(r)).^2); (lower alpha peak) Fig7
 % P_om(n)=P_om(n)+(((abs(Tnew(k1,om(n),0)))).*((u2(r)))); %(upper alpha peak) Fig7
 %P_om(n)=P_om(n)+((abs(Tnew(k3,om(n),0)))).*(1.1.*(u4(r))).^2; %(upper alpha peak) Fig7


%mu
%P_om(n)= P_om(n)+((abs(Tnew(0,om(n),0))).^2).*(0.*(u1(r))).^2+(((abs(Tnew(k1,om(n),0)))).*(1.1.*(u4(r)))-((abs(Tnew(k2,om(n),0)))).*(0.69.*(u3(r)))).^2; 
%tau
%P_om(n)= P_om(n)+((abs(Tnew(0,om(n),0))).^2).*(0.*(u1(r))).^2+(((abs(Tnew(k3,om(n),0)))).*(0.69.*(u4(r)))+((abs(Tnew(k2,om(n),0)))).*(1.1.*(u3(r)))).^2;


 

        end
    end
end

end













