/////Date exploratory on collapsed set 
sum zip_code_crime populationbelowpovertylevel medianhouseholdincome nonwhitenonhispanicorlatino hispanicorlatinoofanyrace populationwithdisability unemployment largehouseholds5members homesaffordabletopeopleearningle rentalsaffordabletopeopleearning rentrestrictedunits housingchoicevoucherholders medianrent medianhomevalue percentageofrentalunitsinpoorcon percentchangeinnumberofhousingun ownerunitsaffordabletoaverageret rentalunitsaffordabletoaveragere rentalunitsaffordabletoaveragear ownerunitsaffordabletoaverageart rentalunitsaffordabletoaveragete ownerunitsaffordabletoaveragetea v36 ownerunitsaffordabletoaveragetec changeinpercentageofpopulationbe changeinmedianrent20002012 changeinmedianhomevalue20002012 percentageofhomeswithin14mioftra averagemonthlytransportationcost percentageofhousingandtransporta


///Already in data set, do not need to run

gen zip_pop = 17919 if zip_code_crime == "78735"
replace zip_pop = 14949 if zip_code_crime == "78751"
replace zip_pop = 48432 if zip_code_crime == "78744"
replace zip_pop = 7875 if zip_code_crime == "78701"
replace zip_pop = 22876 if zip_code_crime == "78702"
replace zip_pop = 20788 if zip_code_crime == "78703"
replace zip_pop = 47158 if zip_code_crime == "78704"
replace zip_pop = 33075 if zip_code_crime == "78705"
replace zip_pop = 12447 if zip_code_crime == "78721"
replace zip_pop = 7254 if zip_code_crime == "78722"
replace zip_pop = 33170 if zip_code_crime == "78723"
replace zip_pop = 24833 if zip_code_crime == "78724"
replace zip_pop = 7517 if zip_code_crime == "78725"
replace zip_pop = 14610 if zip_code_crime == "78726"
replace zip_pop = 28999 if zip_code_crime == "78727"
replace zip_pop = 21245 if zip_code_crime == "78728"
replace zip_pop = 29434 if zip_code_crime == "78729"
replace zip_pop = 8933 if zip_code_crime == "78730"
replace zip_pop = 27447 if zip_code_crime == "78731"
replace zip_pop = 17762 if zip_code_crime == "78732"
replace zip_pop = 8754 if zip_code_crime == "78733"
replace zip_pop = 18722 if zip_code_crime == "78734"
replace zip_pop = 17919 if zip_code_crime == "78735"
replace zip_pop = 8199 if zip_code_crime == "78736"
replace zip_pop = 15879 if zip_code_crime == "78737"
replace zip_pop = 15746 if zip_code_crime == "78738"
replace zip_pop = 20191 if zip_code_crime == "78739"
replace zip_pop = 52307 if zip_code_crime == "78741"
replace zip_pop = 517 if zip_code_crime == "78742"
replace zip_pop = 48432 if zip_code_crime == "78744"
replace zip_pop = 62220 if zip_code_crime == "78745"
replace zip_pop = 28268 if zip_code_crime == "78746"
replace zip_pop = 20954 if zip_code_crime == "78747"
replace zip_pop = 49142 if zip_code_crime == "78748"
replace zip_pop = 37453 if zip_code_crime == "78749"
replace zip_pop = 30758 if zip_code_crime == "78750"
replace zip_pop = 14949 if zip_code_crime == "78751"
replace zip_pop = 20302 if zip_code_crime == "78752"
replace zip_pop = 58693 if zip_code_crime == "78753"
replace zip_pop = 23858 if zip_code_crime == "78754"
replace zip_pop = 8377 if zip_code_crime == "78756"
replace zip_pop = 24059 if zip_code_crime == "78757"
replace zip_pop = 46618 if zip_code_crime == "78758"
replace zip_pop = 41847 if zip_code_crime == "78759"
replace zip_pop = 32692 if zip_code_crime == "78610"
replace zip_pop = 27900 if zip_code_crime == "78617"
replace zip_pop = 20822 if zip_code_crime == "78653"
replace zip_pop = 85450 if zip_code_crime == "78660"
replace zip_pop = 85450 if zip_code_crime == "78660"
replace zip_pop = 85450 if zip_code_crime == "78660"
replace zip_pop = 85450 if zip_code_crime == "78660"
replace zip_pop = 85450 if zip_code_crime == "78660"
replace zip_pop = . if zip_code_crime == "."

