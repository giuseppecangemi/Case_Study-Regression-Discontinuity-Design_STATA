# Case_Study-Regression-Discontinuity-Design_STATA
In 1947, the compulsory school-leaving age in England, Scotland and Wales was raised from 14 to 15 years old. Within two years after policy implementation, the proportion of individuals who left full-time education by age 14 fell to less than 10 percent. I investigate whether this government policy has had any effect on the monetary rate of return. In order to get useful information I developed different models.  First, I develop the ordinary least squares method (OLS), then the instrumental variable method (IV) and finally I show a regression discontinuity design (RDD).

#########

STEP 1 - OLS: To estimate more familiar and comparable returns to years of schooling, we measure education by the age at which individuals completed full-time education.
By developing an OLS model, I link the return rate to the years of study (the age at which the individual completed full-time education). To do this I raise the "age" variable to a power because in this way I am able to grasp the impact of the experience. The “age” variable contains in fact the age of the interviewees at the time of the survey. Clearly, if the respondents turned 18, they are likely to have acquired high skills and experience. By doing so, I somehow manage to control it. Another crucial point is to group the cohorts of people over the compulsory school age. In this way, we can differentiate the impact between the cohorts. Likewise they also group the place of birth. Both of the clusterizations just mentioned are within the cluster of variables.
The OLS regression will be the following:

<img src="https://render.githubusercontent.com/render/math?math={\color{white}\ln Y =  \alpha \%2B X_i\mu \%2B \beta_1\ ageleft \%2B \eta_1\ age \%2B \eta_2\ age^2 \%2B \epsilon}">

Where the vector X_i includes birth cohort and place of birth,  ageleft means age at which the individual completed full-time education and finally age and  age squared in order to consider experience. 

BIAS: These results can suffer from major biases. In fact, one of the most important bias that I discover is that relating to the method used and the subsequent estimate (about 16%). In fact, the least squares method is a method that averages the entire sample. But we probably want to know what the effect of an extra year of compulsory schooling is, ruling out to consider the whole effect of an extra year on average on the whole sample. In fact, the bias I mentioned earlier is probably an apward bias. I try to avoid this kind of bias in step two when developing IV model. Another important bias, perhaps the most important and the most cited in the literature, is that related to skills, commonly called the "Ability Bias". It is likely that the individual’s degree of ability is positively correlated with both salary and the age at which he leaves school. This is because obviously if it is less difficult to study and if you get better results, you are likely to continue longer and get more skills. Likewise, if you have more skills than others, your salary will be higher. So we are in the presence of positive correlations both in X and in Y and this again leads to an upward bias in OLS estimates. 

#########

STEP 2 - IV: I create a dummy variable to develop IV regression. This dummy will be equal to 1 when individuals in 1947 are 14 or younger. In doing so I analyze only the treated individuals, that is the individuals who have some effect from the established mandatory policy.


<img src="https://render.githubusercontent.com/render/math?math={\color{white}\ Dummy = 1 %2c if %2c i≤14 in 1947}">
<img src="https://render.githubusercontent.com/render/math?math={\color{white}\ Dummy = 0 %2c if %2c i>14 in 1947}">

I perform the first stage regression using as exogenous variable ageleft and as endogenous variables our previously constructed dummy and the previous vari- ables age and age squared (clustering as in point 1). The equation is the following:

<img src="https://render.githubusercontent.com/render/math?math={\color{white}\ ageleft = \beta\ dummy %2b  \eta_1\ age %2b \eta_2\ age^2 %2b \epsilon}">


I tested the validity of the instrumental variable through the F-test, obtaining an F-test equal to 213.84. Using this dummy a problem arises. In fact, we need to understand if this dummy is actually able to explain the effect of the policy introduced. As I mentioned earlier, by developing IV regression we get a local effect, but are everyone treated affected by this policy? I think that in reality this dummy does not give us any indication of those people who would have continued their studies anyway. For instance, a young person who plans to continue his studies and get a bachelor's, master's or Ph.D degree will not be affected by this policy. Therefore the coefficients deriving from the use of this dummy could be biased and give us erroneous indications. For this reason I think it is a weak instrument. But there may be a further problem. Trafficked people could give up their studies the following year, reducing the positive effect of the policy introduced. Following the exclusion restriction definition, the dummy variable must be related to the explanatory variables but it must not be related to the Y.

The equation related to the second stage is the following: 

<img src="https://render.githubusercontent.com/render/math?math={\color{white}\ learn = \beta \ \widehat{ageleft} %2b \eta_1 \ age %2b \eta_2 \ age^2 %2b \zeta}">

The hat over the "ageleft" means that the Y I got from the first step regression is put inside this second equation.

The results I obtained from IV regression are bigger than OLS: one more year of compulsory schooling leads to about 51 percent more earnings than the 16 percent of the OLS. This result is consistent with the literature since with IV regression we are going to see the effect for those subjects who have an effect from the introduction of the policy.  Instead OLS regression estimates about the average population. Although the direction is consistent with the literature, the result seems to be really great. 

#########

STEP 3 - RDD: In a regression discontinuity design (RDD) a discontinuity is suggestive of violations of the no manipulation assumption. In fact one could manipulate the running variable X (k on STATA in our case) in order to be on one side of the cut off rather than the other. So if we graphically see discontinuity on the cut off it means that there can be manipulation. 

I develop discontinuity regressions to see if does exist the jump on the threshold. 

From the results we obtain it would seem to have an effect related to the presented policy. The jump is evident.

I try to do some tests (placebo) by arbitrarily changing the running variable to 5 (no longer 0). As we can see from the following graph, the discontinuity no longer exists. Thus, there is another reason for considering the discontinuity on the correct cut off to be correct and indicative.
