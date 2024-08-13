* -------------------------------------------------------------------------
* Date: July 2024
* Paper: Does ethical framing matter? The short-term impact of an environmental education class for elementary school on students and their parents
*	
* Parents (coefplot)	
* Figures 3 and 4
*   Fig. 3. The impacts of the class on parents' outcomes. 
*   Fig. 4. The impacts of the class on parents' attitudes toward the issue of increasing solar panels in the Kushiro Wetland.
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

graph set window fontface "Arial"

xtset pid round

*************************************************************
*   Fig. 3. The impacts of the class on parents' outcomes   *
*************************************************************

***I. Attitude (Interests)***
**(i) Kushiro Wetland (PQ1)**
quietly eststo RP1: xtreg PQ1 af_post naf_post, fe cluster(scid)
coefplot(RP1,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP1,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel /// 
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) /// 
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Interest_KW_PQ1.gph",replace
graph export "FE_parent_Interest_KW_PQ1.png",replace 
graph export "FE_parent_Interest_KW_PQ1.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) Renewable Energy: RE (PQ2)**
quietly eststo RP2: xtreg PQ2 af_post naf_post, fe cluster(scid)
coefplot (RP2,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP2,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Interest_RE_PQ2.gph",replace
graph export "FE_parent_Interest_RE_PQ2.png",replace 
graph export "FE_parent_Interest_RE_PQ2.pdf",replace 
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(iii) Increase of solar panel (PQ51)**
quietly eststo RP3: xtreg PQ51 af_post naf_post, fe cluster(scid)
coefplot (RP3,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP3,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Interest_SP_PQ51.gph",replace
graph export "FE_parent_Interest_SP_PQ51.png",replace 
graph export "FE_parent_Interest_SP_PQ51.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

***II. A sense of Responsibility***
**(i) For self (PQ3a)**
quietly eststo RP7: xtreg PQ3a af_post naf_post, fe cluster(scid)
coefplot (RP7,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP7,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Responseb_self_PQ3a.gph",replace
graph export "FE_parent_Responseb_self_PQ3a.png",replace 
graph export "FE_parent_Responseb_self_PQ3a.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) With others (PQ3b)**
quietly eststo RP8: xtreg PQ3b af_post naf_post, fe cluster(scid)
coefplot (RP8,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP8,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Responseb_other_PQ3b.gph",replace
graph export "FE_parent_Responseb_other_PQ3b.png",replace 
graph export "FE_parent_Responseb_other_PQ3b.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

***III. Locus of Control***
**(i) Locus of Control: For self (PQ4a)**
quietly eststo RP5: xtreg PQ4a af_post naf_post, fe cluster(scid)
coefplot (RP5,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP5,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)) , baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Locus_self_PQ4a.gph",replace
graph export "FE_parent_Locus_self_PQ4a.png",replace 
graph export "FE_parent_Locus_self_PQ4a.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) Locus of Control: with others (PQ4b)	**
quietly eststo RP6: xtreg PQ4b af_post naf_post, fe cluster(scid)
coefplot (RP6,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP6,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)) , baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Locus_other_PQ4b.gph",replace
graph export "FE_parent_Locus_other_PQ4b.png",replace 
graph export "FE_parent_Locus_other_PQ4b.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**********************************************************************************************************************************
*   Fig. 4. The impacts of the class on parents' attitudes toward the issue of increasing solar panels in the Kushiro Wetland.   *
**********************************************************************************************************************************

**Ovarall (PQ52)**
quietly eststo RP4: xtreg PQ52 af_post naf_post, fe cluster(scid)
coefplot (RP4,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP4,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_Overall_PQ52.gph",replace
graph export "FE_parent_Overall_PQ52.png",replace 
graph export "FE_parent_Overall_PQ52.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(i) Effective land use (PQ53a)**
quietly eststo RP9: xtreg PQ53a af_post naf_post, fe cluster(scid)
coefplot(RP9,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP9,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_effectiveuse_PQ53a.gph",replace
graph export "FE_parent_effectiveuse_PQ53a.png",replace 
graph export "FE_parent_effectiveuse_PQ53a.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ii) Decrease of fossil fuel power generation (PQ53b)**
quietly eststo RP10: xtreg PQ53b af_post naf_post, fe cluster(scid)
coefplot (RP10,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP10,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel /// 
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f)) 
graph save "FE_parent_decrefossilfuel_PQ53b.gph",replace
graph export "FE_parent_decrefossilfuel_PQ53b.png",replace 
graph export "FE_parent_decrefossilfuel_PQ53b.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(iii) Creation of job opportunities (PQ53c)**
quietly eststo RP11: xtreg PQ53c af_post naf_post, fe cluster(scid)
coefplot (RP11,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP11,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f)) 
graph save "FE_parent_jobopportunities_PQ53c.gph",replace
graph export "FE_parent_jobopportunities_PQ53c.png",replace 
graph export "FE_parent_jobopportunities_PQ53c.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(iv) Contribution to global warming (PQ53d)**
quietly eststo RP12: xtreg PQ53d af_post naf_post, fe cluster(scid)
coefplot (RP12,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP12,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_globalwarming_PQ53d.gph",replace
graph export "FE_parent_globalwarming_PQ53d.png",replace 
graph export "FE_parent_globalwarming_PQ53d.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(v) Deterioration of the landscape (PQ53e)**
quietly eststo RP13: xtreg PQ53e af_post naf_post, fe cluster(scid)
coefplot (RP13,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP13,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)) , baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f)) 
graph save "FE_parent_landscape_PQ53e.gph",replace
graph export "FE_parent_landscape_PQ53e.png",replace 
graph export "FE_parent_landscape_PQ53e.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(vi) Negative impact on tourism (PQ53f)**
quietly eststo RP14: xtreg PQ53f af_post naf_post, fe cluster(scid)
coefplot (RP14,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP14,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)) , baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f)) 
graph save "FE_parent_tourism_PQ53f.gph",replace
graph export "FE_parent_tourism_PQ53f.png",replace 
graph export "FE_parent_tourism_PQ53f.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(vii) Negative impact on flora and fauna (PQ53g)**
quietly eststo RP15: xtreg PQ53g af_post naf_post, fe cluster(scid)
coefplot (RP15,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel /// 
mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP15,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_flora_PQ53g.gph",replace
graph export "FE_parent_flora_PQ53g.png",replace 
graph export "FE_parent_flora_PQ53g.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(viii) disposal of desired solar panels (PQ53h)**
quietly eststo RP16: xtreg PQ53h af_post naf_post, fe cluster(scid)
coefplot (RP16,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP16,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_cons_solar_PQ53h.gph",replace
graph export "FE_parent_cons_solar_PQ53h.png",replace 
graph export "FE_parent_cons_solar_PQ53h.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(ix) Increased risk of disasters (PQ53i)**
quietly eststo RP17: xtreg PQ53i af_post naf_post, fe cluster(scid)
coefplot (RP17,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP17,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white))  grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_cons_disaster_PQ53i.gph",replace
graph export "FE_parent_cons_disaster_PQ53i.png",replace 
graph export "FE_parent_cons_disaster_PQ53i.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0

**(x) Respecting the intentions of landowners (PQ53j)**
quietly eststo RP18: xtreg PQ53j af_post naf_post, fe cluster(scid)
coefplot (RP18,  keep(af_post) mcolor(ebblue) ciopts(color(black) recast(rcap)) mlabel ///
 mlabcolor(ebblue) mlabposition(15) mlabsize(medium) ) ///
 (RP18,keep(naf_post) mcolor(green) mlabcolor(green)ciopts(color(black) recast(rcap)) mlabel ///
 mlabposition(15) mlabsize(medium)), baselevels xline(0) msymbol(D) mfcolor(white) ciopts(lwidth(*2) lcolor(*.6))  plotregion(margin(small)) ///
 nokey format(%5.2f) graphregion(margin(zero)) ///
 graphregion(color(white)) grid(none) scale(3.2) xscale(r(-0.45 0.45)) xlabel(-0.4 -0.2 0 0.2 0.4, format(%3.1f))
graph save "FE_parent_respect_landowner_PQ53j.gph",replace
graph export "FE_parent_respect_landowner_PQ53j.png",replace 
graph export "FE_parent_respect_landowner_PQ53j.pdf",replace
/*F-test*/
test af_post = naf_post
test af_post = naf_post = 0