/////////Already in data set, do not need to run
//Creating new crime rate variables

gen violent_per_capita = ((num_agg_assaults + num_murders + num_rape + num_robbery) / zip_pop)*10000
replace violent_per_capita = 0.1 if (((num_agg_assaults + num_murders + num_rape + num_robbery) / zip_pop)*10000) == 0
gen non_violent_pc = ((num_burglarys + num_thefts + num_auto_thefts) / zip_pop)*10000

///SUMMARY OF ALL VARIABLES

sum

////RESPONSE SUMMARY

sum non_violent_pc violent_per_capita
graph box crime_per_capita, mark(1,mlabel(zip_code_crime))
graph box violent_per_capita, mark(1,mlabel(zip_code_crime))
kdensity crime_per_capita, bwidth(3)
kdensity violent_per_capita, bwidth(3)
twoway scatter violent_per_capita crime_per_capita, jitter(7)
twoway lfitci violent_per_capita crime_per_capita || scatter violent_per_capita crime_per_capita


///TOTAL VIOLENT CRIME/CAPITA SCATTER 
///Scored variables 1-5 values that seemed correlated, 5 being most correlated
scatter violent_per_capita medianhouseholdincome, mlabel(zip_code_crime) //5
scatter violent_per_capita populationbelowpovertylevel, mlabel(zip_code_crime) //5
scatter violent_per_capita nonwhitenonhispanicorlatino, mlabel(zip_code_crime) //2
scatter violent_per_capita hispanicorlatinoofanyrace, mlabel(zip_code_crime) //4
scatter violent_per_capita populationwithdisability, mlabel(zip_code_crime) //3
scatter violent_per_capita unemployment, mlabel(zip_code_crime) //4
scatter violent_per_capita largehouseholds5members, mlabel(zip_code_crime) //3
scatter violent_per_capita homesaffordabletopeopleearningle, mlabel(zip_code_crime) //3
scatter violent_per_capita rentalsaffordabletopeopleearning, mlabel(zip_code_crime) //4
scatter violent_per_capita rentrestrictedunits, mlabel(zip_code_crime) //4
scatter violent_per_capita housingchoicevoucherholders, mlabel(zip_code_crime) //3
scatter violent_per_capita medianrent, mlabel(zip_code_crime) //5
scatter violent_per_capita medianhomevalue, mlabel(zip_code_crime) //5
scatter violent_per_capita percentageofrentalunitsinpoorcon, mlabel(zip_code_crime) //4
scatter violent_per_capita percentchangeinnumberofhousingun, mlabel(zip_code_crime) //2
scatter violent_per_capita ownerunitsaffordabletoaverageret, mlabel(zip_code_crime) //2
scatter violent_per_capita rentalunitsaffordabletoaveragere, mlabel(zip_code_crime) //5
scatter violent_per_capita rentalunitsaffordabletoaveragear, mlabel(zip_code_crime) //5
scatter violent_per_capita ownerunitsaffordabletoaverageart, mlabel(zip_code_crime) //3
scatter violent_per_capita rentalunitsaffordabletoaveragete, mlabel(zip_code_crime) //5
scatter violent_per_capita ownerunitsaffordabletoaveragetea, mlabel(zip_code_crime) //3
scatter violent_per_capita v36, mlabel(zip_code_crime) //1
scatter violent_per_capita ownerunitsaffordabletoaveragetec, mlabel(zip_code_crime) //5
scatter violent_per_capita changeinpercentageofpopulationbe, mlabel(zip_code_crime) //3
scatter violent_per_capita changeinmedianrent20002012, mlabel(zip_code_crime) //3
scatter violent_per_capita changeinmedianhomevalue20002012, mlabel(zip_code_crime) //1
scatter violent_per_capita percentageofhomeswithin14mioftra, mlabel(zip_code_crime) //
scatter violent_per_capita averagemonthlytransportationcost, mlabel(zip_code_crime) //4
scatter violent_per_capita percentageofhousingandtransporta, mlabel(zip_code_crime) //4


