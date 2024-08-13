* -------------------------------------------------------------------------
* Date: July 2024
* Paper: Does ethical framing matter? The short-term impact of an environmental education class for elementary school on students and their parents
*
* Descriptive Statistics 	
* Supplementary Information B: Descriptive statistics
*   Supplementary Table B.1. The difference in means in outcomes from students' baseline survey. 
*   Supplementary Table B.2. The difference in means in outcomes from students' endline survey. 
*   Supplementary Table B.3. The difference in means in outcomes from parents' baseline survey. 
*   Supplementary Table B.4. The difference in means in outcomes from parents' endline survey. 
* --------------------------------------------------------------------------

*=========================================================================
* Descriptive Statistics and Pairwise t-test: Student
*   Supplementary Table B.1. The difference in means in outcomes from students' baseline survey. 
*   Supplementary Table B.2. The difference in means in outcomes from students' endline survey. 
*=========================================================================

**************************************************************************
* a-1. Descriptive Statistics: Student
**************************************************************************

use Student.dta,clear


*treat: 0 = Anthropocentric Framing, 1 = Non-anthropocentric Framing
*round: 0 = baseline survey, 1 = endline survey
*af_post: Anthropocentric Framing * endline survey
*naf_post: Non-anthropocentric Framing * endline survey

gen af_post = 1 if treat == 0 & round == 1
replace af_post = 0 if treat ~= 0 | round ~= 1
gen naf_post = 1 if treat == 1 & round == 1
replace naf_post = 0 if treat ~= 1 | round ~= 1

* Make variables of 2-MEV

gen mev_preserve=SQ7a+SQ7b+SQ7c+SQ7d+SQ7e+SQ7f+SQ7g+SQ7h+SQ7i
gen mev_utilize=SQ7j+SQ7k+SQ7l+SQ7m+SQ7n+SQ7o+SQ7p

gen mean_mev_preserve = mev_preserve / 9
gen mean_mev_utilize = mev_utilize / 7

xtset pid round

order SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6

*Anthropocentric Framing & baseline survey
outreg2 using desc_student_af_pre_supplB1.xls if treat == 0 & round == 0, replace sum(log) keep(SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6) bdec(3) 

*Non-Anthropocentric Framing & baseline survey
outreg2 using desc_student_naf_pre_supplB2.xls if treat == 1 & round == 0, replace sum(log) keep(SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6) bdec(3) 

*Anthropocentric Framing & endline survey
outreg2 using desc_student_af_post_supplB1.xls if treat == 0 & round == 1, replace sum(log) keep(SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6) bdec(3)  

*Non-Anthropocentric Framing & endline survey
outreg2 using desc_student_naf_post_supplB2.xls if treat == 1 & round == 1, replace sum(log) keep(SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6) bdec(3) 

**************************************************************************
* a-2. Pairwise t-test: Student
**************************************************************************

*Difference

global index_stu SQ1 SQ2 mean_mev_utilize mean_mev_preserve SQ3 SQ4 SQ5 SQ6

iebaltab $index_stu if round == 0, grpvar(treat) control(0) grplabels(0 AF @ 1 NAF) save(student_pre_supplB1.xlsx) replace

iebaltab $index_stu if round == 1, grpvar(treat) control(0) grplabels(0 AF @ 1 NAF) save(student_post_supplB2.xlsx) replace


*=========================================================================
* Descriptive Statistics and Pairwise t-test: Parent 
*   Supplementary Table B.3. The difference in means in outcomes from parents' baseline survey. 
*   Supplementary Table B.4. The difference in means in outcomes from parents' endline survey. 
*=========================================================================

**************************************************************************
* b-1. Descriptive Statistics: Parent
**************************************************************************

use Parent.dta,clear

*treat: 0 = Anthropocentric Framing, 1 = Non-anthropocentric Framing
*round: 0 = baseline survey, 1 = endline survey
*af_post: Anthropocentric Framing * endline survey
*naf_post: Non-anthropocentric Framing * endline survey

gen af_post = 1 if treat == 0 & round == 1
replace af_post = 0 if treat ~= 0 | round ~= 1
gen naf_post = 1 if treat == 1 & round == 1
replace naf_post = 0 if treat ~= 1 | round ~= 1

order PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j

*Anthropocentric Framing & baseline survey
outreg2 using desc_parents_af_pre_supplB3.xls if treat == 0 & round == 0, replace sum(log) keep(PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j)

*Non-Anthropocentric Framing & baseline survey
outreg2 using desc_parents_naf_pre_supplB4.xls if treat == 1 & round == 0, replace sum(log) keep(PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j)

*Anthropocentric Framing & endline survey
outreg2 using desc_parents_af_post_supplB3.xls if treat == 0 & round == 1, replace sum(log) keep(PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j)

*Non-Anthropocentric Framing & endline survey
outreg2 using desc_parents_naf_post_supplB4.xls if treat == 1 & round == 1, replace sum(log) keep(PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j)

**************************************************************************
* b-2. Pairwise t-test:Parent
**************************************************************************
*Difference

global index_par PQ1 PQ2 PQ51 PQ3a PQ3b PQ4a PQ4b PQ52 PQ53a PQ53b PQ53c PQ53d PQ53e PQ53f PQ53g PQ53h PQ53i PQ53j

iebaltab $index_par if round == 0, grpvar(treat) control(0) grplabels(0 AF @ 1 NAF) save(parent_pre_supplB3.xlsx) replace

iebaltab $index_par if round == 1, grpvar(treat) control(0) grplabels(0 AF @ 1 NAF) save(parent_post_supplB4.xlsx) replace