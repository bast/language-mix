    module interoperable_type

      use, intrinsic :: iso_c_binding

      implicit none
      
      public host_input                                                             
                                                                                    
!     cavity specification *PCMSOL section
      character(kind=c_char), public, save :: pcmmod_cavity_type*8 = 'gepol'
      integer(c_int), public, save  :: pcmmod_patch_level = 2
      real(c_double), public, save  :: pcmmod_coarsity = 0.5
      real(c_double), public, save  :: pcmmod_cavity_area = 0.3
      real(c_double), public, save  :: pcmmod_min_distance = 0.1
      integer(c_int), public, save  :: pcmmod_der_order = 4
      logical(c_bool), public, save  :: pcmmod_scaling = .true.
      character(kind=c_char), public, save :: pcmmod_radii_set*8 = 'bondi'
      character(kind=c_char), public, save :: pcmmod_restart_name*20 = 'cavity.npz'
                                                                                    
      type, bind(c) :: cavityInput
              character(kind=c_char) :: cavity_type*8
              integer(c_int) :: patch_level
              real(c_double) :: coarsity
              real(c_double) :: area
              real(c_double) :: min_distance
              integer(c_int) :: der_order
              logical(c_bool) :: scaling
              character(kind=c_char) :: radii_set*8
              character(kind=c_char) :: restart_name*20
      end type
      
      contains
                                                                                    
         subroutine host_input(cavity) bind(c, name='host_input')
                                                               
         type(cavityInput) :: cavity
                                                                                    
         cavity%cavity_type  = pcmmod_cavity_type//c_null_char
         cavity%patch_level  = pcmmod_patch_level
         cavity%coarsity     = pcmmod_coarsity
         cavity%area         = pcmmod_cavity_area
         cavity%min_distance = pcmmod_min_distance
         cavity%der_order    = pcmmod_der_order
         cavity%scaling      = pcmmod_scaling
         cavity%radii_set    = pcmmod_radii_set//c_null_char
         cavity%restart_name = pcmmod_restart_name//c_null_char
         print *, "cavity%cavity_type = ",  cavity%cavity_type  
         print *, "cavity%patch_level = ",  cavity%patch_level  
         print *, "cavity%coarsity = ",     cavity%coarsity     
         print *, "cavity%area = ",         cavity%area         
         print *, "cavity%min_distance = ", cavity%min_distance 
         print *, "cavity%der_order = ",    cavity%der_order    
         print *, "cavity%scaling = ",      cavity%scaling      
         print *, "cavity%radii_set = ",    cavity%radii_set    
         print *, "cavity%restart_name = ", cavity%restart_name 
                                                                                    
         end subroutine host_input

    end module interoperable_type