///TOTAL VIOLENT CRIME/CAPITA SCATTER 
///Scored variables 1-5 values that seemed correlated, 5 being most correlated
scatter non_violent_pc medianhouseholdincome, mlabel(zip_code_crime) //5
scatter non_violent_pc populationbelowpovertylevel, mlabel(zip_code_crime) //5
scatter non_violent_pc nonwhitenonhispanicorlatino, mlabel(zip_code_crime) //2
scatter non_violent_pc hispanicorlatinoofanyrace, mlabel(zip_code_crime) //4
scatter non_violent_pc populationwithdisability, mlabel(zip_code_crime) //3
scatter non_violent_pc unemployment, mlabel(zip_code_crime) //4
scatter non_violent_pc largehouseholds5members, mlabel(zip_code_crime) //3
scatter non_violent_pc homesaffordabletopeopleearningle, mlabel(zip_code_crime) //3
scatter non_violent_pc rentalsaffordabletopeopleearning, mlabel(zip_code_crime) //4
scatter non_violent_pc rentrestrictedunits, mlabel(zip_code_crime) //4
scatter non_violent_pc housingchoicevoucherholders, mlabel(zip_code_crime) //3
scatter non_violent_pc medianrent, mlabel(zip_code_crime) //5
scatter non_violent_pc medianhomevalue, mlabel(zip_code_crime) //5
scatter non_violent_pc percentageofrentalunitsinpoorcon, mlabel(zip_code_crime) //4
scatter non_violent_pc percentchangeinnumberofhousingun, mlabel(zip_code_crime) //2
scatter non_violent_pc ownerunitsaffordabletoaverageret, mlabel(zip_code_crime) //2
scatter non_violent_pc rentalunitsaffordabletoaveragere, mlabel(zip_code_crime) //5
scatter non_violent_pc rentalunitsaffordabletoaveragear, mlabel(zip_code_crime) //5
scatter non_violent_pc ownerunitsaffordabletoaverageart, mlabel(zip_code_crime) //3
scatter non_violent_pc rentalunitsaffordabletoaveragete, mlabel(zip_code_crime) //5
scatter non_violent_pc ownerunitsaffordabletoaveragetea, mlabel(zip_code_crime) //3
scatter non_violent_pc v36, mlabel(zip_code_crime) //1
scatter non_violent_pc ownerunitsaffordabletoaveragetec, mlabel(zip_code_crime) //5
scatter non_violent_pc changeinpercentageofpopulationbe, mlabel(zip_code_crime) //3
scatter non_violent_pc changeinmedianrent20002012, mlabel(zip_code_crime) //3
scatter non_violent_pc changeinmedianhomevalue20002012, mlabel(zip_code_crime) //1
scatter non_violent_pc percentageofhomeswithin14mioftra, mlabel(zip_code_crime) //
scatter non_violent_pc averagemonthlytransportationcost, mlabel(zip_code_crime) //4
scatter non_violent_pc percentageofhousingandtransporta, mlabel(zip_code_crime) //4


///SCATTER OF PREDICTOR AND PREDICTOR

scatter populationbelowpovertylevel medianhouseholdincome, mlabel(zip_code_crime)
scatter unemployment populationbelowpovertylevel, mlabel(zip_code_crime)
scatter medianhouseholdincome unemployment, mlabel(zip_code_crime)
scatter medianhouseholdincome medianrent, mlabel(zip_code_crime)
scatter medianhomevalue medianhouseholdincome, mlabel(zip_code_crime)
scatter homesaffordabletopeopleearningle hispanicorlatinoofanyrace, mlabel(zip_code_crime)


//VARIABLES KEPT BASED UPON DV non_violent_pc and violent_per_capita AND IV SCATTER
changeinpercentageofpopulationbe
changeinmedianrent20002012
changeinmedianhomevalue20002012
percentageofhomeswithin14mioftra
averagemonthlytransportationcost
rentalunitsaffordabletoaveragete
rentalunitsaffordabletoaveragere
rentalunitsaffordabletoaveragear
medianrent
percentageofrentalunitsinpoorcon
rentalsaffordabletopeopleearning
unemployment
medianhouseholdincome
populationbelowpovertylevel



