gen k = yobirth + 14 - 47 //normalized

DCdensity k, breakpoint(0) b(1) h(2) generate(Xj Yj r0 fhat se_fhat) graphname(DCdensity_example.eps) 
drop Xj Yj r0 fhat se_fhat
DCdensity k if sex==1, breakpoint(0) b(1) h(2) generate(Xj Yj r0 fhat se_fhat) graphname(DCdensity_example.eps) 

drop Xj Yj r0 fhat se_fhat
DCdensity k if sex==2, breakpoint(0) b(1) h(2) generate(Xj Yj r0 fhat se_fhat) graphname(DCdensity_example.eps) 

drop Xj Yj r0 fhat se_fhat

//rddensity k, plot kernel(uniform)

cmogram ageleft k, cut(0) scatter line(0) lfitci  noten 

cmogram ageleft k if sex==1, cut(0) scatter line(0) lfitci  noten 
cmogram ageleft k if sex==2, cut(0) scatter line(0) lfitci  noten 

//placebo:

cmogram ageleft k, cut(5) scatter line(5) lfitci  noten 

rdrobust goodhealth k
esttab using placebo1.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) replace
rdrobust badhealth k
esttab using placebo2.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 
rdrobust unemployed k 
esttab using placebo3.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 
rdrobust incsupport k 
esttab using placebo4.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 
rdrobust linc k
esttab using placebo5.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 
rdrobust lhinc k
esttab using placebo6.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 

rdplot goodhealth k 
graph save placebo1.gph
rdplot badhealth k
graph save placebo2.gph
rdplot unemployed k 
graph save placebo3.gph
rdplot incsupport k
graph save placebo4.gph
rdplot lhinc k
graph save placebo5.gph
rdplot linc k
graph save placebo6.gph

graph combine placebo1.gph placebo2.gph placebo3.gph placebo5.gph placebo6.gph

 rddensity k
//drop Xj Yj r0 fhat se_fhat
//DCdensity k, breakpoint(-10) b(0.25) h(1.5) generate(Xj Yj r0 fhat se_fhat) graphname(DCdensity_example.eps) 

//fuzzy
gen t=0 if k<0
replace t=1 if k>=0

cmogram learn k,cut(0) scatter line(0) lfitci  noten 

gen k2 = k^2
gen k3 = k^3

//1st stage:
reg learn t k k2-k3 [fw=wght] if abs(k)<5, cluster(clust)
reg ageleft t k k2-k3 [fw=wght] if abs(k)<5, cluster(clust)
esttab using fuzzy1st.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 

test t

//2nd stage:
ivreg2 learn k k2-k3 (ageleft=t) [fw=wght] if abs(k)<5, cluster(clust) first
esttab using fuzzy2st.tex, cells(b(star fmt(3)) se(par) p()) r2 ci starlevels(+ 0.10 * 0.05 ** 0.01 *** 0.001) 
