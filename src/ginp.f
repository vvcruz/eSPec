      IMPLICIT REAL*8(A-H,O-Z)
c
      READ(1,*)N, DT
      TSTEP = -5.0D-5
      TF = (N - 1)*DT + TSTEP
c
      WRITE(*,'(A)')'*** eSPec input file ***       '       
      WRITE(*,'(A)')'========================       '
      WRITE(*,'(A)')'**MAIN'
      WRITE(*,'(A)')'*TITLE'
      WRITE(*,'(A)')'Xray transition assisted by lazer pulses'
      WRITE(*,'(A)')'*DIMENSION'
      WRITE(*,'(A)')'.1D'
      WRITE(*,'(A)')'256/'
      WRITE(*,'(A)')'*POTENTIAL'
      WRITE(*,'(A)')'.FILE'
      WRITE(*,'(A)')'data.inp'
      WRITE(*,'(A)')'*MASS'
      WRITE(*,'(A)')'7.49D0/'
      WRITE(*,'(A)')'*TPCALC'
      WRITE(*,'(A)')'.PROPAGATION'
      WRITE(*,'(A)')'*INIEIGVC'
      WRITE(*,'(A)')'.GETC'
      WRITE(*,'(A)')'*CHANGE'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTCRL'
      WRITE(*,'(A)')'.LASTWP'
      WRITE(*,'(A)')'*PRTPOT'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTEIGVC'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTVEFF'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTEIGVC2'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTPULSE'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')'*PRTDIPOLE'
      WRITE(*,'(A)')'.NO'
      WRITE(*,'(A)')''
      WRITE(*,'(A)')'**TD'
      WRITE(*,'(A)')'*PROPAG'
      WRITE(*,'(A)')'.PPSOD'
      WRITE(*,*)0.0D0, TF, TSTEP
      WRITE(*,'(A)')'*TPTRANS'
      WRITE(*,'(A)')'.ONE'
      WRITE(*,'(A)')'*PRPTOL'
      WRITE(*,'(A)')'3D0/'
      WRITE(*,'(A)')'*NSHOT'
      WRITE(*,'(A)')'2'
      WRITE(*,'(A)')'*ABSORBING'
      WRITE(*,'(A)')'.SMOOTHW'
      WRITE(*,'(A)')'0.0008/'
      WRITE(*,'(A)')'0.4 2.6/'
      WRITE(*,'(A)')''
      WRITE(*,'(A)')'**END '
      WRITE(*,'(A)')''
c
      END
