# Information-Rate-of-mmWave-Massive-MIMO-System
## Perfect CSI 

### Model of mmWave Massive-MIMO System:


```math
    \bar{y} = \textbf{H}\bar{x} + \bar{\eta} 
```


```math
    \bar{y} = \bar{h}_k x_k + {\sum_{j \neq k}\bar{h}_j x_j} + \bar{\eta} 
```


```math
    \bar{y} = \textbf{H}\bar{x} + \bar{\eta} 
```

We combine signals from all BS antennas using MRC ($\bar{w}$) receiver.


```math
    \bar{w} = \frac{\bar{h}_k}{||\bar{h}_k||}
```


```math
    \hat{x}_k = \bar{w}^{H}\bar{y}
```


```math
    \hat{x}_k = \frac{\bar{h}^{H}_k}{||\bar{h}_k||}(\bar{h}_k x_k + {\sum_{j \neq k}\bar{h}_j x_j} + \bar{\eta})
```



```math
    \hat{x}_k = ||\bar{h}_k||x_k + \underbrace{{\sum_{j \neq k}\frac{\bar{h}^{H}_k\bar{h}_j}{||\bar{h}_k||}}\bar{x}_j}_{MUI} + \frac{\bar{h}^{H}_k}{||\bar{h}_k||}\bar{\eta}
```


$SINR$ for user $k$ is given by-


```math
SINR = \frac{||\bar{h}_{k}||^2P_k}{{\sum_{i\neq k} p_i \beta_i}+N_o}
```


- Problem Statements: Simulate a mmWave Massive MIMO wireless system in MATLAB for perfect CSI assumtion for t = 10 Single antenna users. Generate uplink sum rate for both MRC and ZF receivers and show how no of antennas at BS impacts information rate in Infomation Rate vs Number of BS Antennas curve. 

- Simulation:


![Info_Rate_Perfect_CSI_No_Power_scaling](Info_Rate_Perfect_CSI_No_Power_scaling.png)


Large scale fading co-efficient for user $k$ is defined as - 


$$\beta_k = \frac{||\bar{h}_k||^2}{r}$$


Where $r$ is total no. of BS antennas and $\bar{h}_k$ is channel corresponding to user $k$. So, as the number of BS antennas $r$ is large or tends to be $\infty$, the channel is behaving as less and less fluctuating, or, we can say, less and less fading, called Channel Hardenning.


So for given user $k$-


```math
SINR = \frac{||\bar{h}_{k}||^2P_k}{{\sum_{i\neq k} p_i \beta_i}+N_o}
```


![Info_Rate_Perfect_CSI_No_Power_scaling_ues](Info_Rate_Perfect_CSI_No_Power_scaling_ues.png)


Now if we decrease power of user $k$ as (Power Scaling Law)-


$$P_k = \frac{E_k}{r}$$


and if $r\rightarrow\infty$ then-


$$SINR=\frac{\beta_k E_k}{N_o}$$


As $r$ is becoming large, transmit power of each user is becoming zero and $SINR$ is becoming constant. Hence we can't see much variation in information rate if we decrease power as $\frac{E_k}{r}$.


![Info_Rate_Perfect_CSI_Power_scaling](Info_Rate_Perfect_CSI_Power_scaling.png)


![Info_Rate_Perfect_CSI_Power_scaling_ues](Info_Rate_Perfect_CSI_Power_scaling_ues.png)


## Imperfect CSI:

### Uplink Channel Estimation
### Pilot i/o-o/p model:


```math
       \underbrace{Y_p}_{r\times L}=\underbrace{H}_{r\times t}\underbrace{X_p}_{t\times L}+\underbrace{V_p}_{r\times L} 
```


Minimize the Maximum Likelihood -


```math
        min ||Y_p-HX_p||^{2}_F
```


We get the channel estimate as -


```math
        \hat{H} = Y_pX^{H}_p(X_pX^{H}_p)^{-1}
```


```math
       \hat{H} = (HX_p+V_p)X^{H}_p(X_pX^{H}_p)^{-1}
 
```


```math
        \hat{H} = H + V_pX^{H}_p(X_pX^{H}_p)^{-1}    
```


