//genesis
// kkit Version 11 flat dumpfile

// Saved on 100
include kkit {argv 1}
FASTDT = 0.001
SIMDT = 0.001
CONTROLDT = 0.1
PLOTDT = 0.1
MAXTIME = 100
TRANSIENT_TIME = 2
VARIABLE_DT_FLAG = 0
DEFAULT_VOL = 1.4667929313500003e-15
VERSION = 11.0 
setfield /file/modpath value ~/scripts/modules
kparms

//genesis
initdump -version 3 -ignoreorphans 1
simobjdump table input output alloced step_mode stepsize x y z
simobjdump xtree path script namemode sizescale
simobjdump xcoredraw xmin xmax ymin ymax
simobjdump xtext editable
simobjdump xgraph xmin xmax ymin ymax overlay
simobjdump xplot pixflags script fg ysquish do_slope wy
simobjdump group xtree_fg_req xtree_textfg_req plotfield expanded movealone \
  link savename file version md5sum mod_save_flag x y z
simobjdump geometry size dim shape outside xtree_fg_req xtree_textfg_req x y z
simobjdump kpool DiffConst CoInit Co n nInit mwt nMin vol slave_enable \
  geomname xtree_fg_req xtree_textfg_req x y z
simobjdump kreac kf kb notes xtree_fg_req xtree_textfg_req x y z
simobjdump kenz CoComplexInit CoComplex nComplexInit nComplex vol k1 k2 k3 \
  keepconc usecomplex notes xtree_fg_req xtree_textfg_req link x y z
simobjdump stim level1 width1 delay1 level2 width2 delay2 baselevel trig_time \
  trig_mode notes xtree_fg_req xtree_textfg_req is_running x y z
simobjdump xtab input output alloced step_mode stepsize notes editfunc \
  xtree_fg_req xtree_textfg_req baselevel last_x last_y is_running x y z
simobjdump kchan perm gmax Vm is_active use_nernst notes xtree_fg_req \
  xtree_textfg_req x y z
simobjdump transport input output alloced step_mode stepsize dt delay clock \
  kf xtree_fg_req xtree_textfg_req x y z
