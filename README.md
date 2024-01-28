# Information-Rate-of-mmWave-Massive-MIMO-System
## Perfect CSI 

- Problem Statements: Simulate a mmWave Massive MIMO wireless system in MATLAB for perfect CSI assumtion for K = 10 Single antenna users. Generate uplink sum rate for both MRC and ZF receivers and show how no of antennas at BS impacts information rate in Infomation vs No of antennas curve. 

- Simulation:


![Info_Rate_Perfect_CSI_No_Power_scaling](Info_Rate_Perfect_CSI_No_Power_scaling.png)


Large scale fading co-efficient for user $k$ is defined as - 


$$\beta_k = \frac{||\bar{h}_k||^2}{N_r}$$


Where $N_r$ is total no. of BS antennas. So, as the number of BS antennas $N_r$ is large or tends to be $\infty$, the channel is behaving as less and less fluctuating, or, we can say, less and less fading, called Channel Hardenning.


So for given user $k$-


```math
SINR = \frac{||\bar{h}_{k}||^2P_k}{{\sum_{i\neq k} p_i \beta_i}+N_o}
```


![Info_Rate_Perfect_CSI_No_Power_scaling_ues](Info_Rate_Perfect_CSI_No_Power_scaling_ues.png)


Now if we decrease power as (Power Scaling Law)-


$$P_k = \frac{E_k}{N_r}$$


and if $N_r\rightarrow\infty$ then-


$$SINR=\frac{\beta_k E_k}{N_o}$$


As $N_r$ is becoming large, transmit power of each user is becoming zero and $SINR$ is becoming constant. 


![Info_Rate_Perfect_CSI_Power_scaling](Info_Rate_Perfect_CSI_Power_scaling.png)


![Info_Rate_Perfect_CSI_Power_scaling_ues](Info_Rate_Perfect_CSI_Power_scaling_ues.png)


## Imperfect CSI:

- Problem Statement:

- Simulation: 


![Info_Rate_Imerfect_CSI_No_Power_Scaling](Info_Rate_Imperfect_CSI_No_Power_Scaling.png)


![Info_Rate_Imerfect_CSI_No_Power_Scaling_ues](Info_Rate_Imperfect_CSI_No_Power_Scaling_ues.png)


- Problem Statement:

- Simulation: 


![Info_Rate_Imerfect_CSI_Power_Scaling_1](Info_Rate_Imperfect_CSI_Power_Scaling_1.png)


![Info_Rate_Imerfect_CSI_Power_Scaling_1_ues](Info_Rate_Imperfect_CSI_Power_Scaling_1_ues.png)


- Problem Statement:

- Simulation: 


![Info_Rate_Imerfect_CSI_Power_Scaling_2](Info_Rate_Imperfect_CSI_Power_Scaling_2.png)



![Info_Rate_Imerfect_CSI_Power_Scaling_2_ues](Info_Rate_Imperfect_CSI_Power_Scaling_2_ues.png)