//RENAME VARIABLES TO MAKE SIMPLER/ do not have to run

rename populationbelowpovertylevel pop_pov
rename medianhouseholdincome med_hs_inc
rename rentalsaffordabletopeopleearning rent_aff_earn
rename percentageofrentalunitsinpoorcon rent_poor_cond
rename rentalunitsaffordabletoaveragere rent_aff_serv
rename averagemonthlytransportationcost trans_cost
rename percentageofhomeswithin14mioftra homes_transStop
rename changeinmedianrent20002012 med_rent_change
rename changeinpercentageofpopulationbe pop_pov_change

//Creating Pop_dens variable/ do not have to run
gen pop_dense = 7875/1.63 if zip_code_crime == 78701
replace pop_dense = 58693/10.97 if zip_code_crime == 78753
replace pop_dense = 14949/2.4 if zip_code_crime == 78751
replace pop_dense = 48432/21.4 if zip_code_crime == 78744
replace pop_dense = 52307/7.6 if zip_code_crime == 78741
replace pop_dense = 28999/8.58 if zip_code_crime == 78727
replace pop_dense = 12447/3.71 if zip_code_crime == 78721
replace pop_dense = 41847/13.92 if zip_code_crime == 78759
replace pop_dense = 24059/4.92 if zip_code_crime == 78757
replace pop_dense = 20302/3.34 if zip_code_crime == 78752
replace pop_dense = 46618/9.28 if zip_code_crime == 78758
replace pop_dense = 22876/5 if zip_code_crime == 78702
replace pop_dense = 47158/8.70 if zip_code_crime == 78704
//gen pop_dense = 7875/1.63 if zip_code_crime == "78719"
replace pop_dense = 33170/6.94 if zip_code_crime == 78723
replace pop_dense = 62220/13.35 if zip_code_crime == 78745
replace pop_dense = 49142/12.67 if zip_code_crime == 78748
replace pop_dense = 27900/12.87 if zip_code_crime == 78717
replace pop_dense = 29434/9.23 if zip_code_crime == 78729
replace pop_dense = 8377/1.67 if zip_code_crime == 78756
replace pop_dense = 28268/22.49 if zip_code_crime == 78746
replace pop_dense = 7254/1.51 if zip_code_crime == 78722
replace pop_dense = 27447/8.59 if zip_code_crime == 78731
replace pop_dense = 20788/5.58 if zip_code_crime == 78703
replace pop_dense = 24833/24.4 if zip_code_crime == 78724
replace pop_dense = 37453/10.07 if zip_code_crime == 78749
replace pop_dense = 14610/10.87 if zip_code_crime == 78726
replace pop_dense = 33075/2.20 if zip_code_crime == 78705
//replace pop_dense = 14610/12.87 if zip_code_crime == "78717"
replace pop_dense = 30758/13.4 if zip_code_crime == 78750
replace pop_dense = 23858/13.25 if zip_code_crime == 78754
//replace pop_dense = 23858/45.3 if zip_code_crime == "78660"
replace pop_dense = 17919/20.55 if zip_code_crime == 78735
replace pop_dense = 517/5.74 if zip_code_crime == 78742
replace pop_dense = 20191/12.43 if zip_code_crime == 78739
replace pop_dense = 17762/13.25 if zip_code_crime == 78732
replace pop_dense = 21245/8.11 if zip_code_crime == 78728




	
//IS THERE NORMAL DISTROBUTION AMONG VARS?
ssc describe eqprhistogram
ssc install eqprhistogram
kdensity pop_pov, bwidth(10) //skewed right
kdensity homes_transStop, bwidth(10) //cube B1+2B2X +3B3X^2
kdensity med_rent_change, bwidth(10) //right-skewed
kdensity rent_poor_cond, bwidth(10) //normally distributed
kdensity pop_pov_change, bwidth(10) //seems right skewed due to outlier
kdensity rent_aff_serv, bwidth(10) // normally distributed - how can this have negative values