simobjdump proto x y z
simundump geometry /kinetics/geometry 0 1.4667929313500003e-15 3 sphere  "" white black 154 119 0
simundump group /kinetics/CaM 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/PKA 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/AC 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/Ca 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/Gs 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/b2AR 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump group /kinetics/PDE 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 151 119 0
simundump kpool /kinetics/CaM/CaM_Ca4 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry blue 10 152 73 0
simundump kpool /kinetics/CaM/CaM 0 0.0 0 0 0 12370760.284295382 0 0 883323.4583789489 0 /kinetics/geometry pink 10 150 61 0
simundump kpool /kinetics/CaM/neurogranin_CaM 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry red 10 151 61 0
simundump kpool /kinetics/CaM/neurogranin_p 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry red 10 151 61 0
simundump kpool /kinetics/CaM/neurogranin 0 0.0 0 0 0 29059523.7093138 0 0 883323.4583789489 0 /kinetics/geometry red 10 152 61 0
simundump kpool /kinetics/CaM/CaM_Ca3 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry hotpink 10 152 61 0
simundump kpool /kinetics/CaM/CaM_Ca2 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry pink 10 150 77 0
simundump kpool /kinetics/CaM/CaM_Ca 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry pink 10 151 77 0
simundump kpool /kinetics/PKA/PKA_active 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry yellow 13 174 82 0
simundump kpool /kinetics/PKA/R2C2 0 0.0 0 0 0 254233.66853139314 0 0 883323.4583789489 0 /kinetics/geometry 52 13 174 82 0
simundump kpool /kinetics/PKA/R2C2_cAMP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 49 13 175 82 0
simundump kpool /kinetics/PKA/R2C2_cAMP2 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 52 13 175 82 0
simundump kpool /kinetics/PKA/R2C2_cAMP3 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 47 13 176 82 0
simundump kpool /kinetics/PKA/R2C2_cAMP4 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 23 13 176 82 0
simundump kpool /kinetics/PKA/R2C_cAMP4 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 0 13 177 82 0
simundump kpool /kinetics/PKA/R2_cAMP4 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 23 13 177 82 0
simundump kpool /kinetics/PKA/PKA_inhibitor 0 0.0 0 0 0 93101.4245707234 0 0 883323.4583789489 0 /kinetics/geometry cyan 13 178 82 0
simundump kpool /kinetics/PKA/inhibited_PKA 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry cyan 13 176 90 0
simundump kpool /kinetics/AC/cAMP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry green 10 187 55 0
simundump kpool /kinetics/AC/ATP 0 0.0 0 0 0 4829108670.879578 0 0 883323.4583789489 4 /kinetics/geometry red 10 184 51 0
simundump kpool /kinetics/AC/AC1_CaM 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry orange 10 191 47 0
simundump kpool /kinetics/AC/AC1 0 0.0 0 0 0 17863.112499401865 0 0 883323.4583789489 0 /kinetics/geometry orange 10 183 47 0
simundump kpool /kinetics/AC/AC2p 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry yellow 10 187 47 0
simundump kpool /kinetics/AC/AC2_Gs 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry yellow 10 189 47 0
simundump kpool /kinetics/AC/AC2 0 0.0 0 0 0 13397.334374551392 0 0 883323.4583789489 0 /kinetics/geometry yellow 10 184 47 0
simundump kpool /kinetics/AC/AC1_Gs 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry orange 10 190 47 0
simundump kpool /kinetics/AC/AC2p_Gs 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry green 10 194 47 0
simundump kpool /kinetics/AC/AMP 0 0.0 0 0 0 627456257.7328044 0 0 883323.4583789489 0 /kinetics/geometry pink 10 195 61 0
simundump kpool /kinetics/Ca/Ca 0 0.0 0 0 0 106720.495649461 0 0 883323.4583789489 4 /kinetics/geometry red 18 155 64 0
simundump kpool /kinetics/Gs/Gs_alpha_GTP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry red 16 201 73 0
simundump kpool /kinetics/Gs/Gs_GDP 0 0.0 0 0 0 2036419.71127921 0 0 883323.4583789489 0 /kinetics/geometry 23 black 188 91 0
simundump kpool /kinetics/Gs/Gs_alpha_GDP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 25 black 183 91 0
simundump kpool /kinetics/Gs/BetaGamma 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 23 blue 195 78 0
simundump kpool /kinetics/b2AR/Epinephrine 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 61 black 183 118 0
simundump kpool /kinetics/b2AR/Isoproterenol 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 4 black 190 118 0
simundump kpool /kinetics/b2AR/b2AR 0 0.0 0 0 0 35975.93837895302 0 0 883323.4583789489 0 /kinetics/geometry 0 black 188 118 0
simundump kpool /kinetics/b2AR/L_b2AR 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 50 black 182 110 0
simundump kpool /kinetics/b2AR/Lb2AR_GsGDP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 1 black 185 110 0
simundump kpool /kinetics/b2AR/b2AR_GsGDP 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry 23 black 190 110 0
simundump kpool /kinetics/PDE/PDE1 0 0.0 0 0 0 2981661.6780253137 0 0 883323.4583789489 0 /kinetics/geometry green 62 192 65 0
simundump kpool /kinetics/PDE/CaM_PDE1 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry green 62 191 65 0
simundump kpool /kinetics/PDE/cAMP_PDEp 0 0.0 0 0 0 0.0 0 0 883323.4583789489 0 /kinetics/geometry green 62 188 65 0
simundump kpool /kinetics/PDE/cAMP_PDE 0 0.0 0 0 0 1149272.0601344022 0 0 883323.4583789489 0 /kinetics/geometry green 62 187 65 0
simundump kreac /kinetics/CaM/CaM_Ca3_bind_Ca 0 6.669993485334069e-10 0.03725112269348124 "" white 10 151 68 0
simundump kreac /kinetics/CaM/neurogranin_bind_CaM 0 2.3384227662715164e-07 0.8015535825418398 "" white 10 152 68 0
simundump kreac /kinetics/CaM/dephosph_neurogranin 0 0.020730346817633815 0.0 "" white 10 152 68 0
simundump kreac /kinetics/CaM/CaM_bind_Ca 0 6.936713369684622e-06 14.20544279424671 "" white 10 152 68 0
simundump kreac /kinetics/CaM/CaM_Ca2_bind_Ca 0 5.7988746474061096e-08 1.111356856884295 "" white 10 153 68 0
simundump kreac /kinetics/CaM/CaM_Ca_bind_Ca 0 3.944734794772749e-06 4.185413155807871 "" white 10 153 67 0
simundump kreac /kinetics/PKA/cAMP_bind_site_B1 0 3.8680790307349005e-05 11.094557221595585 "" white 13 174 86 0
simundump kreac /kinetics/PKA/cAMP_bind_site_B2 0 2.2058806931812268e-05 5.011531560705236 "" white 13 175 86 0
simundump kreac /kinetics/PKA/cAMP_bind_site_A1 0 5.952909585805405e-05 99.12293582774826 "" white 13 175 86 0
simundump kreac /kinetics/PKA/cAMP_bind_site_A2 0 0.0003202895168800936 13.909801392771742 "" white 13 175 86 0
simundump kreac /kinetics/PKA/Release_C1 0 202.66584400668725 3.0050005946000455e-05 "" white 13 176 86 0
simundump kreac /kinetics/PKA/Release_C2 0 41.25333608342645 0.0001292831599791324 "" white 13 176 86 0
simundump kreac /kinetics/PKA/inhib_PKA 0 1.4656862609093611e-05 2.0415979387382697 "" white 13 177 86 0
simundump kreac /kinetics/AC/CaM_bind_AC1 0 6.906421944804891e-05 0.4600343943657246 "" white 10 191 55 0
simundump kreac /kinetics/AC/dephosph_AC2 0 0.052002636472142004 0.0 "" white 10 184 46 0
simundump kreac /kinetics/AC/Gs_bind_AC2 0 0.0006879811068396062 0.3384370754784121 "" white 10 195 55 0
simundump kreac /kinetics/AC/Gs_bind_AC1 0 0.00013665786060096315 0.3007153448463956 "" white 10 193 56 0
simundump kreac /kinetics/AC/Gs_bind_AC2p 0 0.0008847241773961549 4.173695719438587 "" white 10 197 56 0
simundump kreac /kinetics/Gs/Act_Gs 0 5.0204250955413485 0.0 "" white black 188 82 0
simundump kreac /kinetics/Gs/basalAct_Gs 0 0.001209573953568643 0.0 "" white black 186 82 0
simundump kreac /kinetics/Gs/Inact_Gs 0 0.025970268887994766 0.0 "" white black 185 81 0
simundump kreac /kinetics/Gs/Trimerize_Gs 0 2.8059652429415815e-06 0.0 "" white black 187 82 0
simundump kreac /kinetics/b2AR/Epi_bind_b2AR 0 8.501885652046376e-07 0.4593958557391494 "" white black 189 114 0
simundump kreac /kinetics/b2AR/Iso_bind_b2AR 0 5.195220275996034e-10 0.015730326750500928 "" white black 190 114 0
simundump kreac /kinetics/b2AR/LR_bind_GsGDP 0 7.399284731270434e-07 0.2509572260088958 "" white black 185 114 0
simundump kreac /kinetics/b2AR/R_bind_GsGDP 0 1.301628457564537e-07 0.49506768102156845 "" white black 192 114 0
simundump kreac /kinetics/b2AR/Iso_bind_RGs 0 6.016329585817263e-11 0.0019388189323433433 "" white black 184 113 0
simundump kreac /kinetics/b2AR/Epi_bind_RGs 0 9.783584982860577e-07 0.19417858797040205 "" white black 187 114 0
simundump kreac /kinetics/PDE/dephosph_PDE 0 0.11011264351763032 0.0 "" white 62 187 67 0
simundump kreac /kinetics/PDE/CaM_bind_PDE1 0 0.0008386231190048558 3.3273846728853287 "" white 62 192 67 0
simundump kenz /kinetics/PKA/PKA_active/phosph_PDE 0 0 0 0.0 0 883323.4583789489 2.396904978894119e-05 18.737823560667582 4.684455890166896 0 0 "" yellow red "" 189 67 0
simundump kenz /kinetics/AC/AC1_CaM/AC1CaM_form_cAMP 0 0 0 0 0 883323.4583789489 2.3359531498331157e-06 50.068312319323866 12.517078079830966 0 1 "" orange red "" 182 53 0
simundump kenz /kinetics/AC/AC2p/AC2p_form_cAMP 0 0 0 0 0 883323.4583789489 2.458438362901181e-06 30.708710042805844 7.677177510701461 0 1 "" yellow red "" 179 53 0
simundump kenz /kinetics/AC/AC2_Gs/AC2Gs_form_cAMP 0 0 0 0 0 883323.4583789489 1.280871800068993e-05 167.2057687667251 41.801442191681275 0 1 "" yellow red "" 185 53 0
simundump kenz /kinetics/AC/AC1_Gs/AC1Gs_form_cAMP 0 0 0 0 0 883323.4583789489 2.873566746912834e-06 94.59302357735343 23.64825589433836 0 1 "" orange red "" 191 53 0
simundump kenz /kinetics/AC/AC2p_Gs/AC2pGs_form_cAMP 0 0 0 0 0 883323.4583789489 5.8680784948440225e-06 335.1699191660274 83.79247979150685 0 1 "" green red "" 188 53 0
simundump kenz /kinetics/PDE/PDE1/PDE1 0 0 0 0.0 0 883323.4583789489 3.9374235511691675e-07 7.8794469183241205 1.9692710663937494 0 0 "" green red "" 193 64 0
simundump kenz /kinetics/PDE/CaM_PDE1/CaM_PDE1 0 0 0 0.0 0 883323.4583789489 1.7513252700186043e-06 46.32476638631302 11.581191596578256 0 0 "" green red "" 191 64 0
simundump kenz /kinetics/PDE/cAMP_PDEp/ePDE_p 0 0 0 0.0 0 883323.4583789489 4.533352332071429e-05 71.84072238969527 17.96018059742382 0 0 "" green red "" 189 64 0
simundump kenz /kinetics/PDE/cAMP_PDE/ePDE 0 0 0 0.0 0 883323.4583789489 1.0281252646897403e-05 19.212393709024884 4.803098427256221 0 0 "" green red "" 187 64 0
simundump xgraph /graphs/conc1 0 0 99 0.001 0.999 0
simundump xgraph /graphs/conc2 0 0 100 0 1 0
 simundump xgraph /moregraphs/conc3 0 0 100 0 1 0
