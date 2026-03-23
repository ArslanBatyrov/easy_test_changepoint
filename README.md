# easy_test_changepoint
Here, I will make an attempt to correctly complete an easy test for the GSoC project (generalised changepoints). GSoC project of Ms Rebecca and  Mr Colin

So,the initial task given in the first (not the new second project), but first was:
Easy: Load the changepoint and EnvCpt packages, 
create a time series with changing AR structure, 
run only the change in AR1 and AR2 algorithms from EnvCpt NOT using the envcpt function 
(i.e. using the non-exported functions in the package) and plot the results.

## This is my solution: 

I created random numbers using the seed, split into half and created a breaking point in the middle. First AR had a lower dependence, specifically 0.21 while the second had 0.85> Breaking point was exactly at the middle which was 118. I plotted both showing the breaking point using a function abline. Next, I will present the graphs:

This is the dataset plotted in timeseries with a brekaing poin at 118:

<img width="633" height="604" alt="image1GSoC" src="https://github.com/user-attachments/assets/f16538c9-7847-4620-864b-6c33210cedbd" />


Next, this is the fitted AR1 line. Estimate gave 119 as breaking point which was very precise as the real breaking point was 118:


<img width="633" height="604" alt="image2GSoC" src="https://github.com/user-attachments/assets/143121ad-d302-4012-b3fa-7400cec6f98c" />