predict R,resid
kdensity R, normal bwidth(.3)
pnorm R ///Weirs result
qnorm R
swilk R

//LIN-LOG MODEL var car creation

gen ln_trans_cost = ln(trans_cost)
replace ln_trans_cost = 0 if trans_cost == 0
gen ln_homes_transStop = ln(homes_transStop)
replace ln_homes_transStop = 0 if homes_transStop == 0
gen ln_med_rent_change = ln(med_rent_change)
replace ln_med_rent_change = 0 if med_rent_change == 0
gen ln_rent_poor_cond = ln(rent_poor_cond)
replace ln_rent_poor_cond = 0 if rent_poor_cond == 0
gen ln_pop_pov_change = ln(pop_pov_change)
replace ln_pop_pov_change = 0 if pop_pov_change == 0
gen ln_rent_aff_serv = ln(rent_aff_serv)
replace ln_rent_aff_serv = 0 if rent_aff_serv == 0
gen ln_pop_pov = ln(pop_pov)
replace ln_pop_pov = 0 if pop_pov == 0
gen cubed_homes_trans = homes_transStop*homes_transStop*homes_transStop
gen sq_homes_trans= homes_transStop*homes_transStop

//////////Exploratory Analysis

histogram pop_pov

gen new_pov = 1
replace new_pov= 2 if pop_pov >= 15 & pop_pov < 30
replace new_pov= 3 if pop_pov >= 30 
replace new_pov= . if pop_pov == . | zip_code_crime == 78701

graph bar non_violent_pc, over(new_pov) 
blabel(mean)

graph bar violent_per_capita, over(new_pov) 
blabel(mean)

graph bar violent_per_capita non_violent_pc, over(new_pov)
blabel(mean)

scatter violent_per_capita pop_pov

//Logged Vars // do not have to run
gen ln_non_violent_pc = ln(non_violent_pc)
replace ln_non_violent_pc = 0.1 if non_violent_pc == 0
gen ln_violent_per_capita = ln(violent_per_capita)
replace ln_violent_per_capita = 0.1 if violent_per_capita == 0
gen ln_trans_cost = ln(trans_cost)
replace ln_trans_cost = 0 if trans_cost == 0
gen ln_homes_transStop = ln(homes_transStop)
replace ln_homes_transStop = 0 if homes_transStop == 0
gen ln_med_rent_change = ln(med_rent_change)
replace ln_med_rent_change = 0 if med_rent_change == 0
gen ln_rent_poor_cond = ln(rent_poor_cond)
replace ln_rent_poor_cond = 0 if rent_poor_cond == 0
gen ln_pop_pov_change = ln(pop_pov_change)
replace ln_pop_pov_change = 0 if pop_pov_change == 0
gen ln_rent_aff_serv = ln(rent_aff_serv)
replace ln_rent_aff_serv = 0 if rent_aff_serv == 0
gen ln_pop_pov = ln(pop_pov)
replace ln_pop_pov = 0 if pop_pov == 0
gen cubed_homes_trans = ln_homes_transStop*ln_homes_transStop*ln_homes_transStop
replace cubed_homes_trans = 0 if ln_homes_transStop == 0
gen sq_homes_trans = ln_homes_transStop*ln_homes_transStop
replace sq_homes_trans = 0 if ln_homes_transStop == 0

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
//Violent Crime Regression

reg violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo vio_base_model

//for vio base model
vif

//BoxCox Test
boxcox violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo vio_base_model

reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo vio_logged

//LEVERAGE PLOT
lvr2plot, mlabel(zip_code_crime)
graph save Graph "LevVResSqu", replace //78732 high leverage , 78705 both , 78701 high resid Squared

// REMOVE worst infleuntial ZIP-CODE
reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78732 & zip_code_crime != 78701 & zip_code_crime != 78705
eststo base_mod_rmlvg

reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78701
eststo remove1_78701

reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78732
eststo base_mod_rmlvg4

reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78705
eststo ln_mod_rmlvg

///// best model so far
reg ln_violent_per_capita trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78705
eststo ln_mod_rmlvg


//HETEROSKEDASTIC TESTS
//Question 10
estat hettest, fstat rhs
estat imtest, white
rvfplot, yline(0)

