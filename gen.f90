program gen
  character(10) :: arg1
  integer :: n
  real :: x
  call get_command_argument(1, arg1)
  read (unit=arg1,fmt=*) n
  call random_seed()
  do i=1,n
     call random_number(x)
     write (*,"(f8.6)") x
  end do
end program gen
