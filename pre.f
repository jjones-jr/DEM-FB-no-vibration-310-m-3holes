      subroutine preC      include 'demA.h'C      integer wp      real*8  ab,bc,piqC      open( unit = 1, err = 100, status='old', file = 'infile.dat' )C      read(1,*) ts, tp, te, dt      read(1,*) rq, rho, mu, muw      read(1,*) ang, pe, pnuC      read(1,*) iwall, os      do 10 iq = 1, iwall         read(1,*)      jq         read(1,*)   xw(iq),   yw(iq)         read(1,*) ewnx(iq), ewny(iq)         read(1,*) ewtx(iq), ewty(iq) 10   continueC      read(1,*)    upxq,    upy      read(1,*) dpartxq, dpartyqC      read(1,*) ipq      do 20 iq = 1, ipq        read(1,*)      jq        read(1,*)    x(iq),    y(iq)          read(1,*)   vx(iq),   vy(iq),  omgq(iq) 20   continueC 200  read(1,*,end=300) wp,iq,jq,lq,ab,bcC      if(wp.eq.1)then         ftbl(iq,jq) = lq         fn(iq,jq) = ab         ft(iq,jq) = bc      else         fwn(iq,jq) = ab         fwt(iq,jq) = bc      endif      goto 200C 300  close(1)C      piq = 4.*atan(1.)      mass = (4./3.) * piq * ( rq ** 3.) * rho      inat = 0.4*mass*(rq**2.)C      tnomax = 10C      returnC 100  write(9,*) 'open error infile.dat (unit=1)'C      stop      end