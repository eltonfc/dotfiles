" Vim syntax file
" Language: Gromacs MDP file
" Maintainer: Jaakko Uusitalo                      
" Last Change: 2011-08-02 
" Filenames: *.mdp  
" Version: 0.0.1b 

if exists("b:current_syntax")
  finish
endif

syn match mdpComment ";.*$" 

syn keyword mdpPreProc include define
syn keyword mdpParam no No yes Yes All none None COM com System system
syn match mdpParam 'all\w'

syn keyword mdpRunCont integrator tinit dt nsteps init_step comm_mode 
syn keyword mdpRunCont nstcomm comm_grps
syn keyword mdpParam md sd sd1 bd steep cg l-bfgs nm tpi tpic Linear linear 
syn keyword mdpParam Angular angular 
syn match mdpParam 'md\Wvv'
syn match mdpParam 'md\Wvv\avek'

syn keyword mdpLangDyn bd_fric ld_seed 

syn keyword mdpEneMin emtol emstep nstcgsteep nbfgscorr

syn keyword mdpShellMD emtol niter fcstep

syn keyword mdpTestPI rtpi

syn keyword mdpOutCtrl nstxout nstvout nstfout nstlog nstcalcenergy nstenergy
syn keyword mdpOutCtrl nstxtcout xtc_precision xtc_grps energygrps 

syn keyword mdpNeSrch nstlist ns_type pbc periodic_molecules rlist rlistlong
syn keyword mdpParam grid simple xyz xy 

syn keyword mdpElStat coulombtype rcoulomb_switch rcoulomb epsilon_r epsilon_rf
syn keyword mdpParam Ewald ewald PME pme PPPM pppm Shift shift Switch switch 
syn keyword mdpParam User user 
syn match mdpParam 'Cut\Woff'
syn match mdpParam 'cut\Woff'
syn match mdpParam 'Reaction\WField'
syn match mdpParam 'reaction\Wfield'
syn match mdpParam 'Reaction\WField\Wzero'
syn match mdpParam 'reaction\Wfield\Wzero'
syn match mdpParam 'Reaction\WField\Wnec'
syn match mdpParam 'reaction\Wfield\Wnec'
syn match mdpParam 'Encad\WShift'
syn match mdpParam 'encad\Wshift'
syn match mdpParam 'PME\WSwitch'
syn match mdpParam 'pme\Wswitch'
syn match mdpParam 'PME\WUser'
syn match mdpParam 'pme\Wuser'
syn match mdpParam 'PME\WUser\WSwitch'
syn match mdpParam 'pme\Wuser\Wswitch'

syn keyword mdpVdW vdwtype rvdw_switch rvdw DispCorr 
syn keyword mdpParam EnerPres enerpress Ener ener

syn keyword mdpTables energygrp_table
syn match mdpTables 'table\Wextension'

syn keyword mdpEwald fourierspacing fourier_nx pme_order ewald_rtol 
syn keyword mdpEwald ewald_geometry epsilon_surface optimize_fft
syn keyword mdpParam 3d 3dc

syn keyword mdpTCoupl Tcoupl tcoupl nsttcouple tc_grps tau_t ref_t
syn match mdpTCoupl 'nh\Wchain\Wlength'
syn keyword mdpParam  no Berendsen berendsen 
syn match mdpParam 'Nose\WHoover'
syn match mdpParam 'nose\Whoover'
syn match mdpParam 'v\Wrescale' 

syn keyword mdpPCoupl pcoupl pcoupltype nstpcouple tau_p compressibility 
syn keyword mdpPCoupl ref_p refcoord_scaling Pcoupl Pcoupltype
syn keyword mdpParam  no isotropic semiisotropic anisotropic MTTK mttk 
syn match mdpParam 'Parrinello\WRahman'
syn match mdpParam 'parrinello\Wrahman'
syn match mdpParam 'surface\Wtension'

syn keyword mdpSimAnn annealing annealing_npoints annealing_time annealing_temp
syn keyword mdpParam single periodic 

syn keyword mdpVelGen gen_vel gen_temp gen_seed 

syn keyword mdpBonds constraints constraint_algorithm continuation shake_tol 
syn keyword mdpBonds lincs_order lincs_iter lincs_warnangle morse 
syn keyword mdpParam  none hbonds LINCS lincs SHAKE shake 
syn match mdpParam 'all\Wbonds'
syn match mdpParam 'h\Wangles'
syn match mdpParam 'all\Wangles'

syn keyword mdpEGExcl energygrp_excl

