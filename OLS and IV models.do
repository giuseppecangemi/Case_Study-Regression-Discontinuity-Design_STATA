
gen age2 = age^2 /age squared in order to get experience level

twoway (scatter learn ageleft) (lfit learn ageleft) 

reg learn ageleft age age2 [fw=wght], cluster(clust) 
esttab using Results\EstimationResults.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) replace

gen age47 = 47 - yobirth

gen dummy=1 if age47<=14
replace dummy=0 if age47>14

//1st stage:
reg ageleft dummy age age2 [fw=wght], cluster(clust)
outreg2 using ststage.tex, append ctitle(first stage)

//test:
test dummy 

predict ageleft_hat, xb

//2nd stage: 
reg learn ageleft_hat age age2 [fw=wght], cluster(clust)
esttab using TSLS.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) replace

ivreg2 learn (ageleft=dummy) age age2 [fw=wght], cluster(clust) first
esttab using ivreg2.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) replace