///Logging Independent vars
reg ln_violent_per_capita ln_trans_cost ln_homes_transStop ln_med_rent_change ln_rent_poor_cond ln_pop_pov_change ln_rent_aff_serv ln_pop_pov if zip_code_crime != 78705
eststo lin_log_mod

reg ln_violent_per_capita ln_trans_cost ln_homes_transStop ln_med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78705
eststo log_log_mod_best

reg ln_violent_per_capita trans_cost homes_transStop sq_homes_trans cubed_homes_trans med_rent_change ln_rent_poor_cond ln_pop_pov_change ln_rent_aff_serv ln_pop_pov if zip_code_crime != 78705
eststo lin_log_mod3

//MODELS COMPARING
esttab vio_base_model remove_78701 lin_log_mod_best, star(* 0.1 ** .05 *** .01) staraux b(3) se(a3) o(_cons) ///
	scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") ///
	nonumber modelwidth(20) note("Source: Austin Government Website")

reg ln_violent_per_capita ln_trans_cost ln_homes_transStop ln_med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78705
eststo log_log_mod_best

/// For log_log_mod_best model
vif

///Remove Variables

reg ln_violent_per_capita ln_trans_cost ln_med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78705
eststo remove_var


//MODELS COMPARING
esttab vio_base_model vio_logged ln_mod_rmlvg log_log_mod_best remove_var, star(* 0.1 ** .05 *** .01) staraux b(3) se(a3) o(_cons) ///
	scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") ///
	nonumber modelwidth(20) note("Source: Austin Government Website")

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
//non-violent Crime Regression

reg non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo nonvio_base_model

vif
///Box-cox Test
boxcox non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo nonvio_box


//Logged After Box
reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov
eststo nonvio_logged


//LEVERAGE PLOT
lvr2plot, mlabel(zip_code_crime)
graph save Graph "LevVResSqu", replace //78732 high leverage , 78705 both , 78701 high resid Squared



// REMOVE HIGH ZIP-CODES
reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78732 & zip_code_crime != 78701 & zip_code_crime != 78705
eststo base_mod_rmlvg

reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78732 & zip_code_crime != 78701
eststo base_mod_rmlvg2

reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78701
eststo removed2_78701

reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78732
eststo base_mod_rmlvg4



///Best removal model
reg ln_non_violent_pc trans_cost homes_transStop med_rent_change rent_poor_cond pop_pov_change rent_aff_serv pop_pov if zip_code_crime != 78701
eststo removed2_78701

//HETEROSKEDASTIC TESTS

//hetero tests
estat hettest, fstat rhs
estat imtest, white
rvfplot, yline(0)

/// Tried logging variables to improve model
reg ln_non_violent_pc trans_cost homes_transStop med_rent_change ln_rent_poor_cond pop_pov_change rent_aff_serv ln_pop_pov if zip_code_crime != 78701
eststo log_log_best

reg ln_non_violent_pc trans_cost homes_transStop sq_homes_trans cubed_homes_trans med_rent_change rent_poor_cond ln_pop_pov_change ln_rent_aff_serv ln_pop_pov if zip_code_crime != 78701
eststo lin_log_mod_best2

reg ln_non_violent_pc trans_cost homes_transStop sq_homes_trans cubed_homes_trans med_rent_change ln_rent_poor_cond ln_pop_pov_change ln_rent_aff_serv ln_pop_pov if zip_code_crime != 78701
eststo lin_log_mod3


///REMOVE NON-significant variables
reg ln_non_violent_pc homes_transStop med_rent_change ln_rent_poor_cond pop_pov_change rent_aff_serv ln_pop_pov if zip_code_crime != 78701
eststo removed_vars
vif

//MODELS COMPARING RIDDED OUTLIERS
esttab nonvio_base_model nonvio_logged removed2_78701 log_log_best removed_vars, star(* 0.1 ** .05 *** .01) staraux b(3) se(a3) o(_cons) ///
	scalars( "r2_a Adj R-Squared" "rmse SEE" "F F-ratio" "rss SSR") ///
	nonumber modelwidth(20) note("Source: Austin Government Website")





