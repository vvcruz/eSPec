*** eSPec input file ***
========================
**MAIN
*TITLE
 +++++ COUPLE3 test +++++    
*DIMENSION
.1D
 512/
*POTENTIAL
.FILE
water_2b2_Qs.dat
*MASS
1.04445D+0/
*TPCALC
.PROPAGATION
*INIEIGVC
.CALC
*CHANGE
.YES
*PRTCRL
.PARTIAL
*PRTPOT
.NO
*PRTEIGVC
.YES
*PRTVEFF
.NO
*PRTEIGVC2
.NO ! .YES for movie.gplt
*PRTPULSE
.YES
*PRTDIPOLE
.NO
*CHANGE
.NO

**TI
*TPDIAG
.MTRXDIAG  !.LANCZS; MTRXDIAG 
*NIST
 7  0/
*ABSTOL
 1D-6/

**TD
*PROPAG
.COUPLE3
 0.0  300.0 0.1d0/
.PULSES
1.0D+17 5.0 536.283 150D+0   0   1.0/
0.0D+00  10 400 150D+0  0   1.0/
.DECAYS
0.0 0.08 0.0/
.TDIPOL
0.0243 0.0d+0/
*PRPGSTATE
 0/
*TPTRANS
.ONE
*PRPTOL
 3D0/
*NPROJECTIONS
 6  1
*FOURIER
10/

**END

