# Information-Rate-of-mmWave-Massive-MIMO-System
## Perfect CSI 

- Problem Statements: Simulate a mmWave Massive MIMO wireless system in MATLAB for perfect CSI assumtion for K = 10 Single antenna users. Generate uplink sum rate for both MRC and ZF receivers and show how no of antennas at BS impacts information rate in Infomation vs No of antennas curve. 

- Simulation:


![Info_Rate_Perfect_CSI_No_Power_scaling](Info_Rate_Perfect_CSI_No_Power_scaling.png)

Large scale fading co-efficient for user $k$ is defined as - 

$$\beta_k = \frac{||\bar{h}_k||^2}{r}$$

Where $r$ is total no. of BS antennas. So, as the number of BS antennas $r$ is large or tends to be $\infty$, the channel is behaving as less and less fluctuating, or, we can say, less and less fading, called Channel Hardenning.

Now if we decrease power as -

$$P_k = \frac{E_k}{r}$$

So for given user $k$-

$$SINR = \frac{||\bar{h}_k||^2 P_k}{\sum_{i\neqk}P_i\brta_i + N_o}$$

and $r\rightarrow\infty$ then -

$$SINR=\frac{\beta_k E_k}{N_o}$$


![Info_Rate_Perfect_CSI_No_Power_scaling_ues](Info_Rate_Perfect_CSI_No_Power_scaling_ues.png)


- Problem Statement:

- Simulation:


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