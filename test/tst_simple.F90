program test1

  use tst_utils
  use iso_var_str
  use variable

  implicit none
  
  type(var) :: va
  real(dp) :: a, b(2), c(2,2)
  real(dp), pointer :: pa =>null()
  type(var_str) :: sa, sb
  character(len=20) :: ca, cb
  logical :: success

#include "var_declarations.inc"
  
  a = 1.0_dp
  b = 2._dp
  c = 3._dp
  
  call assign(va,a)
  pd0 = transfer(va%enc,pd0)
  print '(a2,tr1,f4.2)',va%t,pd0%p
  call associate(pa,va,success=success)
  if ( success ) then
     print *,'Success: ',pa
  end if

  call assign(va,b)
  call assign(b,va)
  pd1 = transfer(va%enc,pd1)
  print '(a2,2(tr1,f4.2))',va%t,pd1%p

  call assign(va,c)
  pd2 = transfer(va%enc,pd2)
  print '(a2,4(tr1,f4.2))',va%t,pd2%p

  call assign(va,1)
  pi0 = transfer(va%enc,pi0)
  print '(a2,tr1,i0)',va%t,pi0%p

  ca = 'hello world'
  sa = ca
  call assign(va,sa)

  call assign(sb,va)
  cb = sb
  print *,cb

end program test1