simundump xgraph /moregraphs/conc4 0 0 100 0 1 0
 simundump xcoredraw /edit/draw 0 -6 4 -2 6
simundump xtree /edit/draw/tree 0 \
  /kinetics/#[],/kinetics/#[]/#[],/kinetics/#[]/#[]/#[][TYPE!=proto],/kinetics/#[]/#[]/#[][TYPE!=linkinfo]/##[] "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
simundump xtext /file/notes 0 1
addmsg /kinetics/CaM/CaM_Ca3 /kinetics/CaM/CaM_Ca3_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca3_bind_Ca /kinetics/CaM/CaM_Ca3 REAC A B 
addmsg /kinetics/Ca/Ca /kinetics/CaM/CaM_Ca3_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca3_bind_Ca /kinetics/Ca/Ca REAC A B 
addmsg /kinetics/CaM/CaM_Ca4 /kinetics/CaM/CaM_Ca3_bind_Ca PRODUCT n 
addmsg /kinetics/CaM/CaM_Ca3_bind_Ca /kinetics/CaM/CaM_Ca4 REAC B A
addmsg /kinetics/CaM/CaM /kinetics/CaM/neurogranin_bind_CaM SUBSTRATE n 
addmsg /kinetics/CaM/neurogranin_bind_CaM /kinetics/CaM/CaM REAC A B 
addmsg /kinetics/CaM/neurogranin /kinetics/CaM/neurogranin_bind_CaM SUBSTRATE n 
addmsg /kinetics/CaM/neurogranin_bind_CaM /kinetics/CaM/neurogranin REAC A B 
addmsg /kinetics/CaM/neurogranin_CaM /kinetics/CaM/neurogranin_bind_CaM PRODUCT n 
addmsg /kinetics/CaM/neurogranin_bind_CaM /kinetics/CaM/neurogranin_CaM REAC B A
addmsg /kinetics/CaM/neurogranin_p /kinetics/CaM/dephosph_neurogranin SUBSTRATE n 
addmsg /kinetics/CaM/dephosph_neurogranin /kinetics/CaM/neurogranin_p REAC A B 
addmsg /kinetics/CaM/neurogranin /kinetics/CaM/dephosph_neurogranin PRODUCT n 
addmsg /kinetics/CaM/dephosph_neurogranin /kinetics/CaM/neurogranin REAC B A
addmsg /kinetics/CaM/CaM /kinetics/CaM/CaM_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_bind_Ca /kinetics/CaM/CaM REAC A B 
addmsg /kinetics/Ca/Ca /kinetics/CaM/CaM_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_bind_Ca /kinetics/Ca/Ca REAC A B 
addmsg /kinetics/CaM/CaM_Ca /kinetics/CaM/CaM_bind_Ca PRODUCT n 
addmsg /kinetics/CaM/CaM_bind_Ca /kinetics/CaM/CaM_Ca REAC B A
addmsg /kinetics/CaM/CaM_Ca2 /kinetics/CaM/CaM_Ca2_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca2_bind_Ca /kinetics/CaM/CaM_Ca2 REAC A B 
addmsg /kinetics/Ca/Ca /kinetics/CaM/CaM_Ca2_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca2_bind_Ca /kinetics/Ca/Ca REAC A B 
addmsg /kinetics/CaM/CaM_Ca3 /kinetics/CaM/CaM_Ca2_bind_Ca PRODUCT n 
addmsg /kinetics/CaM/CaM_Ca2_bind_Ca /kinetics/CaM/CaM_Ca3 REAC B A
addmsg /kinetics/CaM/CaM_Ca /kinetics/CaM/CaM_Ca_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca_bind_Ca /kinetics/CaM/CaM_Ca REAC A B 
addmsg /kinetics/Ca/Ca /kinetics/CaM/CaM_Ca_bind_Ca SUBSTRATE n 
addmsg /kinetics/CaM/CaM_Ca_bind_Ca /kinetics/Ca/Ca REAC A B 
addmsg /kinetics/CaM/CaM_Ca2 /kinetics/CaM/CaM_Ca_bind_Ca PRODUCT n 
addmsg /kinetics/CaM/CaM_Ca_bind_Ca /kinetics/CaM/CaM_Ca2 REAC B A
addmsg /kinetics/PKA/R2C2 /kinetics/PKA/cAMP_bind_site_B1 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_B1 /kinetics/PKA/R2C2 REAC A B 
addmsg /kinetics/AC/cAMP /kinetics/PKA/cAMP_bind_site_B1 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_B1 /kinetics/AC/cAMP REAC A B 
addmsg /kinetics/PKA/R2C2_cAMP /kinetics/PKA/cAMP_bind_site_B1 PRODUCT n 
addmsg /kinetics/PKA/cAMP_bind_site_B1 /kinetics/PKA/R2C2_cAMP REAC B A
addmsg /kinetics/PKA/R2C2_cAMP /kinetics/PKA/cAMP_bind_site_B2 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_B2 /kinetics/PKA/R2C2_cAMP REAC A B 
addmsg /kinetics/AC/cAMP /kinetics/PKA/cAMP_bind_site_B2 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_B2 /kinetics/AC/cAMP REAC A B 
addmsg /kinetics/PKA/R2C2_cAMP2 /kinetics/PKA/cAMP_bind_site_B2 PRODUCT n 
addmsg /kinetics/PKA/cAMP_bind_site_B2 /kinetics/PKA/R2C2_cAMP2 REAC B A
addmsg /kinetics/PKA/R2C2_cAMP2 /kinetics/PKA/cAMP_bind_site_A1 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_A1 /kinetics/PKA/R2C2_cAMP2 REAC A B 
addmsg /kinetics/AC/cAMP /kinetics/PKA/cAMP_bind_site_A1 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_A1 /kinetics/AC/cAMP REAC A B 
addmsg /kinetics/PKA/R2C2_cAMP3 /kinetics/PKA/cAMP_bind_site_A1 PRODUCT n 
addmsg /kinetics/PKA/cAMP_bind_site_A1 /kinetics/PKA/R2C2_cAMP3 REAC B A
addmsg /kinetics/PKA/R2C2_cAMP3 /kinetics/PKA/cAMP_bind_site_A2 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_A2 /kinetics/PKA/R2C2_cAMP3 REAC A B 
addmsg /kinetics/AC/cAMP /kinetics/PKA/cAMP_bind_site_A2 SUBSTRATE n 
addmsg /kinetics/PKA/cAMP_bind_site_A2 /kinetics/AC/cAMP REAC A B 
addmsg /kinetics/PKA/R2C2_cAMP4 /kinetics/PKA/cAMP_bind_site_A2 PRODUCT n 
addmsg /kinetics/PKA/cAMP_bind_site_A2 /kinetics/PKA/R2C2_cAMP4 REAC B A
addmsg /kinetics/PKA/R2C2_cAMP4 /kinetics/PKA/Release_C1 SUBSTRATE n 
addmsg /kinetics/PKA/Release_C1 /kinetics/PKA/R2C2_cAMP4 REAC A B 
addmsg /kinetics/PKA/PKA_active /kinetics/PKA/Release_C1 PRODUCT n 
addmsg /kinetics/PKA/Release_C1 /kinetics/PKA/PKA_active REAC B A
addmsg /kinetics/PKA/R2C_cAMP4 /kinetics/PKA/Release_C1 PRODUCT n 
addmsg /kinetics/PKA/Release_C1 /kinetics/PKA/R2C_cAMP4 REAC B A
addmsg /kinetics/PKA/R2C_cAMP4 /kinetics/PKA/Release_C2 SUBSTRATE n 
addmsg /kinetics/PKA/Release_C2 /kinetics/PKA/R2C_cAMP4 REAC A B 
addmsg /kinetics/PKA/PKA_active /kinetics/PKA/Release_C2 PRODUCT n 
addmsg /kinetics/PKA/Release_C2 /kinetics/PKA/PKA_active REAC B A
addmsg /kinetics/PKA/R2_cAMP4 /kinetics/PKA/Release_C2 PRODUCT n 
addmsg /kinetics/PKA/Release_C2 /kinetics/PKA/R2_cAMP4 REAC B A
addmsg /kinetics/PKA/PKA_active /kinetics/PKA/inhib_PKA SUBSTRATE n 
addmsg /kinetics/PKA/inhib_PKA /kinetics/PKA/PKA_active REAC A B 
addmsg /kinetics/PKA/PKA_inhibitor /kinetics/PKA/inhib_PKA SUBSTRATE n 
addmsg /kinetics/PKA/inhib_PKA /kinetics/PKA/PKA_inhibitor REAC A B 
addmsg /kinetics/PKA/inhibited_PKA /kinetics/PKA/inhib_PKA PRODUCT n 
addmsg /kinetics/PKA/inhib_PKA /kinetics/PKA/inhibited_PKA REAC B A
addmsg /kinetics/CaM/CaM_Ca4 /kinetics/AC/CaM_bind_AC1 SUBSTRATE n 
addmsg /kinetics/AC/CaM_bind_AC1 /kinetics/CaM/CaM_Ca4 REAC A B 
addmsg /kinetics/AC/AC1 /kinetics/AC/CaM_bind_AC1 SUBSTRATE n 
addmsg /kinetics/AC/CaM_bind_AC1 /kinetics/AC/AC1 REAC A B 
addmsg /kinetics/AC/AC1_CaM /kinetics/AC/CaM_bind_AC1 PRODUCT n 
addmsg /kinetics/AC/CaM_bind_AC1 /kinetics/AC/AC1_CaM REAC B A
addmsg /kinetics/AC/AC2p /kinetics/AC/dephosph_AC2 SUBSTRATE n 
addmsg /kinetics/AC/dephosph_AC2 /kinetics/AC/AC2p REAC A B 
addmsg /kinetics/AC/AC2 /kinetics/AC/dephosph_AC2 PRODUCT n 
addmsg /kinetics/AC/dephosph_AC2 /kinetics/AC/AC2 REAC B A
addmsg /kinetics/AC/AC2 /kinetics/AC/Gs_bind_AC2 SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC2 /kinetics/AC/AC2 REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/AC/Gs_bind_AC2 SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC2 /kinetics/Gs/Gs_alpha_GTP REAC A B 
addmsg /kinetics/AC/AC2_Gs /kinetics/AC/Gs_bind_AC2 PRODUCT n 
addmsg /kinetics/AC/Gs_bind_AC2 /kinetics/AC/AC2_Gs REAC B A
addmsg /kinetics/AC/AC1 /kinetics/AC/Gs_bind_AC1 SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC1 /kinetics/AC/AC1 REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/AC/Gs_bind_AC1 SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC1 /kinetics/Gs/Gs_alpha_GTP REAC A B 
addmsg /kinetics/AC/AC1_Gs /kinetics/AC/Gs_bind_AC1 PRODUCT n 
addmsg /kinetics/AC/Gs_bind_AC1 /kinetics/AC/AC1_Gs REAC B A
addmsg /kinetics/AC/AC2p /kinetics/AC/Gs_bind_AC2p SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC2p /kinetics/AC/AC2p REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/AC/Gs_bind_AC2p SUBSTRATE n 
addmsg /kinetics/AC/Gs_bind_AC2p /kinetics/Gs/Gs_alpha_GTP REAC A B 
addmsg /kinetics/AC/AC2p_Gs /kinetics/AC/Gs_bind_AC2p PRODUCT n 
addmsg /kinetics/AC/Gs_bind_AC2p /kinetics/AC/AC2p_Gs REAC B A
addmsg /kinetics/b2AR/Lb2AR_GsGDP /kinetics/Gs/Act_Gs SUBSTRATE n 
addmsg /kinetics/Gs/Act_Gs /kinetics/b2AR/Lb2AR_GsGDP REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/Gs/Act_Gs PRODUCT n 
addmsg /kinetics/Gs/Act_Gs /kinetics/Gs/Gs_alpha_GTP REAC B A
addmsg /kinetics/Gs/BetaGamma /kinetics/Gs/Act_Gs PRODUCT n 
addmsg /kinetics/Gs/Act_Gs /kinetics/Gs/BetaGamma REAC B A
addmsg /kinetics/b2AR/L_b2AR /kinetics/Gs/Act_Gs PRODUCT n 
addmsg /kinetics/Gs/Act_Gs /kinetics/b2AR/L_b2AR REAC B A
addmsg /kinetics/Gs/Gs_GDP /kinetics/Gs/basalAct_Gs SUBSTRATE n 
addmsg /kinetics/Gs/basalAct_Gs /kinetics/Gs/Gs_GDP REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/Gs/basalAct_Gs PRODUCT n 
addmsg /kinetics/Gs/basalAct_Gs /kinetics/Gs/Gs_alpha_GTP REAC B A
addmsg /kinetics/Gs/BetaGamma /kinetics/Gs/basalAct_Gs PRODUCT n 
addmsg /kinetics/Gs/basalAct_Gs /kinetics/Gs/BetaGamma REAC B A
addmsg /kinetics/Gs/Gs_alpha_GTP /kinetics/Gs/Inact_Gs SUBSTRATE n 
addmsg /kinetics/Gs/Inact_Gs /kinetics/Gs/Gs_alpha_GTP REAC A B 
addmsg /kinetics/Gs/Gs_alpha_GDP /kinetics/Gs/Inact_Gs PRODUCT n 
addmsg /kinetics/Gs/Inact_Gs /kinetics/Gs/Gs_alpha_GDP REAC B A
addmsg /kinetics/Gs/Gs_alpha_GDP /kinetics/Gs/Trimerize_Gs SUBSTRATE n 
addmsg /kinetics/Gs/Trimerize_Gs /kinetics/Gs/Gs_alpha_GDP REAC A B 
addmsg /kinetics/Gs/BetaGamma /kinetics/Gs/Trimerize_Gs SUBSTRATE n 
addmsg /kinetics/Gs/Trimerize_Gs /kinetics/Gs/BetaGamma REAC A B 
addmsg /kinetics/Gs/Gs_GDP /kinetics/Gs/Trimerize_Gs PRODUCT n 
addmsg /kinetics/Gs/Trimerize_Gs /kinetics/Gs/Gs_GDP REAC B A
addmsg /kinetics/b2AR/Epinephrine /kinetics/b2AR/Epi_bind_b2AR SUBSTRATE n 
addmsg /kinetics/b2AR/Epi_bind_b2AR /kinetics/b2AR/Epinephrine REAC A B 
addmsg /kinetics/b2AR/b2AR /kinetics/b2AR/Epi_bind_b2AR SUBSTRATE n 
addmsg /kinetics/b2AR/Epi_bind_b2AR /kinetics/b2AR/b2AR REAC A B 
addmsg /kinetics/b2AR/L_b2AR /kinetics/b2AR/Epi_bind_b2AR PRODUCT n 
addmsg /kinetics/b2AR/Epi_bind_b2AR /kinetics/b2AR/L_b2AR REAC B A
addmsg /kinetics/b2AR/Isoproterenol /kinetics/b2AR/Iso_bind_b2AR SUBSTRATE n 
addmsg /kinetics/b2AR/Iso_bind_b2AR /kinetics/b2AR/Isoproterenol REAC A B 
addmsg /kinetics/b2AR/b2AR /kinetics/b2AR/Iso_bind_b2AR SUBSTRATE n 
addmsg /kinetics/b2AR/Iso_bind_b2AR /kinetics/b2AR/b2AR REAC A B 
addmsg /kinetics/b2AR/L_b2AR /kinetics/b2AR/Iso_bind_b2AR PRODUCT n 
addmsg /kinetics/b2AR/Iso_bind_b2AR /kinetics/b2AR/L_b2AR REAC B A
addmsg /kinetics/Gs/Gs_GDP /kinetics/b2AR/LR_bind_GsGDP SUBSTRATE n 
addmsg /kinetics/b2AR/LR_bind_GsGDP /kinetics/Gs/Gs_GDP REAC A B 
addmsg /kinetics/b2AR/L_b2AR /kinetics/b2AR/LR_bind_GsGDP SUBSTRATE n 
addmsg /kinetics/b2AR/LR_bind_GsGDP /kinetics/b2AR/L_b2AR REAC A B 
addmsg /kinetics/b2AR/Lb2AR_GsGDP /kinetics/b2AR/LR_bind_GsGDP PRODUCT n 
addmsg /kinetics/b2AR/LR_bind_GsGDP /kinetics/b2AR/Lb2AR_GsGDP REAC B A
addmsg /kinetics/Gs/Gs_GDP /kinetics/b2AR/R_bind_GsGDP SUBSTRATE n 
addmsg /kinetics/b2AR/R_bind_GsGDP /kinetics/Gs/Gs_GDP REAC A B 
addmsg /kinetics/b2AR/b2AR /kinetics/b2AR/R_bind_GsGDP SUBSTRATE n 
addmsg /kinetics/b2AR/R_bind_GsGDP /kinetics/b2AR/b2AR REAC A B 
addmsg /kinetics/b2AR/b2AR_GsGDP /kinetics/b2AR/R_bind_GsGDP PRODUCT n 
addmsg /kinetics/b2AR/R_bind_GsGDP /kinetics/b2AR/b2AR_GsGDP REAC B A
addmsg /kinetics/b2AR/Isoproterenol /kinetics/b2AR/Iso_bind_RGs SUBSTRATE n 
addmsg /kinetics/b2AR/Iso_bind_RGs /kinetics/b2AR/Isoproterenol REAC A B 
addmsg /kinetics/b2AR/b2AR_GsGDP /kinetics/b2AR/Iso_bind_RGs SUBSTRATE n 
addmsg /kinetics/b2AR/Iso_bind_RGs /kinetics/b2AR/b2AR_GsGDP REAC A B 
addmsg /kinetics/b2AR/Lb2AR_GsGDP /kinetics/b2AR/Iso_bind_RGs PRODUCT n 
addmsg /kinetics/b2AR/Iso_bind_RGs /kinetics/b2AR/Lb2AR_GsGDP REAC B A
addmsg /kinetics/b2AR/Epinephrine /kinetics/b2AR/Epi_bind_RGs SUBSTRATE n 
addmsg /kinetics/b2AR/Epi_bind_RGs /kinetics/b2AR/Epinephrine REAC A B 
addmsg /kinetics/b2AR/b2AR_GsGDP /kinetics/b2AR/Epi_bind_RGs SUBSTRATE n 
addmsg /kinetics/b2AR/Epi_bind_RGs /kinetics/b2AR/b2AR_GsGDP REAC A B 
addmsg /kinetics/b2AR/Lb2AR_GsGDP /kinetics/b2AR/Epi_bind_RGs PRODUCT n 
addmsg /kinetics/b2AR/Epi_bind_RGs /kinetics/b2AR/Lb2AR_GsGDP REAC B A
addmsg /kinetics/PDE/cAMP_PDEp /kinetics/PDE/dephosph_PDE SUBSTRATE n 
addmsg /kinetics/PDE/dephosph_PDE /kinetics/PDE/cAMP_PDEp REAC A B 
addmsg /kinetics/PDE/cAMP_PDE /kinetics/PDE/dephosph_PDE PRODUCT n 
addmsg /kinetics/PDE/dephosph_PDE /kinetics/PDE/cAMP_PDE REAC B A
addmsg /kinetics/CaM/CaM_Ca4 /kinetics/PDE/CaM_bind_PDE1 SUBSTRATE n 
addmsg /kinetics/PDE/CaM_bind_PDE1 /kinetics/CaM/CaM_Ca4 REAC A B 
addmsg /kinetics/PDE/PDE1 /kinetics/PDE/CaM_bind_PDE1 SUBSTRATE n 
addmsg /kinetics/PDE/CaM_bind_PDE1 /kinetics/PDE/PDE1 REAC A B 
addmsg /kinetics/PDE/CaM_PDE1 /kinetics/PDE/CaM_bind_PDE1 PRODUCT n 
addmsg /kinetics/PDE/CaM_bind_PDE1 /kinetics/PDE/CaM_PDE1 REAC B A
addmsg /kinetics/PDE/cAMP_PDE /kinetics/PKA/PKA_active/phosph_PDE SUBSTRATE n 
addmsg /kinetics/PKA/PKA_active/phosph_PDE /kinetics/PDE/cAMP_PDE REAC sA B 
addmsg /kinetics/PKA/PKA_active/phosph_PDE /kinetics/PDE/cAMP_PDEp MM_PRD pA
addmsg /kinetics/PKA/PKA_active /kinetics/PKA/PKA_active/phosph_PDE ENZYME n
addmsg /kinetics/PKA/PKA_active/phosph_PDE /kinetics/PKA/PKA_active REAC eA B
addmsg /kinetics/AC/ATP /kinetics/AC/AC1_CaM/AC1CaM_form_cAMP SUBSTRATE n 
addmsg /kinetics/AC/AC1_CaM/AC1CaM_form_cAMP /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC1_CaM/AC1CaM_form_cAMP /kinetics/AC/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC1_CaM /kinetics/AC/AC1_CaM/AC1CaM_form_cAMP ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2p/AC2p_form_cAMP SUBSTRATE n 
addmsg /kinetics/AC/AC2p/AC2p_form_cAMP /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC2p/AC2p_form_cAMP /kinetics/AC/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC2p /kinetics/AC/AC2p/AC2p_form_cAMP ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2_Gs/AC2Gs_form_cAMP SUBSTRATE n 
addmsg /kinetics/AC/AC2_Gs/AC2Gs_form_cAMP /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC2_Gs/AC2Gs_form_cAMP /kinetics/AC/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC2_Gs /kinetics/AC/AC2_Gs/AC2Gs_form_cAMP ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC1_Gs/AC1Gs_form_cAMP SUBSTRATE n 
addmsg /kinetics/AC/AC1_Gs/AC1Gs_form_cAMP /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC1_Gs/AC1Gs_form_cAMP /kinetics/AC/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC1_Gs /kinetics/AC/AC1_Gs/AC1Gs_form_cAMP ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2p_Gs/AC2pGs_form_cAMP SUBSTRATE n 
addmsg /kinetics/AC/AC2p_Gs/AC2pGs_form_cAMP /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC2p_Gs/AC2pGs_form_cAMP /kinetics/AC/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC2p_Gs /kinetics/AC/AC2p_Gs/AC2pGs_form_cAMP ENZYME n 
addmsg /kinetics/AC/cAMP /kinetics/PDE/PDE1/PDE1 SUBSTRATE n 
addmsg /kinetics/PDE/PDE1/PDE1 /kinetics/AC/cAMP REAC sA B 
addmsg /kinetics/PDE/PDE1/PDE1 /kinetics/AC/AMP MM_PRD pA
addmsg /kinetics/PDE/PDE1 /kinetics/PDE/PDE1/PDE1 ENZYME n
addmsg /kinetics/PDE/PDE1/PDE1 /kinetics/PDE/PDE1 REAC eA B
addmsg /kinetics/AC/cAMP /kinetics/PDE/CaM_PDE1/CaM_PDE1 SUBSTRATE n 
addmsg /kinetics/PDE/CaM_PDE1/CaM_PDE1 /kinetics/AC/cAMP REAC sA B 
addmsg /kinetics/PDE/CaM_PDE1/CaM_PDE1 /kinetics/AC/AMP MM_PRD pA
addmsg /kinetics/PDE/CaM_PDE1 /kinetics/PDE/CaM_PDE1/CaM_PDE1 ENZYME n
addmsg /kinetics/PDE/CaM_PDE1/CaM_PDE1 /kinetics/PDE/CaM_PDE1 REAC eA B
addmsg /kinetics/AC/cAMP /kinetics/PDE/cAMP_PDEp/ePDE_p SUBSTRATE n 
addmsg /kinetics/PDE/cAMP_PDEp/ePDE_p /kinetics/AC/cAMP REAC sA B 
addmsg /kinetics/PDE/cAMP_PDEp/ePDE_p /kinetics/AC/AMP MM_PRD pA
addmsg /kinetics/PDE/cAMP_PDEp /kinetics/PDE/cAMP_PDEp/ePDE_p ENZYME n
addmsg /kinetics/PDE/cAMP_PDEp/ePDE_p /kinetics/PDE/cAMP_PDEp REAC eA B
addmsg /kinetics/AC/cAMP /kinetics/PDE/cAMP_PDE/ePDE SUBSTRATE n 
addmsg /kinetics/PDE/cAMP_PDE/ePDE /kinetics/AC/cAMP REAC sA B 
addmsg /kinetics/PDE/cAMP_PDE/ePDE /kinetics/AC/AMP MM_PRD pA
addmsg /kinetics/PDE/cAMP_PDE /kinetics/PDE/cAMP_PDE/ePDE ENZYME n
addmsg /kinetics/PDE/cAMP_PDE/ePDE /kinetics/PDE/cAMP_PDE REAC eA B

