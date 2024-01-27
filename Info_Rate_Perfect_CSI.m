%>>>>>>>>>>>>>>>>>mmWave Massive MIMO System Perfect CSI>>>>>>>>>>>>>>>
clear all;
ITER = 1000;
K = 10; % Number of users
Mv = 20:30:500; % Number of BS antennas
Eu_dB = 10;  
Eu = 10^(Eu_dB/10);
rate_MRC = zeros(1,length(Mv)); %max achievable rate for MRC
bound_MRC = zeros(1,length(Mv)); %lower bound for max achievable rate
rate_ZF = zeros(1,length(Mv)); %max achievable rate for ZF

for it=1:ITER    
    it
    D = Dmatrix(K); 
    beta = diag(D);     % diag matrix or co-variance
    for mx=1:length(Mv)     
        M = Mv(mx); % changing the bs anteena for each iterations
        pu = Eu; %<<<<<No power scaling
        %pu = Eu/M; %<<<<<power scaling
        H = sqrt(1/2)*(randn(M,K))+1i*randn(M,K);   %CSCG 
        G = H*sqrt(D);  % allocating power to channel corrosponding to each user
        g1 = G(:,1); % column of user k
        nr_MRC = pu*norm(g1)^2; % rx power for user 1
        nr_bound_MRC = pu*M*beta(1);
        dr_MRC = 1+pu*norm(g1'/norm(g1)*G(:,2:K))^2;    % interfernce power
        dr_bound_MRC = 1 + pu*sum(beta(2:K)); % dr of thereoth lower bound of MRC
        rate_MRC(mx) = rate_MRC(mx)+log2(1+nr_MRC/dr_MRC); % channel capacity 
        bound_MRC(mx) = bound_MRC(mx)+log2(1+nr_bound_MRC/dr_bound_MRC);

        nr_ZF = pu; invGG = inv(G'*G);
        dr_ZF = invGG(1,1);
        rate_ZF(mx) = rate_ZF(mx)+log2(1+nr_ZF/dr_ZF);
    end
end
rate_MRC = rate_MRC/ITER;
bound_MRC = bound_MRC/ITER;
rate_ZF = rate_ZF/ITER;

figure()
plot(Mv,rate_MRC,' o-','LineWidth',1.8,'MarkerFaceColor','auto','MarkerSize',8.0)
hold on
plot(Mv,bound_MRC,' -.','LineWidth',1.8)
plot(Mv,rate_ZF,' -s','LineWidth',1.8,'MarkerFaceColor','auto','MarkerSize',8.0)
grid on
title('Information Rate of mmWave Massive MIMO System with No Power Scaling')
%title('Information Rate of mmWave Massive MIMO System with Power Scaling')
leg=legend('MRC','Bound MRC','ZF','Location','SouthEast');
title(leg,'Perfect CSI')
xlabel('Number of BS Antennas')
ylabel('Uplink Sum Rate (bits/s/Hz)')
