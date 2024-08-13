* -------------------------------------------------------------------------
* Date: July 2024
* Paper: Does ethical framing matter? The short-term impact of an environmental education class for elementary school on students and their parents
*	
* Students (coefplot)	
* Figure 2
*   Fig. 2. The impacts of the class on students' outcomes. 
* --------------------------------------------------------------------------

use Student.dta, clear

*treat: 0 = Anthropocentric Framing, 1 = Non-anthropocentric Framing
*round: 0 = baseline survey, 1 = endline survey
*af_post: Anthropocentric Framing * endline survey
*naf_post: Non-anthropocentric Framing * endline survey

gen af_post = 1 if treat == 0 & round == 1
replace af_post = 0 if treat ~= 0 | round ~= 1
gen naf_post = 1 if treat == 1 & round == 1
replace naf_post = 0 if treat ~= 1 | round ~= 1

label variable af_post "AF"
label variable naf_post "NAF"

graph set window fontface "Arial"

* Make variables of 2-MEV

gen mev_preserve=SQ7a+SQ7b+SQ7c+SQ7d+SQ7e+SQ7f+SQ7g+SQ7h+SQ7i
gen mev_utilize=SQ7j+SQ7k+SQ7l+SQ7m+SQ7n+SQ7o+SQ7p

gen mean_mev_preserve = mev_preserve / 9
gen mean_mev_utilize = mev_utilize / 7

xtset pid round

*************************************************************
*   Fig. 2. The impacts of the class on students' outcomes  *
*************************************************************

***I. Attitude***
***Interests***
**(i) Kushiro Wetland (SQ1)**
quietly eststo RSQ1in: xtreg SQ1 af_post naf_post,fe cluster(scid)
coefplot(RSQ1in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ1in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white)  plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_Interest_KW_SQ1.gph",replace
graph export "FE_student_Interest_KW_SQ1.png",replace 
graph export "FE_student_Interest_KW_SQ1.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) Renewable Energy: RE (SQ2)**
quietly eststo RSQ2in: xtreg SQ2 af_post naf_post,fe cluster(scid)
coefplot(RSQ2in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ2in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "$FE_student_Interest_RE_SQ2.gph",replace
graph export "FE_student_Interest_RE_SQ2.png",replace 
graph export "FE_student_Interest_RE_SQ2.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

***2-MEV***
**(iii) Utilization (mean_mev_utilize)**
quietly eststo RSQ8in: xtreg mean_mev_utilize af_post naf_post,fe cluster(scid)
coefplot(RSQ8in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ8in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_MEV_Utilization.gph",replace
graph export "FE_student_MEV_Utilization.png",replace 
graph export "FE_student_MEV_Utilization.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(iv) Preservation (mean_mev_preserve)**
quietly eststo RSQ7in: xtreg mean_mev_preserve af_post naf_post,fe cluster(scid)
coefplot(RSQ7in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ7in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_MEV_Preservation.gph",replace
graph export "FE_student_MEV_Preservation.png",replace 
graph export "FE_student_MEV_Preservation.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

***II. A Sense of Responsibility***
**(i) For self (SQ3)**
quietly eststo RSQ3in: xtreg SQ3 af_post naf_post,fe cluster(scid)
coefplot(RSQ3in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ3in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_Responsibility_self_SQ3.gph",replace
graph export "FE_student_Responsibility_self_SQ3.png",replace 
graph export "FE_student_Responsibility_self_SQ3.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) With others (SQ4)**
quietly eststo RSQ4in: xtreg SQ4 af_post naf_post,fe cluster(scid)
coefplot(RSQ4in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ4in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_Responsibility_others_SQ4.gph",replace
graph export "FE_student_Responsibility_others_SQ4.png",replace 
graph export "FE_student_Responsibility_others_SQ4.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

***III. Locus of Control***
**(i) For self (SQ5)**
quietly eststo RSQ5in: xtreg SQ5 af_post naf_post,fe cluster(scid)
coefplot(RSQ5in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ5in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_Locus_self_SQ5.gph",replace
graph export "FE_student_Locus_self_SQ5.png",replace 
graph export "FE_student_Locus_self_SQ5.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) With others (SQ6)**
quietly eststo RSQ6in: xtreg SQ6 af_post naf_post,fe cluster(scid)
coefplot(RSQ6in,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium)) ///
 (RSQ6in,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), ///
 baselevels xline(0) msymbol(D) mfcolor(white) plotregion(margin(small)) nokey format(%5.2f)   graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none)  scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_student_Locus_others_SQ6.gph",replace
graph export "FE_student_Locus_others_SQ6.png",replace 
graph export "FE_student_Locus_others_SQ6.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0




