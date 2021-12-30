
clear
input lonc latc str30 city lont temp days str20 date lonp latp army str1 direction division citypos
. .        ""                    . . .                ""   37.7  56.5  100000  "R"  1 .
. .        ""                    37.6    0    6  ""   37.6  55.5   97000  "R"  1 .
. .        ""                    36.0    0    6  "0{&degree} 24 Oct"   37.3  55.4   96000  "R"  1 .
. .        ""                    . . .                ""   35.7  55.55  87000  "R"  1 .
. .        ""                    . . .                ""   34.3  55.2   55000  "R"  1 .
. .        ""                    33.3   -9   16  "-9{&degree} 9 Nov"   33.3  54.8   37000  "R"  1 .
. .        ""                    32.0  -21    5  "-21{&degree} 14 Nov"   32.0  54.6   24000  "R"  1 .
. .        ""                    . . .                ""   30.6  54.52  20000  "R"  1 .
. .        ""                    29.2  -11   10  "-11{&degree} 24 Nov"   29.2  54.3   20000  "R"  1 .
. .        ""                    . . .                ""   28.5  54.2   20000  "R"  1 .
. .        ""                    28.3  -20    4  "-20{&degree} 28 Nov"   28.3  54.22   20000  "R"  1 .
. .        ""                    27.5  -24    3  "-24{&degree} 1 Dec"   27.5  54.5   20000  "R"  1 .
. .        ""                    27.0  -30    5  "-30{&degree} 6 Dec"   27.0  54.3   12000  "R"  1 .
. .        ""                    . . .                ""   26.5  54.4   14000  "R"  1 .
. .        ""                    25.1  -26    1  "-26{&degree} 7 Dec"   25.1  54.45    8000  "R"  1 .
. .        ""                    . . .                ""   24.65  54.44    4000  "R"  1 .
. .        ""                    . . .                ""   24.5  54.43    4000  "R"  1 .
. .        ""                    . . .                ""   24.2  54.42   10000  "R"  1 .
. .        ""                    . . .                ""   23.8  54.41   10000  "R"  1 .
. .        ""                    . . .                ""   28.7  55.5   30000  "R"  2 .
. .        ""                    . . .                ""   29.2  54.27   30000  "R"  2 .
. .        ""                    . . .                ""   28.5  54.16   30000  "R"  2 .
. .        ""                    . . .                ""   28.32  54.18   28000  "R"  2 .
. .        ""                    . . .                ""   24.5  55.81   6000  "R"  3 .
. .        ""                    . . .                ""   24.2  54.4    6000  "R"  3 .
24.0 54.92 "{it:Kowno}"          . . .                ""   24.0  54.75  340000  "A"  1 0
25.5 54.80 "{it:Wilna}"          . . .                ""   24.5  54.88 340000  "A"  1 0
26.7 54.48 "{it:Smorgoni}"       . . .                ""   25.5  54.76  340000  "A"  1 0
27.1 54.25 "{it:Molodexno}"      . . .                ""   26.0  54.8  320000  "A"  1 0
27.7 55.40 "{it:Gloubokoe}"      . . .                ""   27.0  54.9  300000  "A"  1 0
27.6 53.90 "{it:Minsk}"          . . .                ""   28.0  55.04  280000  "A"  1 0
28.3 54.11 "{it:Studienska}"     . . .                ""   28.5  55.1  240000  "A"  1 0
28.7 55.54 "{it:Polotzk}"        . . .                ""   29.0  55.2  210000  "A"  1 12
29.15 54.26 "{it:Bobr}"          . . .                ""   30.0  55.3  180000  "A"  1 3
30.2 55.36 "{it:Witebsk}"        . . .                ""   30.3  55.3  175000  "A"  1 0
30.4 54.55 "{it:Orscha}"         . . .                ""   32.0  54.8  145000  "A"  1 2
30.4 53.95 "{it:Mohilow}"        . . .                ""   33.2  55.0  140000  "A"  1 0
32.0 54.78 "{it:Smolensk}"       . . .                ""   34.4  55.9  127100  "A"  1 0
32.7 55.11 "{it:Dorogobouge}"    . . .                ""   35.5  55.8  100000  "A"  1 5
34.1 55.06 "{it:Wixma}"          . . .                ""   36.0  55.75  100000  "A"  1 3
34.4 55.90 "{it:Chjat}"          . . .                ""   37.7  56.5  100000  "A"  1 0
37.7 56.54 "{bf:MOSCOU}"         . . .                ""   24.0  55.0   60000  "A"  2 12
37.7 55.83 "{it:Tarantino}"      . . .                ""   24.5  55.2   60000  "A"  2 3
37.5 55.45 "{it:Malo-jarosewli}" . . .                ""   25.35  55.1   60000  "A"  2 5
36.1 55.77 "{it:Mojaisk}"        . . .                ""   26.6  55.7   40000  "A"  2 5
. .        ""                    . . .                ""   27.4  55.6   33000  "A"  2 .
. .        ""                    . . .                ""   28.7  55.5   30000  "A"  2 .
. .        ""                    . . .                ""   23.7  54.95  22000  "A"  3 .
. .        ""                    . . .                ""   24.5  55.27  22000  "A"  3 .
. .        ""                    . . .                ""   24.6  55.8   22000  "A"  3 .
end


