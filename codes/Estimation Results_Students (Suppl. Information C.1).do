* -------------------------------------------------------------------------
* Date: July 2024
* Paper: Does ethical framing matter? The short-term impact of an environmental education class for elementary school on students and their parents
*
* Estimation Results: Students 	
* Supplementary Information C: Results tables of regression analysis
*   Supplementary Table C.1. The estimation results (Students, Figure 2).
* --------------------------------------------------------------------------

use Student,clear

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

* Make variables of 2-MEV

gen mev_preserve=SQ7a+SQ7b+SQ7c+SQ7d+SQ7e+SQ7f+SQ7g+SQ7h+SQ7i
gen mev_utilize=SQ7j+SQ7k+SQ7l+SQ7m+SQ7n+SQ7o+SQ7p

gen mean_mev_preserve = mev_preserve / 9
gen mean_mev_utilize = mev_utilize / 7

xtset pid round

* Supplementary Table C.1. The estimation results (Students, Figure 2).
xtreg SQ1 af_post naf_post, fe cluster(scid)
test af_post=naf_post
test af_post=naf_post=0
outreg2 using result_student_fe_supplC1.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES)  replace

foreach x in SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6 {
	xtreg `x' af_post naf_post, fe cluster(scid)
	test af_post=naf_post
	test af_post=naf_post=0
	outreg2 using result_student_fe_supplC1.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES)  append
}