enddump
 // End of dump
call /kinetics/CaM/CaM/notes LOAD \
"There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al) Say 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying it is comparable to CaMK levels."
call /kinetics/CaM/neurogranin_p/notes LOAD \
"The phosph form does not bind CaM (Huang et al ABB 305:2 570-580 1993)"
call /kinetics/CaM/neurogranin/notes LOAD \
"Also known as RC3 and p17 and BICKS. Conc in brain >> 2 uM from Martzen and Slemmon J neurosci 64 92-100 1995 but others say less without any #s. Conc in dend spines is much higher than overall, so it could be anywhere from 2 uM to 50. We will estimate 10 uM as a starting point. Gerendasy et al JBC 269:35 22420-22426 1994 have a skeleton model (no numbers) indicating CaM-Ca(n) binding ...."
call /kinetics/CaM/CaM_Ca2/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has bound the Ca but the TR1 end has not."
call /kinetics/CaM/CaM_Ca/notes LOAD \
"This is the intermediate where the TR2 end (the high-affinity end) has bound the Ca but the TR1 end has not."
call /kinetics/PKA/R2C2/notes LOAD \
"This is the R2C2 complex, consisting of 2 catalytic (C) subunits, and the R-dimer. See Taylor et al Ann Rev Biochem 1990 59:971-1005 for a review. The Doskeland and Ogreid review is better for numbers. Amount of PKA is about .5 uM."
call /kinetics/PKA/R2C2_cAMP/notes LOAD \
"CoInit was .0624"
call /kinetics/PKA/R2_cAMP4/notes LOAD \
"Starts at 0.15 for the test of fig 6 in Smith et al, but we aren't using that paper any more."
call /kinetics/PKA/PKA_inhibitor/notes LOAD \
"About 25% of PKA C subunit is dissociated in resting cells without having any noticable activity. Doskeland and Ogreid Int J biochem 13 pp1-19 suggest that this is because there is a corresponding amount of inhibitor protein."
call /kinetics/AC/cAMP/notes LOAD \
"The conc of this has been a problem. Schaecter and Benowitz use 50 uM, but Shinomura et al have < 5. So I have altered the cAMP-dependent rates in the PKA model to reflect this."
call /kinetics/AC/ATP/notes LOAD \
"ATP is present in all cells between 2 and 10 mM. See Lehninger."
call /kinetics/AC/AC1_CaM/notes LOAD \
"This version of cyclase is Calmodulin activated. Gs stims it but betagamma inhibits."
call /kinetics/AC/AC1/notes LOAD \
"Starting conc at 20 nM."
call /kinetics/AC/AC2p/notes LOAD \
"This version is activated by Gs and by a betagamma and phosphorylation."
call /kinetics/AC/AC2/notes LOAD \
"Starting at 0.015 uM."
call /kinetics/PDE/PDE1/notes LOAD \
"CaM-Dependent PDE. Amount calculated from total rate in brain vs. specific rate."
call /kinetics/PDE/CaM_PDE1/notes LOAD \
"Activity up 6x following Ca-CaM binding."
call /kinetics/PDE/cAMP_PDEp/notes LOAD \
"This form has about 2X activity as plain PDE. See Sette et al JBC 269:28 18271-18274 1994."
call /kinetics/PDE/cAMP_PDE/notes LOAD \
"The levels of the PDE are not known at this time. However, enough kinetic info and info about steady-state levels of cAMP etc are around to make it possible to estimate this."
call /kinetics/CaM/CaM_Ca3_bind_Ca/notes LOAD \
"Use K3 = 21.5 uM here from Stemmer and Klee table 3. kb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10"
call /kinetics/CaM/neurogranin_bind_CaM/notes LOAD \
"Surprisingly, no direct info on rates from neurogranin at this time. These rates are based on GAP-43 binding studies. As GAP-43 and neurogranin share near identity in the CaM/PKC binding regions, and also similarity in phosph and dephosph rates, I am borrowing GAP-43 kinetic info. See Alexander et al JBC 262:13 6108-6113 1987"
call /kinetics/CaM/dephosph_neurogranin/notes LOAD \
"This is put in to keep the basal levels of neurogranin* experimentally reasonable. From various papers, specially Ramakers et al JBC 270:23 1995 13892-13898, it looks like the basal level of phosph is between 20 and 40%. I est around 25 % The kf of 0.005 gives around this level at basal PKC activity levels of 0.1 uM active PKC."
call /kinetics/CaM/CaM_bind_Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not sure whether the order is relevant. These correspond to the TR2C fragment. We use the Martin et al rates here, plus the Drabicowski binding consts. All are scaled by 3X to cell temp. kf = 2e-10 kb = 72 Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11. If kb=72, kf = 2e-10 (Exactly the same !) 19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into two steps, each binding 1 Ca. This improves numerical stability and is conceptually better too. Overall rates are the same, so each kf and kb is the square root of the earlier ones. So kf = 1.125e-4, kb = 8.4853"
call /kinetics/CaM/CaM_Ca2_bind_Ca/notes LOAD \
"K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get kb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10"
call /kinetics/CaM/CaM_Ca_bind_Ca/notes LOAD \
"Lets use the fast rate consts here. Since the rates are so different, I am not sure whether the order is relevant. These correspond to the TR2C fragment. We use the Martin et al rates here, plus the Drabicowski binding consts. All are scaled by 3X to cell temp. kf = 2e-10 kb = 72 Stemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11. If kb=72, kf = 2e-10 (Exactly the same !) 19 May 2006. Splitting the old CaM-TR2-bind-Ca reaction into two steps, each binding 1 Ca. This improves numerical stability and is conceptually better too. Overall rates are the same, so each kf and kb is the square root of the earlier ones. So kf = 1.125e-4, kb = 8.4853"
call /kinetics/PKA/cAMP_bind_site_B1/notes LOAD \
"Hasler et al FASEB J 6:2734-2741 1992 say Kd =1e-7M for type II, 5.6e-8 M for type I. Take mean which comes to 2e-13 #/cell Smith et al PNAS USA 78:3 1591-1595 1981 have better data. First kf/kb=2.1e7/M = 3.5e-5 (#/cell). Ogreid and Doskeland Febs Lett 129:2 287-292 1981 have figs suggesting time course of complete assoc is < 1 min."
call /kinetics/PKA/cAMP_bind_site_B2/notes LOAD \
"For now let us set this to the same Km (1e-7M) as site B. This gives kf/kb = .7e-7M * 1e6 / (6e5^2) : 1/(6e5^2) = 2e-13:2.77e-12 Smith et al have better values. They say that this is cooperative, so the consts are now kf/kb =8.3e-4"
call /kinetics/PKA/Release_C1/notes LOAD \
"This has to be fast, as the activation of PKA by cAMP is also fast. kf was 10"
call /kinetics/PKA/inhib_PKA/notes LOAD \
"This has to be set to zero for matching the expts in vitro. In vivo we need to consider the inhibition though. kf = 1e-5 kb = 1"
call /kinetics/AC/CaM_bind_AC1/notes LOAD \
"Half-max at 20 nM CaM (Tang et al JBC 266:13 8595-8603 1991 kb/kf = 20 nM = 12000 #/cell so kf = kb/12000 = kb * 8.333e-5"
call /kinetics/AC/dephosph_AC2/notes LOAD \
"Random rate."
call /kinetics/AC/Gs_bind_AC2/notes LOAD \
"Half-max at around 3nM = kb/kf from fig 5 in Feinstein et al PNAS USA 88 10173-10177 1991 kf = kb/1800 = 5.56e-4 kb Ofer's thesis data indicates it is more like 2 nM. kf = kb/1200 = 8.33e-4"
call /kinetics/AC/Gs_bind_AC1/notes LOAD \
"Half-max 8nM from Tang et al JBC266:13 8595-8603 kb/kf = 8 nM = 4800#/cell so kf = kb * 2.08e-4"
call /kinetics/AC/Gs_bind_AC2p/notes LOAD \
"kb/kf = 1.2 nM so kf = kb/720 = 1.3888 * kb."
call /kinetics/PDE/dephosph_PDE/notes LOAD \
"The rates for this are poorly constrained. In adipocytes (probably a different PDE) the dephosphorylation is complete within 15 min, but there are no intermediate time points so it could be much faster. Identity of phosphatase etc is still unknown."
call /kinetics/PDE/CaM_bind_PDE1/notes LOAD \
"For olf epi PDE1, affinity is 7 nM. Assume same for brain. Reaction should be pretty fast. Assume kb = 5/sec. Then kf = 5 / (0.007 * 6e5) = 1.2e-3"
call /kinetics/PKA/PKA_active/phosph_PDE/notes LOAD \
"Same rates as PKA-phosph-I1"
call /kinetics/AC/AC2p/AC2p_form_cAMP/notes LOAD \
"Reduced Km to match expt data for basal activation of AC2 by PKC. Now k1 = 2.9e-6, k2 = 72, k3 = 18"
call /kinetics/PDE/PDE1/PDE1/notes LOAD \
"Rate is 1/6 of the CaM stim form. We'll just reduce all lf k1, k2, k3 so that the Vmax goes down 1/6."
call /kinetics/PDE/CaM_PDE1/CaM_PDE1/notes LOAD \
"Max activity ~10umol/min/mg in presence of lots of CaM. Affinity is low, 40 uM. k3 = 10, k2 = 40, k1 = (50/40) / 6e5."
call /kinetics/PDE/cAMP_PDEp/ePDE_p/notes LOAD \
"This form has about twice the activity of the unphosphorylated form. See Sette et al JBC 269:28 18271-18274 1994. We'll ignore cGMP effects for now."
call /kinetics/PDE/cAMP_PDE/ePDE/notes LOAD \
"Best rates are from Conti et al Biochem 34 7979-7987 1995. Though these are for the Sertoli cell form, it looks like they carry nicely into alternatively spliced brain form. See Sette et al JBC 269:28 18271-18274 Km ~2 uM, Vmax est ~ 10 umol/min/mg for pure form. Brain protein is 93 kD but this was 67. So k3 ~10, k2 ~40, k1 ~4.2e-6"
complete_loading