generate index = _n 

qui sum army
generate s_p = army/r(max)

local slist ""
foreach j in R A {
  forvalues i = 1/3 {
    preserve
     keep if direction == "`j'" & division == `i'
     forvalues n = 1/`=_N-1' {
		if direction == "A" local optl lc("207 70 71")
		if direction == "R" local optl lc("34 40 49")
		if direction == "A" local optm mcolor("207 70 71")
		if direction == "R" local optm mcolor("34 40 49")
		
		local coo `=latp[`n']' `=lonp[`n']' `=latp[`n'+1]' `=lonp[`n'+1]'
		
		local slist "`slist' (pci `coo' in `n'/`=`n'+1', `optl' lw(`=s_p[`n']*12')) (scatteri `coo' in `n'/`=`n'+1', `optm' msize(`=s_p[`n']*10.6'))"
     }
    restore
  }
}


// recast temperature relative to latitude
capture replace temp = temp/50

qui sum latp
scalar latmin = r(min)

capture generate templat = latmin -.8 + temp // temp is <=0 


local siopt ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-1)
local tiopt ms(i) mlabpos(0) mlabc(gs4) mlabsize(*1.4)

twoway (pcspike latp lonp templat lont if lont!=36.0, lc(gs4) lw(*.35)) ///
       (scatteri `=latmin-.8' 37.6 `=latmin-.8-30/50' 37.6, recast(line) lc(gs4) lw(*.35)) ///
	   (scatteri `=latmin-.8' 37.6 `=latmin-.8' 25.1, recast(line) lc(gs4) lw(*.15)) ///
	   (scatteri `=latmin-.8-10/50' 37.6 `=latmin-.8-10/50' 25.1, recast(line) lc(gs4) lw(*.15)) ///
       (scatteri `=latmin-.8-20/50' 37.6 `=latmin-.8-20/50' 25.1, recast(line) lc(gs4) lw(*.15)) ///
	   (scatteri `=latmin-.8-30/50' 37.6 `=latmin-.8-30/50' 25.1, recast(line) lc(gs4) lw(*.15)) ///
	   (scatteri `=latmin-.8' 37.6 "Zero, 18 Oct", `siopt' mlabsize(*.6) mlabgap(.5)) ///
	   (scatteri `=latmin-.8-10/50' 37.6 "-10", `siopt' mlabsize(*.6) mlabgap(0)) ///
	   (scatteri `=latmin-.8-20/50' 37.6 "-20", `siopt' mlabsize(*.6) mlabgap(0)) ///
	   (scatteri `=latmin-.8-30/50' 37.6 "-30 degrees", `siopt' mlabsize(*.6) mlabgap(0)) ///
	   `slist' ///
       (scatter latc lonc, ms(i) mlab(city) mlabc(gs2) mlabsize(*.6) mlabvpos(citypos)) ///
	   (scatteri 55.70 24.12 "6,000", 	ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-1) mlabangle(-4)) ///
	   (scatteri 55.70 24.53 "22,000", 	ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(-4)) ///
	   (scatteri 55.30 23.74 "422,000", `siopt' mlabangle(120)) ///
	   (scatteri 55.24 24.70 "400,000", `siopt' mlabangle(78)) ///
	   (scatteri 55.41 26.05 "60,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(-50)) ///
	   (scatteri 55.71 26.82 "34,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(0.5) mlabangle(78)) ///
	   (scatteri 55.60 27.82 "32,000",  `siopt' mlabangle(80)) ///
	   (scatteri 55.72 29.38 "210,000", ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(2) mlabangle(100)) ///
	   (scatteri 55.40 30.48 "175,000", ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(59)) ///
	   (scatteri 55.26 32.42 "145,000", ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-2) mlabangle(105)) ///
	   (scatteri 55.62 33.24 "140,000", `siopt' mlabangle(138)) ///
	   (scatteri 55.99 34.74 "127,100", `siopt' mlabangle(78)) ///
	   (scatteri 55.87 35.70 "100,000", `siopt' mlabangle(78)) ///
	   (scatteri 56.51 36.81 "100,000", `siopt' mlabangle(125)) ///
	   (scatteri 56.40 37.74 "100,000", ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(-3)) ///
	   (scatteri 55.12 36.85 "96,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-1) mlabangle(80)) ///
	   (scatteri 55.30 35.00 "87,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(115)) ///
	   (scatteri 54.90 33.65 "55,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(1) mlabangle(120)) ///
	   (scatteri 54.66 32.65 "37,000",  `siopt' mlabangle(110)) ///
	   (scatteri 54.51 31.15 "24,000",  `siopt' mlabangle(95)) ///
	   (scatteri 54.38 29.85 "20,000",  `siopt' mlabangle(103)) ///
	   (scatteri 54.15 28.87 "30,000",  `siopt' mlabangle(110)) ///
	   (scatteri 54.15 23.80 "10,000",  `siopt' mlabangle(90)) ///
	   (scatteri 54.38 24.20 "4,000",   `siopt' mlabangle(91)) ///
	   (scatteri 54.40 24.65 "8,000",   `siopt' mlabangle(91)) ///
	   (scatteri 54.20 25.42 "14,000",  `siopt' mlabangle(80)) ///
	   (scatteri 54.15 26.43 "12,000",  `siopt' mlabangle(62)) ///
	   (scatteri 54.20 27.62 "18,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-1.5) mlabangle(55)) ///
	   (scatteri 54.62 28.60 "30,000",  ms(i) mlabpos(3) mlabc(gs0) mlabsize(*.5) mlabgap(-0.5) mlabangle(9)) ///
	   (line    templat lont, lc(gs4) lw(*1.75)) ///
	   (scatter templat lont, ms(i) mlab(date) mlabpos(6) mlabgap(.5) mlabc(gs4) mlabsize(*.6)) ///
	   ///
	   (scatteri 57.20 29.60 "{stSerif: {bf:FIGURATIVE MAP} of the successive losses in men of the French Army in the {bf:RUSSIAN CAMPAIGN of 1812 - 1813.}}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(*1)) ///
	   (scatteri 57.08 29.80 "{stSerif: Drawn by Dr. Minard, Inspector General of Bridges and Roads in Retirement.}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(*0.9)) ///
	   (scatteri 57.01 29.80 "{dup 25:`=char(95)'}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(*0.9)) ///
	   (scatteri 56.98 33.78 "{stSerif: Paris, 20 November 1869.}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(*0.9)) ///
	   ///
	   (scatteri 56.68 29.70 "{stSerif:Number of men present are reported by the widths of the colored zones in a rate of one millimeter for ten thousand men; these are also written besides}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(2.1)) ///
	   (scatteri 56.56 29.60 "{stSerif:the zones. Red designates the men moving into Russia, the black for those who retreat. The information that was used to draw up the map was taken from}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(2.1)) ///
	   (scatteri 56.44 29.25 "{stSerif:the works of {bf:M. M. Chiers, of Ségur, of Fezensac, of Chambray} and the unpublished diary of Jacob, pharmacist of the army since October 28.}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(2.1)) ///
	   (scatteri 56.32 29.50 "{stSerif:To make it easier to see the decrease in the army, I assumed that the troops under Prince Jérôme and Marshal Davousi who had been sent to the Minsk}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(2.1)) ///
	   (scatteri 56.20 29.50 "{stSerif:and Mohilow and who rejoined near Orscha and Witebsk, had always marched with the army.}", ms(i) mlabpos(0) mlabc(gs4) mlabsize(2.1)) ///
	   ///
	   (scatteri `=latmin-0.6' 29.80 "{stSans:{it:GRAPHIC TABLE of the temperature in degrees of the Réaumur thermometer below zero.}}", `tiopt' mlabsize(*.8)) ///
       , legend(off) scheme(s1color) ///
       ysize(1) xsize(2.15) yscale(off) xscale(off) ///
	   yline(`=latmin-0.45' `=latmin-0.47', lc(gs12) lw(*.75))  ///
	   note("{stSans:{it:Autog. par Regnier, 8. Pas. S{sup:te}. Marie S{sup:t}. G{sup:aln}. à Paris}}", size(1.5) c(gs4) ring(1) margin(b=0) pos(7)) ///
	   caption("{stSans:{it:Imp. Lith. Regnier et Dourdet.}}", size(1.5) c(gs4) ring(1) margin(b=0) pos(5)) ///
	   plotregion(lc(gs12) lw(*.75) margin(b=5 l+5 r-20 t=2)) ///
	   graphregion(lc(none) margin(b=0 l=0 r=0 t=0)) 

	   
	   graph export minard.png, replace as(png) width(3840)
	   
	   
		*graph set window fontface "Palatino"
		*graph set window fontfaceserif "Merveille" 
		*graph set window fontfacesans  "Lucida Calligraphy"




* Data source: https://www.cs.uic.edu/~wilkinson/TheGrammarOfGraphics/minard.txt