syn keyword mdpWalls nwall wall_atomtype wall_type wall_r_linpot 
syn keyword mdpWalls wall_density wall_ewald_zfac

syn keyword mdpCOMPull pull pull_geometry pull_dim pull_r1 pull_r0 
syn keyword mdpCOMPull pull_constr_tol pull_start pull_nstxout pull_nstfout 
syn keyword mdpCOMPull pull_ngroups 
syn match mdpCOMPull 'pull_group\d'
syn match mdpCOMPull 'pull_weights\d'
syn match mdpCOMPull 'pull_pbcatom\d'
syn match mdpCOMPull 'pull_vec\d'
syn match mdpCOMPull 'pull_init\d'
syn match mdpCOMPull 'pull_rate\d'
syn match mdpCOMPull 'pull_k\d' 
syn match mdpCOMPull 'pull_kB' 
syn keyword mdpParam no yes umbrella constraint constant_force distance 
syn keyword mdpParam direction direction_periodic cylinder position

syn keyword mdpNMRRef disre disre_weighting disre_mixed disre_fc disre_tau 
syn keyword mdpNMRRef nstdisreout orire orire_fc orire_tau orire_fitgrp 
syn keyword mdpNMRRef nstorireout
syn keyword mdpParam simple ensemble conservative equal 

syn keyword mdpFECalc free_energy init_lambda delta_lambda foreign_lambda 
syn keyword mdpFECalc dhdl_derivatives sc_alpha sc_power sc_sigma 
syn keyword mdpFECalc nstdhdl separate_dhdl_file dh_hist_size dh_hist_spacing 
syn match mdpFECalc 'couple\Wmoltype'
syn match mdpFECalc 'couple\Wlambda0' 
syn match mdpFECalc 'couple\Wlambda1' 
syn match mdpFECalc 'couple\Wintramol' 
syn keyword mdpParam none q vdw 
syn match mdpParam 'vdw\Wq'

syn keyword mdpNeqMD acc_grps accelerate freezegrps freezedim 
syn keyword mdpNeqMD cos_acceleration deform

syn keyword mdpEField E_x E_y E_z E_xt E_yt E_zt

syn keyword mdpQMMM QMMM QMMMscheme QMmethod QMbasis QMcharge QMmult 
syn keyword mdpQMMM CASorbitals CASelectrons SH 
syn match mdpQMMM 'QMMM\Wgrps'
syn keyword mdpParam normal ONIOM oniom 

syn keyword mdpImpSol implicit_solvent gb_algorithm nstgbradii rgbradii 
syn keyword mdpImpSol gb_epsilon_solvent gb_saltconc gb_obc_alpha 
syn keyword mdpImpSol gb_dielectric_offset sa_algorithm sa_surface_tension
syn keyword mdpParam GBSA gbsa Still still HCT hct OBC obc 
syn match mdpParam 'Ace\Wapproximation'
syn match mdpParam 'ace\Wapproximation'

syn match mdpNumber        '\<\d\+[lLjJ]\=\>'
syn match mdpNumber        '\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>' 
syn match mdpNumber        '\<\d\+[eE][+-]\=\d\+[jJ]\=\>'
syn match mdpNumber        '\<\d\+\.\d*\([eE][+-]\=\d\+\)\=[jJ]\=' 


let b:current_syntax = "mdp"


hi def link mdpComment      Comment

hi def link mdpPreProc      Statement
hi def link mdpRunCont      Statement
hi def link mdpLangDyn      Statement
hi def link mdpEneMin       Statement
hi def link mdpShellMD      Statement
hi def link mdpTestPI       Statement
hi def link mdpOutCtrl      Statement
hi def link mdpNeSrch       Statement
hi def link mdpElStat       Statement
hi def link mdpVdW          Statement
hi def link mdpTables       Statement
hi def link mdpEwald        Statement
hi def link mdpTCoupl       Statement
hi def link mdpPCoupl       Statement
hi def link mdpSimAnn       Statement
hi def link mdpVelGen       Statement
hi def link mdpBonds        Statement
hi def link mdpEGExcl       Statement
hi def link mdpWalls        Statement
hi def link mdpCOMPull      Statement
hi def link mdpNMRRef       Statement
hi def link mdpFECalc       Statement
hi def link mdpNeqMD        Statement
hi def link mdpEField       Statement
hi def link mdpQMMM         Statement 
hi def link mdpImpSol       Statement
hi def link mdpParam        Constant
hi def link mdpNumber       Constant



