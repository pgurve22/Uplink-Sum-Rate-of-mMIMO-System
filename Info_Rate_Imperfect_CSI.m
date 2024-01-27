%>>>>>>>>>>>>>>>>mmWave Massive MIMO System Imerfect CSI>>>>>>>>>>>>>>>
clear all;
ITER = 1000;
K = 10; % Number of users
Mv = 20:30:500; % Number of BS antennas
EudB = 10;
Eu = 10^(EudB/10);
rateMRC = zeros(1,length(Mv));  
boundMRC = zeros(1,length(Mv)); %lower bound for max achieving rate

for ite=1:ITER
    [a,ite]
    D = Dmatrix(K); 
    ubeta = diag(D);    % large scaling fading coeff for each user 
    for mx=1:length(Mv)
        M = Mv(mx); % changing the no of bs anteena for each iterations
        pu = Eu;    % No Power Scaling
        %pu = Eu/M;  % Power Scaling
        %pu = Eu/sqrt(M);   % Power Scaling
        Pp = K*pu;  % power 
        Phi = sqrt(1/K)*dftmtx(K);  %pilot vector
        H = sqrt(1/2)*(randn(Mv(mx),K)+1i*randn(Mv(mx),K));
        G = H*sqrt(D);  % allocating power to channel corrosp each user
        N = sqrt(1/2)*(randn(M,K)+1i*randn(M,K));   % noise matrix
        RxBlk = sqrt(Pp)*G*Phi +N; %Rx block
        Ghat = sqrt(1/Pp)*RxBlk*Phi'; 
        g1hat = Ghat(:,1);%estimate channel for user 1                   
        g1 = G(:,1); %channel for user 1 
        e1 = g1hat - g1; % estimation error
        NrMRC = pu*norm(g1)^2;  
        NrBoundMRC = pu*M*ubeta(1);
        DrBoundMRC = 1/K + (ubeta(1)+1/K/pu)/ubeta(1);
        DrMRC = pu*abs(g1'/norm(g1)*e1)^2 + norm(g1hat)^2/norm(g1)^2;
        DrMRC = DrMRC + pu*norm(g1hat'/norm(g1)*G(:,2:K))^2;
        DrBoundMRC = DrBoundMRC + pu*(ubeta(1)+1/K/pu)*sum(ubeta(2:K))/ubeta(1);
        rateMRC(mx) = rateMRC(mx)+ log2(1+NrMRC/DrMRC);
        boundMRC(mx) = boundMRC(mx)+ log2(1+NrBoundMRC/DrBoundMRC);
    end
end

rateMRC = rateMRC/ITER;
boundMRC = boundMRC/ITER;
plot(Mv,rateMRC,' -s','LineWidth',1.8,'MarkerFaceColor','auto','MarkerSize',8.0)
hold on
plot(Mv,boundMRC,' -. ','LineWidth',1.8,'MarkerFaceColor','auto','MarkerSize',8.0)
grid on
title('Information Rate of Massive MIMO with Channel Estimation')
%title('Information Rate of Massive MIMO with Channel Estimationv with Power Scaling')
leg=legend('MRC', 'Bound MRC','Location','SouthEast');
title(leg,'Imperfect CSI')
xlabel('Number of BS Antennas')
ylabel('Uplink Sum Rate (bits/s/Hz)')
