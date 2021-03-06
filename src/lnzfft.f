c subroutine lanczos com reortogonalizacao parcial em relacao 
c aos lm primeiros autovetores da tridiagonalizacao lanczos
c
      SUBROUTINE LNZFFT(CHANGE, DIM, N, M, NREORT, LMTREORT, MXDCT, NP,
     &       SHM, VPOT, V0, VI, WORK, AL, BT, LNZVC)
      IMPLICIT NONE
c     **
c     ** Scalar arguments
      LOGICAL       CHANGE
      CHARACTER*(*) DIM   
      INTEGER       N, M, NREORT, LMTREORT, MXDCT
cdel      REAL*8    
c     **
c     ** Array arguments
      INTEGER       NP(*)
      REAL*8        AL(*), BT(*), V0(*), VI(*), WORK(*), VPOT(*), SHM(*)
      REAL*8        LNZVC(MXDCT,*)
c     **
*     ..
*     Purpose
*     =======
*     M number of vectors to be generated
*     NREORT number of reortogonalizations to be perfomated
*     LMTREORT maximum number of reortogonalizations acepted
*     ..
*     Arguments
*     =========
*
*     ..
*     Authors
*     =======
*     Freddy Fernandes Guimaraes
*
*     ..
*     Historic
*     ========
*     (17/03/2003) First version LNZ written by Freddy 
*
c     **
c     ** Parameters 
      REAL*8        ZERO, ONE
      PARAMETER     (ZERO = +0.0E+0, ONE = +1.0E+0)
c     **
c     ** Local scalars 
cdel      LOGICAL
cdel      CHARACTER*1
      INTEGER       IT, I, J
      REAL*8        BT0, SUM1

c     **
c     ** External functions 
cdel      LOGICAL
cdel      CHARACTER*
cdel      INTEGER       
      REAL*8        ECNORM
c     **
c     ** External subroutines 
      EXTERNAL      FFTT, REORT  
c     **
c     ** Intrinsic functions 
cdel      INTRINSIC     
c     .. Start program      
c     .. init and test lanczos parameters  
      IF(NREORT.GT.LMTREORT)THEN
         WRITE(*,*)'Error NREORT > LMTREORT'
         WRITE(*,*)'NREORT=',NREORT,'  LMTREORT=',LMTREORT 
         IF(CHANGE)THEN
            NREORT = LMTREORT
            WRITE(*,*)'Modifing NREORT to correct value!'
            WRITE(*,*)'NREORT=',NREORT,'  LMTREORT=',LMTREORT
         ENDIF       
      ENDIF
c
      IT = ZERO
      DO I=1,N,1
         WORK(I) = VI(I)
         VI(I) = ZERO
         DO J=1,NREORT,1
            LNZVC(I,J) = ZERO
         ENDDO
      ENDDO 
c 
      BT0 = ECNORM(N, WORK)
      IF(BT0.EQ.0)GOTO 10
c     
      DO I=1,M,1
         DO J=1,N,1
            V0(J) = VI(J)
            VI(J) = WORK(J)/BT0
            IF(I.LE.NREORT)THEN
               LNZVC(J,I) = VI(J)
               IT = I
            ENDIF
         ENDDO   
c     .. entrar com as matrizes para diferentes dimensoes
         IF(DIM(1:3).EQ.'.1D')THEN
            DO J=1,N,1
               WORK
            ENDDO
c            CALL AU_1D(N, SHM, VPOT, VI, WORK)
c         ELSEIF(DIM(1:3).EQ.'.2D')THEN
c            CALL AU_2D(NP, SHM, VPOT, VI, WORK)
c         ELSEIF(DIM(1:3).EQ.'.3D')THEN
c            CALL AU_3D(NP, SHM, VPOT, VI, WORK)
c         ELSE
c            WRITE(*,*)'<<<>>> Dimension error <<<>>>' 
c            STOP
c         ENDIF
c
         SUM1 = ZERO
         DO J=1,N,1
            WORK(J) = WORK(J) - BT0*V0(J)
            SUM1 = SUM1 + VI(J)*WORK(J)
         ENDDO 
         AL(I) = SUM1
c     
         DO J=1,N,1
            WORK(J) = WORK(J) - AL(I)*VI(J)
         ENDDO  
c     
         CALL REORT(N, IT, NREORT, MXDCT, WORK, LNZVC)
c     
         BT(I) = ECNORM(N, WORK)
         BT0 = BT(I)
c     
      ENDDO
 10   CONTINUE
c
      RETURN
      END
