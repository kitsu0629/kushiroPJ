* -------------------------------------------------------------------------
* Date: July 2024
* Paper: Does ethical framing matter? The short-term impact of an environmental education class for elementary school on students and their parents
*
* Estimation Results: Parents	
* Supplementary Information C: Results tables of regression analysis
*   Supplementary Table C.2. The estimation results (Parents, Figure 3). 
*   Supplementary Table C.3. The estimation results (Parents, Figure 4). 
*   Supplementary Table C.4. The estimation results (Parents, Figure 4).
* --------------------------------------------------------------------------

use Parent.dta,clear

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

xtset pid round

* Supplementary Table C.2. The estimation results (Parents, Figure 3). 

xtreg PQ1 af_post naf_post,fe cluster(scid)
test af_post=naf_post
test af_post=naf_post=0
outreg2 using result_parent_fe_supplC2.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) replace

foreach x in PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b {
	xtreg `x' af_post naf_post,fe cluster(scid)
	test af_post=naf_post
	test af_post=naf_post=0
	outreg2 using result_parent_fe_supplC2.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) append
}


* Supplementary Table C.3. The estimation results (Parents, Figure 4). 

xtreg PQ52 af_post naf_post,fe cluster(scid)
test af_post=naf_post
test af_post=naf_post=0
outreg2 using result_parent_fe_supplC3.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) replace
	
foreach x in PQ53a PQ53b PQ53c PQ53d PQ53e {
	xtreg `x' af_post naf_post,fe cluster(scid)
	test af_post=naf_post
	test af_post=naf_post=0
	outreg2 using result_parent_fe_supplC3.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) append
}


* Supplementary Table C.4. The estimation results (Parents, Figure 4). 

xtreg PQ53f af_post naf_post,fe cluster(scid)
test af_post=naf_post
test af_post=naf_post=0
outreg2 using result_parent_fe_supplC4.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) replace


foreach x in PQ53g PQ53h PQ53i PQ53j {
	xtreg `x' af_post naf_post,fe cluster(scid)
	test af_post=naf_post
	test af_post=naf_post=0
	outreg2 using result_parent_fe_supplC4.xls ,excel bdec(3) pdec(3) keep(af_post naf_post) addtext(Individual FE, YES) append
}