```math
        \hat{h}_{lk}=h_{lk}+e_{lk}
```


$$e_{lk} = V_pX^{H}_p \frac{1}{L}\left \[{\begin{matrix}
\frac{1}{P_1} & & &\\
 & \frac{1}{P_2} & &\\
 & & . &\\
 & & &\frac{1}{P_t} \\
\end{matrix}}\right \]$$


Where $e_{lk}$ is estimation error with -

- Mean $\mathbb{E}[e_{lk}]=0$

- Variance $\mathbb{E}[{|e_{lk}|^2}]=\frac{N_o}{LP_t}$

So the variance of estimate of channel $\hat{h}_{lk}$ -


```math
    \mathbb{E}[|\hat{h}_{lk}|^2]=\beta_k + \frac{N_o}{LP_k}
```

Match Fitering - 

```math
    \hat{x}_k = \hat{h}^{H}_k \bar{y}
```


```math
    \hat{x}_k = (\bar{h}_k + \bar{e}_k)^H (\bar{h}_k x_k + {\sum_{j \neq k}\bar{h}_j x_j} + \bar{v})
```


```math
    \hat{x}_k = ||\bar{h}_k||^2 x_k + \bar{e}^{H}_k \bar{h}_k x_k + \hat{h}^{H}_k {\sum_{j \neq k}\bar{h}_j x_j} + \hat{h}^{H}_k \bar{v}
```

$SINR$ for given user k - 

```math
    SINR = \frac{P_k ||\bar{h}_k||^4}{P_k \mathbb{E}[|\bar{e}^{H}_k \bar{h}_k|^2] + \sum_{j \neq k}P_j \mathbb{E}[|\hat{h}^{H}_j|^2] + \mathbb{E}[|\hat{h}^{H}_k \bar{v}|^2]}
```


Finally $SINR$ expression after simplification is given by -


```math
    SINR = \frac{||\bar{h}_k||^2 P_k}{\frac{N_o}{L} + \frac{\sum_{j \neq k} P_j \beta_j (\beta_k+\frac{N_o}{LP_k})}{\beta_k} + \frac{N_o(\beta_k + \frac{N_o}{LP_k})}{\beta_k}}
```


- Problem Statement: Simulate a mmWave Massive MIMO wireless system in MATLAB for imperfect CSI assumtion for t = 10 Single antenna users. Generate uplink sum rate with channel estimation for MRC receivers and show how no of antennas at BS impacts information rate in Infomation rate vs Number of BS Antennas curve. 


- Simulation: 


![Info_Rate_Imerfect_CSI_No_Power_Scaling](Info_Rate_Imperfect_CSI_No_Power_Scaling.png)


![Info_Rate_Imerfect_CSI_No_Power_Scaling_ues](Info_Rate_Imperfect_CSI_No_Power_Scaling_ues.png)


Now if decrease power of user $k$ as (Power Scaling Law)-


$$P_k = \frac{E_k}{r}$$


As variance of channel estimation error directly proprotional to BS antennas $r$ and $SINR$ will become zero if we increase the BS antennas. Hence we can't decrease power as $\frac{E_k}{r}$.  


- Simulation: 


![Info_Rate_Imerfect_CSI_Power_Scaling_1](Info_Rate_Imperfect_CSI_Power_Scaling_1.png)


![Info_Rate_Imerfect_CSI_Power_Scaling_1_ues](Info_Rate_Imperfect_CSI_Power_Scaling_1_ues.png)


Now if decrease power of user $k$ as (Power Scaling Law)-


$$P_k = \frac{E_k}{\sqrt{r}}$$


$SINR$ become constant and we can't decrease power any faster than $\frac{E_k}{\sqrt{r}}$ in presence of channel estimation error (or CSI uncertinity). $SINR$ for given user k is given by-


```math
    SINR = \frac{E^{2}_k \beta^{2}_k L}{N^{2}_o}
```


- Simulation: 


![Info_Rate_Imerfect_CSI_Power_Scaling_2](Info_Rate_Imperfect_CSI_Power_Scaling_2.png)


![Info_Rate_Imerfect_CSI_Power_Scaling_2_ues](Info_Rate_Imperfect_CSI_Power_Scaling_2_ues.png)