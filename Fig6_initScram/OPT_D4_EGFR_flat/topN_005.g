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
DEFAULT_VOL = 1.1004961746124992e-15
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
simundump geometry /kinetics/geometry 0 1.1004961746124992e-15 3 sphere  "" white black 63 114 0
simundump group /kinetics/Sos 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 60 114 0
simundump group /kinetics/MAPK 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 60 114 0
simundump group /kinetics/Ras 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 60 114 0
simundump group /kinetics/EGFR 0 blue green x 0 0 "" defaultfile \
  defaultfile.g 0 0 0 60 114 0
simundump kpool /kinetics/Sos/Sos_p.Grb2 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange blue 76 105 0
simundump kpool /kinetics/Sos/Grb2 0 0.0 0 0 0 858183.3039771365 0 0 662734.3683725179 0 /kinetics/geometry orange blue 73 105 0
simundump kpool /kinetics/Sos/Sos.Grb2 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange blue 70 105 0
simundump kpool /kinetics/Sos/Sos_p 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry red blue 74 109 0
simundump kpool /kinetics/Sos/Sos 0 0.0 0 0 0 83777.00421698843 0 0 662734.3683725179 0 /kinetics/geometry red blue 72 109 0
simundump kpool /kinetics/Sos/Shc_p.Sos.Grb2 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry brown yellow 68 105 0
simundump kpool /kinetics/MAPK/craf_1 0 0.0 0 0 0 12887.636484861028 0 0 662734.3683725179 0 /kinetics/geometry pink brown 63 86 0
simundump kpool /kinetics/MAPK/MAPKK 0 0.0 0 0 0 37635.83920419521 0 0 662734.3683725179 0 /kinetics/geometry pink brown 64 82 0
simundump kpool /kinetics/MAPK/MAPK 0 0.0 0 0 0 203929.8086245764 0 0 662734.3683725179 0 /kinetics/geometry pink brown 67 78 0
simundump kpool /kinetics/MAPK/MAPK_tyr 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange brown 67 76 0
simundump kpool /kinetics/MAPK/MAPKK_p 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry pink brown 64 78 0
simundump kpool /kinetics/MAPK/MAPKK_ser 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry pink brown 64 80 0
simundump kpool /kinetics/MAPK/RGR 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry red brown 62 82 0
simundump kpool /kinetics/MAPK/MKP_2 0 0.0 0 0 0 712.7301032449969 0 0 662734.3683725179 0 /kinetics/geometry 4 black 70 76 0
simundump kpool /kinetics/MAPK/PPhosphatase2A 0 0.0 0 0 0 164017.1768393068 0 0 662734.3683725179 0 /kinetics/geometry hotpink yellow 68 80 0
simundump kpool /kinetics/MAPK/MAPK_p 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange yellow 67 74 0
simundump kpool /kinetics/Ras/GTP_Ras 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange blue 64 92 0
simundump kpool /kinetics/Ras/GDP_Ras 0 0.0 0 0 0 138138.44310385195 0 0 662734.3683725179 0 /kinetics/geometry pink blue 64 96 0
simundump kpool /kinetics/EGFR/SHC 0 0.0 0 0 0 319860.5608183337 0 0 662734.3683725179 0 /kinetics/geometry orange yellow 63 109 0
simundump kpool /kinetics/EGFR/SHC_p 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry orange yellow 65 109 0
simundump kpool /kinetics/EGFR/EGFR 0 0.0 0 0 0 205752.2978884219 0 0 662734.3683725179 0 /kinetics/geometry red yellow 59 113 0
simundump kpool /kinetics/EGFR/Internal_L_EGFR 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry red yellow 61 113 0
simundump kpool /kinetics/EGFR/EGF 0 0.0 0 0 0 22.896126112422824 0 0 662734.3683725179 4 /kinetics/geometry red yellow 59 109 0
simundump kpool /kinetics/EGFR/L_EGFR 0 0.0 0 0 0 0.0 0 0 662734.3683725179 0 /kinetics/geometry red yellow 61 109 0
simundump kreac /kinetics/Sos/Shc_bind_Sos.Grb2 0 0.00013630666772852443 16.43263018432146 "" white blue 69 107 0
simundump kreac /kinetics/Sos/Grb2_bind_Sos_p 0 4.5642549155314065e-08 0.04015132337055656 "" white blue 75 107 0
simundump kreac /kinetics/Sos/dephosph_Sos 0 0.01316750347578932 0.0 "" white blue 73 107 0
simundump kreac /kinetics/Sos/Grb2_bind_Sos 0 7.464098183777834e-07 0.5240496764817213 "" white blue 71 107 0
simundump kreac /kinetics/Ras/Ras_intrinsic_GTPase 0 0.040055065646494595 0.0 "" white blue 63 94 0
simundump kreac /kinetics/Ras/Ras_act_unphosph_raf 0 3.938317043827698e-06 2.1299803987966177 "" white black 62 84 0
simundump kreac /kinetics/Ras/basal_GEF 0 0.00228143742056026 0.0 "" white blue 67 94 0
simundump kreac /kinetics/EGFR/dephosph_Shc 0 0.02630645080981068 0.0 "" white yellow 64 107 0
simundump kreac /kinetics/EGFR/Internalize 0 3.851490462484372e-07 0.002349657787446318 "" white yellow 62 111 0
simundump kreac /kinetics/EGFR/act_EGFR 0 0.0001475557109160587 0.044632858868018634 "" white yellow 60 111 0
simundump kenz /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF 0 0 0 0.0 0 662734.3683725179 2.3899375778373292e-05 8.42985896528672 2.1075113594281976 0 0 "" brown red "" 65 94 0
simundump kenz /kinetics/MAPK/MAPKK_p/MAPKKtyr 0 0 0 0.0 0 662734.3683725179 1.081223519740695e-05 0.37831244995993313 0.09457763165359959 0 0 "" pink red "" 64 77 0
simundump kenz /kinetics/MAPK/MAPKK_p/MAPKKthr 0 0 0 0.0 0 662734.3683725179 1.161514900187375e-06 0.3729745039861657 0.09324509551863432 0 0 "" pink red "" 64 75 0
simundump kenz /kinetics/MAPK/RGR/RGR.1 0 0 0 0.0 0 662734.3683725179 2.107517108506579e-06 0.3971015274666227 0.09927538186665567 0 0 "" red red "" 62 81 0
simundump kenz /kinetics/MAPK/RGR/RGR.2 0 0 0 0.0 0 662734.3683725179 8.495405322854133e-07 0.3631871074321427 0.09079677685803568 0 0 "" red red "" 62 79 0
simundump kenz /kinetics/MAPK/MKP_2/MKP2_tyr_deph 0 0 0 0.0 0 662734.3683725179 3.89873626084267e-06 0.34558003230668216 0.08639018288772463 0 0 "" 4 red "" 70 77 0
simundump kenz /kinetics/MAPK/MKP_2/MKP2_thr_deph 0 0 0 0.0 0 662734.3683725179 2.6840680658091773e-05 0.4104892718112598 0.10262817957314643 0 0 "" 4 red "" 70 75 0
simundump kenz /kinetics/MAPK/PPhosphatase2A/MAPKK_deph 0 0 0 0.0 0 662734.3683725179 6.393619855737044e-07 1.9586327558919516 0.47007186141406837 0 0 "" hotpink red "" 68 79 0
simundump kenz /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser 0 0 0 0.0 0 662734.3683725179 8.87163469841827e-08 1.2589278186407913 0.30213532507046936 0 0 "" hotpink red "" 68 81 0
simundump kenz /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos 0 0 0 0.0 0 662734.3683725179 7.791643248152565e-07 4.701091290225129 1.1752728225562823 0 0 "" orange red "" 73 111 0
simundump kenz /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 0 0 0 0.0 0 662734.3683725179 4.961417144036292e-07 7.0080620098610416 1.7520155024652604 0 0 "" red orange "" 67 102 0
simundump kenz /kinetics/EGFR/L_EGFR/phosph_Shc 0 0 0 0.0 0 662734.3683725179 1.9259128568698437e-06 1.1615786796171652 0.2903946699042913 0 0 "" red red "" 64 111 0
simundump xgraph /graphs/conc1 0 0 99 0.001 0.999 0
simundump xgraph /graphs/conc2 0 0 100 0 1 0
 simundump xplot /graphs/conc1/MAPK_p.Co 3 524288 \
"delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xplot /graphs/conc1/Internal_L_EGFR.Co 3 524288 \
"delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xplot /graphs/conc2/GTP_Ras.Co 3 524288 \
"delete_plot.w <s> <d>; edit_plot.D <w>" blue 0 0 1
simundump xplot /graphs/conc2/Shc_p.Sos.Grb2.Co 3 524288 \
"delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xplot /graphs/conc2/L_EGFR.Co 3 524288 \
"delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xgraph /moregraphs/conc3 0 0 100 0 1 0
simundump xgraph /moregraphs/conc4 0 0 100 0 1 0
 simundump xcoredraw /edit/draw 0 -6 4 -2 6
simundump xtree /edit/draw/tree 0 \
  /kinetics/#[],/kinetics/#[]/#[],/kinetics/#[]/#[]/#[][TYPE!=proto],/kinetics/#[]/#[]/#[][TYPE!=linkinfo]/##[] "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
simundump xtext /file/notes 0 1
addmsg /kinetics/Sos/Sos.Grb2 /kinetics/Sos/Shc_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/Sos/Shc_bind_Sos.Grb2 /kinetics/Sos/Sos.Grb2 REAC A B 
addmsg /kinetics/EGFR/SHC_p /kinetics/Sos/Shc_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/Sos/Shc_bind_Sos.Grb2 /kinetics/EGFR/SHC_p REAC A B 
addmsg /kinetics/Sos/Shc_p.Sos.Grb2 /kinetics/Sos/Shc_bind_Sos.Grb2 PRODUCT n 
addmsg /kinetics/Sos/Shc_bind_Sos.Grb2 /kinetics/Sos/Shc_p.Sos.Grb2 REAC B A
addmsg /kinetics/Sos/Grb2 /kinetics/Sos/Grb2_bind_Sos_p SUBSTRATE n 
addmsg /kinetics/Sos/Grb2_bind_Sos_p /kinetics/Sos/Grb2 REAC A B 
addmsg /kinetics/Sos/Sos_p /kinetics/Sos/Grb2_bind_Sos_p SUBSTRATE n 
addmsg /kinetics/Sos/Grb2_bind_Sos_p /kinetics/Sos/Sos_p REAC A B 
addmsg /kinetics/Sos/Sos_p.Grb2 /kinetics/Sos/Grb2_bind_Sos_p PRODUCT n 
addmsg /kinetics/Sos/Grb2_bind_Sos_p /kinetics/Sos/Sos_p.Grb2 REAC B A
addmsg /kinetics/Sos/Sos_p /kinetics/Sos/dephosph_Sos SUBSTRATE n 
addmsg /kinetics/Sos/dephosph_Sos /kinetics/Sos/Sos_p REAC A B 
addmsg /kinetics/Sos/Sos /kinetics/Sos/dephosph_Sos PRODUCT n 
addmsg /kinetics/Sos/dephosph_Sos /kinetics/Sos/Sos REAC B A
addmsg /kinetics/Sos/Grb2 /kinetics/Sos/Grb2_bind_Sos SUBSTRATE n 
addmsg /kinetics/Sos/Grb2_bind_Sos /kinetics/Sos/Grb2 REAC A B 
addmsg /kinetics/Sos/Sos /kinetics/Sos/Grb2_bind_Sos SUBSTRATE n 
addmsg /kinetics/Sos/Grb2_bind_Sos /kinetics/Sos/Sos REAC A B 
addmsg /kinetics/Sos/Sos.Grb2 /kinetics/Sos/Grb2_bind_Sos PRODUCT n 
addmsg /kinetics/Sos/Grb2_bind_Sos /kinetics/Sos/Sos.Grb2 REAC B A
addmsg /kinetics/Ras/GTP_Ras /kinetics/Ras/Ras_intrinsic_GTPase SUBSTRATE n 
addmsg /kinetics/Ras/Ras_intrinsic_GTPase /kinetics/Ras/GTP_Ras REAC A B 
addmsg /kinetics/Ras/GDP_Ras /kinetics/Ras/Ras_intrinsic_GTPase PRODUCT n 
addmsg /kinetics/Ras/Ras_intrinsic_GTPase /kinetics/Ras/GDP_Ras REAC B A
addmsg /kinetics/MAPK/craf_1 /kinetics/Ras/Ras_act_unphosph_raf SUBSTRATE n 
addmsg /kinetics/Ras/Ras_act_unphosph_raf /kinetics/MAPK/craf_1 REAC A B 
addmsg /kinetics/Ras/GTP_Ras /kinetics/Ras/Ras_act_unphosph_raf SUBSTRATE n 
addmsg /kinetics/Ras/Ras_act_unphosph_raf /kinetics/Ras/GTP_Ras REAC A B 
addmsg /kinetics/MAPK/RGR /kinetics/Ras/Ras_act_unphosph_raf PRODUCT n 
addmsg /kinetics/Ras/Ras_act_unphosph_raf /kinetics/MAPK/RGR REAC B A
addmsg /kinetics/Ras/GDP_Ras /kinetics/Ras/basal_GEF SUBSTRATE n 
addmsg /kinetics/Ras/basal_GEF /kinetics/Ras/GDP_Ras REAC A B 
addmsg /kinetics/Ras/GTP_Ras /kinetics/Ras/basal_GEF PRODUCT n 
addmsg /kinetics/Ras/basal_GEF /kinetics/Ras/GTP_Ras REAC B A
addmsg /kinetics/EGFR/SHC_p /kinetics/EGFR/dephosph_Shc SUBSTRATE n 
addmsg /kinetics/EGFR/dephosph_Shc /kinetics/EGFR/SHC_p REAC A B 
addmsg /kinetics/EGFR/SHC /kinetics/EGFR/dephosph_Shc PRODUCT n 
addmsg /kinetics/EGFR/dephosph_Shc /kinetics/EGFR/SHC REAC B A
addmsg /kinetics/EGFR/L_EGFR /kinetics/EGFR/Internalize SUBSTRATE n 
addmsg /kinetics/EGFR/Internalize /kinetics/EGFR/L_EGFR REAC A B 
addmsg /kinetics/EGFR/L_EGFR /kinetics/EGFR/Internalize SUBSTRATE n 
addmsg /kinetics/EGFR/Internalize /kinetics/EGFR/L_EGFR REAC A B 
addmsg /kinetics/EGFR/Internal_L_EGFR /kinetics/EGFR/Internalize PRODUCT n 
addmsg /kinetics/EGFR/Internalize /kinetics/EGFR/Internal_L_EGFR REAC B A
addmsg /kinetics/EGFR/EGFR /kinetics/EGFR/act_EGFR SUBSTRATE n 
addmsg /kinetics/EGFR/act_EGFR /kinetics/EGFR/EGFR REAC A B 
addmsg /kinetics/EGFR/EGF /kinetics/EGFR/act_EGFR SUBSTRATE n 
addmsg /kinetics/EGFR/act_EGFR /kinetics/EGFR/EGF REAC A B 
addmsg /kinetics/EGFR/L_EGFR /kinetics/EGFR/act_EGFR PRODUCT n 
addmsg /kinetics/EGFR/act_EGFR /kinetics/EGFR/L_EGFR REAC B A
addmsg /kinetics/Ras/GDP_Ras /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF SUBSTRATE n 
addmsg /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF /kinetics/Ras/GDP_Ras REAC sA B 
addmsg /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF /kinetics/Ras/GTP_Ras MM_PRD pA
addmsg /kinetics/Sos/Shc_p.Sos.Grb2 /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF ENZYME n
addmsg /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF /kinetics/Sos/Shc_p.Sos.Grb2 REAC eA B
addmsg /kinetics/MAPK/MAPK /kinetics/MAPK/MAPKK_p/MAPKKtyr SUBSTRATE n 
addmsg /kinetics/MAPK/MAPKK_p/MAPKKtyr /kinetics/MAPK/MAPK REAC sA B 
addmsg /kinetics/MAPK/MAPKK_p/MAPKKtyr /kinetics/MAPK/MAPK_tyr MM_PRD pA
addmsg /kinetics/MAPK/MAPKK_p /kinetics/MAPK/MAPKK_p/MAPKKtyr ENZYME n
addmsg /kinetics/MAPK/MAPKK_p/MAPKKtyr /kinetics/MAPK/MAPKK_p REAC eA B
addmsg /kinetics/MAPK/MAPK_tyr /kinetics/MAPK/MAPKK_p/MAPKKthr SUBSTRATE n 
addmsg /kinetics/MAPK/MAPKK_p/MAPKKthr /kinetics/MAPK/MAPK_tyr REAC sA B 
addmsg /kinetics/MAPK/MAPKK_p/MAPKKthr /kinetics/MAPK/MAPK_p MM_PRD pA
addmsg /kinetics/MAPK/MAPKK_p /kinetics/MAPK/MAPKK_p/MAPKKthr ENZYME n
addmsg /kinetics/MAPK/MAPKK_p/MAPKKthr /kinetics/MAPK/MAPKK_p REAC eA B
addmsg /kinetics/MAPK/MAPKK /kinetics/MAPK/RGR/RGR.1 SUBSTRATE n 
addmsg /kinetics/MAPK/RGR/RGR.1 /kinetics/MAPK/MAPKK REAC sA B 
addmsg /kinetics/MAPK/RGR/RGR.1 /kinetics/MAPK/MAPKK_ser MM_PRD pA
addmsg /kinetics/MAPK/RGR /kinetics/MAPK/RGR/RGR.1 ENZYME n
addmsg /kinetics/MAPK/RGR/RGR.1 /kinetics/MAPK/RGR REAC eA B
addmsg /kinetics/MAPK/MAPKK_ser /kinetics/MAPK/RGR/RGR.2 SUBSTRATE n 
addmsg /kinetics/MAPK/RGR/RGR.2 /kinetics/MAPK/MAPKK_ser REAC sA B 
addmsg /kinetics/MAPK/RGR/RGR.2 /kinetics/MAPK/MAPKK_p MM_PRD pA
addmsg /kinetics/MAPK/RGR /kinetics/MAPK/RGR/RGR.2 ENZYME n
addmsg /kinetics/MAPK/RGR/RGR.2 /kinetics/MAPK/RGR REAC eA B
addmsg /kinetics/MAPK/MAPK_tyr /kinetics/MAPK/MKP_2/MKP2_tyr_deph SUBSTRATE n 
addmsg /kinetics/MAPK/MKP_2/MKP2_tyr_deph /kinetics/MAPK/MAPK_tyr REAC sA B 
addmsg /kinetics/MAPK/MKP_2/MKP2_tyr_deph /kinetics/MAPK/MAPK MM_PRD pA
addmsg /kinetics/MAPK/MKP_2 /kinetics/MAPK/MKP_2/MKP2_tyr_deph ENZYME n
addmsg /kinetics/MAPK/MKP_2/MKP2_tyr_deph /kinetics/MAPK/MKP_2 REAC eA B
addmsg /kinetics/MAPK/MAPK_p /kinetics/MAPK/MKP_2/MKP2_thr_deph SUBSTRATE n 
addmsg /kinetics/MAPK/MKP_2/MKP2_thr_deph /kinetics/MAPK/MAPK_p REAC sA B 
addmsg /kinetics/MAPK/MKP_2/MKP2_thr_deph /kinetics/MAPK/MAPK_tyr MM_PRD pA
addmsg /kinetics/MAPK/MKP_2 /kinetics/MAPK/MKP_2/MKP2_thr_deph ENZYME n
addmsg /kinetics/MAPK/MKP_2/MKP2_thr_deph /kinetics/MAPK/MKP_2 REAC eA B
addmsg /kinetics/MAPK/MAPKK_p /kinetics/MAPK/PPhosphatase2A/MAPKK_deph SUBSTRATE n 
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph /kinetics/MAPK/MAPKK_p REAC sA B 
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph /kinetics/MAPK/MAPKK_ser MM_PRD pA
addmsg /kinetics/MAPK/PPhosphatase2A /kinetics/MAPK/PPhosphatase2A/MAPKK_deph ENZYME n
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph /kinetics/MAPK/PPhosphatase2A REAC eA B
addmsg /kinetics/MAPK/MAPKK_ser /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser SUBSTRATE n 
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser /kinetics/MAPK/MAPKK_ser REAC sA B 
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser /kinetics/MAPK/MAPKK MM_PRD pA
addmsg /kinetics/MAPK/PPhosphatase2A /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser ENZYME n
addmsg /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser /kinetics/MAPK/PPhosphatase2A REAC eA B
addmsg /kinetics/Sos/Sos /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos SUBSTRATE n 
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos /kinetics/Sos/Sos REAC sA B 
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos /kinetics/Sos/Sos_p MM_PRD pA
addmsg /kinetics/MAPK/MAPK_p /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos ENZYME n
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_Sos /kinetics/MAPK/MAPK_p REAC eA B
addmsg /kinetics/Sos/Shc_p.Sos.Grb2 /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 SUBSTRATE n 
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 /kinetics/Sos/Shc_p.Sos.Grb2 REAC sA B 
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 /kinetics/Sos/Sos_p.Grb2 MM_PRD pA
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 /kinetics/EGFR/SHC_p MM_PRD pA
addmsg /kinetics/MAPK/MAPK_p /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 ENZYME n
addmsg /kinetics/MAPK/MAPK_p/MAPK_phosph_SHC_p_Sos_Grb2 /kinetics/MAPK/MAPK_p REAC eA B
addmsg /kinetics/EGFR/SHC /kinetics/EGFR/L_EGFR/phosph_Shc SUBSTRATE n 
addmsg /kinetics/EGFR/L_EGFR/phosph_Shc /kinetics/EGFR/SHC REAC sA B 
addmsg /kinetics/EGFR/L_EGFR/phosph_Shc /kinetics/EGFR/SHC_p MM_PRD pA
addmsg /kinetics/EGFR/L_EGFR /kinetics/EGFR/L_EGFR/phosph_Shc ENZYME n
addmsg /kinetics/EGFR/L_EGFR/phosph_Shc /kinetics/EGFR/L_EGFR REAC eA B
addmsg /kinetics/MAPK/MAPK_p /graphs/conc1/MAPK_p.Co PLOT Co *MAPK_p *orange
addmsg /kinetics/EGFR/Internal_L_EGFR /graphs/conc1/Internal_L_EGFR.Co PLOT Co *Internal_L_EGFR *red
addmsg /kinetics/Ras/GTP_Ras /graphs/conc2/GTP_Ras.Co PLOT Co *GTP_Ras *orange
addmsg /kinetics/Sos/Shc_p.Sos.Grb2 /graphs/conc2/Shc_p.Sos.Grb2.Co PLOT Co *Shc_p.Sos.Grb2 *brown
addmsg /kinetics/EGFR/L_EGFR /graphs/conc2/L_EGFR.Co PLOT Co *L_EGFR *red

enddump
 // End of dump
call /kinetics/Sos/Sos_p.Grb2/notes LOAD \
"Inactive complex of Sos* with Grb2 due to phosphorylation of the Sos. See Porfiri and McCormick 1996 JBC 271(10):5871."
call /kinetics/Sos/Grb2/notes LOAD \
"There is probably a lot of it in the cell: it is also known as Ash (abundant src homology protein). Also Waters et al JBC 271:30 18224 1996 say that only a small fraction of cellular Grb is precipitated out when SoS is precipitated. As most of the Sos seems to be associated with Grb2, it would seem like there is a lot of the latter. Say 1 uM. This would comfortably saturate the SoS."
call /kinetics/Sos/Sos.Grb2/notes LOAD \
"For simplicity I treat the activation of Sos as involving a single complex comprising Sos, Grb2 and Shc*. This is reasonably documented: Sasaoka et al 1994 JBC 269(51):32621-5 Chook et al JBC 1996 271(48):30472"
call /kinetics/Sos/Sos_p/notes LOAD \
"Phosphorylated form of SoS. Nominally this is an inactivation step mediated by MAPK, see Profiri and McCormick 1996 JBC 271(10):5871. I have not put this inactivation in this pathway so this molecule currently only represents a potential interaction point."
call /kinetics/Sos/Sos/notes LOAD \
"I have tried using low (0.02 uM) initial concs, but these give a very flat response to EGF stim although the overall activation of Ras is not too bad. I am reverting to 0.1 because we expect a sharp initial response, followed by a decline."
call /kinetics/Sos/Shc_p.Sos.Grb2/notes LOAD \
"This three-way complex is one of the main GEFs for activating Ras."
call /kinetics/MAPK/craf_1/notes LOAD \
"Strom et al 1990 Oncogene 5 pp 345-51 report high general expression in all tissues. Huang and Ferrell 1996 PNAS 93(19):10078 use a value of 3 nM for oocytes. Here we stick with a much higher expression based on the Strom report."
call /kinetics/MAPK/MAPKK/notes LOAD \
"Conc is from Seger et al JBC 267:20 pp14373 (1992) mwt is 45/46 Kd We assume that phosphorylation on both ser and thr is needed for activiation. See Kyriakis et al Nature 358 417 1992 Init conc of total is 0.18"
call /kinetics/MAPK/MAPK/notes LOAD \
"Mol wt is 42 KDa. conc is from Sanghera et al JBC 265 pp 52 (1990) They estimate MAPK is 1e-4x total protein, and protein is 15% of cell wt, so MAPK is 1.5e-5g/ml = 0.36uM. Lets use this. Note though that Huang and Ferrell 1996 PNAS 93(19):10078 report 1.2 uM in oocytes. Also note that brain concs may be high. Ortiz et al 1995 J. Neurosci 15(2):1285-1297 report 0.3 ng/ug protein in Cingulate Gyrus and 1.2 ng/ug protein in nucleus accumbens. In hippocampus 270 ng/mg protein for ERK1 and 820 ng/mg protein for ERK 2. If 15% of cell weight is protein, that means that about 300 * 0.15 ng/ul is ERK 1. ie, 45e-9g/1e-6 litre = 45 mg/litre or about 1 uM. For non-neuronal tissues a lower value may be better."
call /kinetics/MAPK/MAPK_tyr/notes LOAD \
"Haystead et al FEBS Lett. 306(1) pp 17-22 show that phosphorylation is strictly sequential, first tyr185 then thr183."
call /kinetics/MAPK/MAPKK_p/notes LOAD \
"MAPKK phosphorylates MAPK on both the tyr and thr residues, first tyr then thr. Refs: Seger et al JBC267:20 pp 14373 1992 The MAPKK itself is phosphorylated on ser as well as thr residues. Let us assume that the ser goes first, and that the sequential phosphorylation is needed. See Kyriakis et al Nature 358 417-421 1992"
call /kinetics/MAPK/MAPKK_ser/notes LOAD \
"Intermediately phophorylated, assumed inactive, form of MAPKK"
call /kinetics/MAPK/RGR/notes LOAD \
"Shorthand name for Raf.GTP.Ras. This refers to the complex between GTP.Ras and the unphosphorylated Raf. I treat this as having the same enzyme activity as the Raf*.GTP.Ras form."
call /kinetics/MAPK/MKP_2/notes LOAD \
"MKP2 is modeled to act as a relatively steady, unregulated phosphatase for controlling MAPK activity. From Brondello et al JBC 272(2):1368-1376 (1997), the blockage of MKP-1 induction increases MAPK activity by no more than 2x. So this phosphatase will play the steady role and the fully stimulated MKP-1 can come up to the level of this steady level. From Chu et al 1995 JBC 271(11):6497-6501 it looks like both MKP-1 and MKP-2 have similar activities in dephosphorylating ERK2. So I use the same enzymatic rates for both. 31 Jan 2002: For the purposes of making a bistable model without the complications of MKP-1 induction, I simply set the initial conc of MKP-2 up by 0.0004 uM which was the starting level of MKP-1."
call /kinetics/MAPK/PPhosphatase2A/notes LOAD \
"Refs: Pato et al Biochem J 293:35-41(93); CoInit values span a range depending on source. Pato et al 1993 Biochem J 293:35-41 and Cohen et al 1988 Meth Enz 159:390-408 estimate 80 nM from muscle Zolneierowicz et al 1994 Biochem 33:11858-11867 report levels of 0.4 uM again from muscle, but expression is also strong in brain. Our estimate of 0.224 is between these two. There are many substrates for PP2A in this model, so I put the enzyme rate calculations here: Takai&Mieskes Biochem J 275:233-239 have mol wt 36 KDa. They report Vmax of 119 umol/min/mg i.e. 125/sec for k3 for pNPP substrate, Km of 16 mM. This is obviously unreasonable for protein substrates. For chicken gizzard myosin light chan, we have Vmax = 13 umol/min/mg or about k3 = 14/sec. Pato et al 1993 Biochem J 293:35-41 report caldesmon: Km = 2.2 uM, Vmax = 0.24 umol/min/mg. They do not think caldesmon is a good substrate. Calponin: Km = 14.3, Vmax = 5. Our values approximate these."
call /kinetics/MAPK/MAPK_p/notes LOAD \
"This molecule is phosphorylated on both the tyr and thr residues and is active: Seger et al 1992 JBC 267(20):14373 The rate consts are from two sources: Combine Sanghera et al JBC 265(1) :52-57 with Nemenoff et al JBC 93 pp 1960 to get k3 = 10, k2 = 40, k1 = 3.25e-6"
call /kinetics/Ras/GTP_Ras/notes LOAD \
"Only a very small fraction (7% unstim, 15% stim) of ras is GTP-bound. Gibbs et al JBC 265(33) 20437"
call /kinetics/Ras/GDP_Ras/notes LOAD \
"GDP bound form. See Rosen et al Neuron 12 1207-1221 June 1994. the activation loop is based on Boguski and McCormick Nature 366 643-654 93 Assume Ras is present at about the same level as craf-1, 0.2 uM. Hallberg et al JBC 269:6 3913-3916 1994 estimate upto 5-10% of cellular Raf is assoc with Ras. Given that only 5-10% of Ras is GTP-bound, we need similar amounts of Ras as Raf."
call /kinetics/EGFR/SHC/notes LOAD \
"There are 2 isoforms: 52 KDa and 46 KDa (See Okada et al JBC 270:35 pp 20737 1995). They are acted up on by the EGFR in very similar ways, and apparently both bind Grb2 similarly, so we'll bundle them together here. Sasaoka et al JBC 269:51 pp 32621 1994 show immunoprecs where it looks like there is at least as much Shc as Grb2. So we'll tentatively say there is 1 uM of Shc."
call /kinetics/EGFR/SHC_p/notes LOAD \
"Phosphorylated form of SHC. Binds to the SoS.Grb2 complex to give the activated GEF form upstream of Ras."
call /kinetics/EGFR/EGFR/notes LOAD \
"Berkers et al JBC 266 say 22K high affinity receptors per cell. Sherrill and Kyte Biochemistry 35 use range 4-200 nM. These values match reasonably. Heidaran et al 1993 JBC 268(13):9287-9295 use NIH3T3 cells and have 6.5e4 receptors/cell. This is also in the same general range. We use this last value because the cell type matches."
call /kinetics/EGFR/Internal_L_EGFR/notes LOAD \
"The internalized PDGFR is treated as a generic pool in equilibrium with the surface receptor. This simplifies the turnover processes but fits reasonably well with data."
call /kinetics/EGFR/EGF/notes LOAD \
"Platelet-derived growth factor. Heterodimer Mol wt. is approx 30 KDa Deuel et al 1985 Cancer Surv. 4(4):633-53 Conc of 50 ng/ml is close to saturating, and is used by P. Ram (personal communication). Other refs use 65 ng/ml Weise RJ et al 1995 JBC 270(7):3442-3446 A stimulus of 5 min is commonly used. Conversion factor: 1ng/ml = (1e-9/30K)* 1000 Moles/litre = 3e-11M = 3e-5 uM So 50 ng/ml ~ 1.5 nM."
call /kinetics/EGFR/L_EGFR/notes LOAD \
"This is terribly simplified: there are many interesting intermediate stages, including dimerization and assoc with adapter molecules like Shc, that contribute to the activation of the EGFR."
call /kinetics/Sos/Shc_bind_Sos.Grb2/notes LOAD \
"Sasaoka et al JBC 269:51 pp 32621 1994, table on pg 32623 indicates that this pathway accounts for about 50% of the GEF activation. (88% - 39%). Error is large, about 20%. Fig 1 is most useful in constraining rates. Chook et al JBC 271:48 pp 30472, 1996 say that the Kd is 0.2 uM for Shc binding to EGFR. The Kd for Grb direct binding is 0.7, so we'll ignore it."
call /kinetics/Sos/Grb2_bind_Sos_p/notes LOAD \
"Same rates as Grb2_bind_Sos: Porfiri and McCormick JBC 271:10 pp 5871 1996 show that the binding is not affected by the phosphorylation."
call /kinetics/Sos/dephosph_Sos/notes LOAD \
"The best clue I have to these rates is from the time courses of the EGF activation, which is around 1 to 5 min. The dephosph would be expected to be of the same order, perhaps a bit longer. Lets use 0.002 which is about 8 min. Sep 17: The transient activation curve matches better with kf = 0.001"
call /kinetics/Sos/Grb2_bind_Sos/notes LOAD \
"As there are 2 SH3 domains, this reaction could be 2nd order. I have a Kd of 22 uM from peptide binding (Lemmon et al JBC 269:50 pg 31653). However, Chook et al JBC 271:48 pg30472 say it is 0.4uM with purified proteins, so we believe them. They say it is 1:1 binding. Porfiri and McCormick JBC 271 also have related data. After comparing with the time-course of 1 min and the efficacy of activation of Ras, settle on Kd of 0.672 which is close to the Chook et al value."
call /kinetics/Ras/Ras_intrinsic_GTPase/notes LOAD \
"This is extremely slow (kf = 1e-4), but it is significant as so little GAP actually gets complexed with it that the total GTP turnover rises only by 2-3 X (see Gibbs et al, JBC 265(33) 20437-20422) and Eccleston et al JBC 268(36) 27012-27019 There is no back reaction as we assume this to be a regular irreversible Michaelis-Menten zeroth order hydrolysis."
call /kinetics/Ras/Ras_act_unphosph_raf/notes LOAD \
"Based on rates of Ras-act-craf which has Kf=60, Kb= 0.5. This reaction was introduced to account for the PKC-independent activation of MAPK. This reac should have less affinity but similar tau as compared to the Ras-cat-craf, since the phosphorylated Raf form has a greater effect on MAPK."
call /kinetics/Ras/basal_GEF/notes LOAD \
"This rate is based on the known ratio of GDP-Ras to GTP-Ras. Basal: Ras.GTP = 7% Stimulated 15% Time course is within 10 min, probably much faster as not all early data points are there. See Gibbs et al JBC 265(33):20437-20422"
call /kinetics/EGFR/dephosph_Shc/notes LOAD \
"Time course of decline of phosph is 20 min from Sasaoka et al 1994 JBC 269(51):32621. Part of this is the turnoff time of the EGFR itself. Lets assume a tau of 10 min for this dephosphorylation as a first pass. 27 Apr 2001: Dephosph too slow, shifts SHC balance over to phosphorylated form. Increase Kf to 0.01. This gives a reasonable overall time-course."
call /kinetics/EGFR/Internalize/notes LOAD \
"Original model derived from EGFR model. See Helin and Beguinot JBC 266:13 1991 pg 8363-8368. In Fig 3 they have internalization tau about 10 min, equil at about 20% EGF available. So kf = 4x kb, and 1/(kf + kb) = 600 sec so kb = 1/3K = 3.3e-4, and kf = 1.33e-3. This doesn't take into account the unbound receptor, so we need to push the kf up a bit, to 0.002 26 apr 2001: Keq too low for the PDGF model. Now Kf=0.001,Kb=0.00066 The previously calculated internalization equilibrium led to very high internalization which shifted the effective dependence of the receptor on PDGF so it looked like the receptor binding was higher affinity than experimentally determined. Used two constraining factors: 1. Time course of SHC phosphorylation/dephosphorylation which is fast on, but 10-20 minutes off. 2. Conc dependence of MAPK on PDGF has a halfmax around 3ng/ml. See Brondello et al 1997 JBC 272(2):1368-1376 and Brondello et al 1999 Science 286:2514-1517."
call /kinetics/EGFR/act_EGFR/notes LOAD \
"From Heidaran et al JBC268(13):9287 Fig 5. Kd is ~0.5 nM"
call /kinetics/Sos/Shc_p.Sos.Grb2/Sos.Ras_GEF/notes LOAD \
"Rates from Orita et al JBC 268(34):25542-25546"
call /kinetics/MAPK/MAPKK_p/MAPKKtyr/notes LOAD \
"The actual MAPKK is 2 forms from Seger et al JBC 267:20 14373(1992) Vmax = 150nmol/min/mg From Haystead et al FEBS 306(1):17-22 we get Km=46.6nM for at least one of the phosphs. Putting these together: k3=0.15/sec, ratio of 4 to get k2=0.6. k1=0.75/46.6nM=2.7e-5 In terms of Michaelis-Menten rates, Km = 0.046, Vmax = 0.15, ratio = 4."
call /kinetics/MAPK/MAPKK_p/MAPKKthr/notes LOAD \
"Rate consts same as for MAPKKtyr."
call /kinetics/MAPK/RGR/RGR.1/notes LOAD \
"Kinetics are the same as for the craf-1* activity, ie., k1=5.5e-6, k2=.42, k3 =0.105 These are based on Force et al PNAS USA 91 1270-1274 1994."
call /kinetics/MAPK/RGR/RGR.2/notes LOAD \
"Same kinetics as other c-raf activated forms. See Force et al PNAS 91 1270-1274 1994. k1 = 5.5e-6, k2 = .42, k3 = 0.105"
call /kinetics/MAPK/MKP_2/MKP2_tyr_deph/notes LOAD \
"22 Apr 2001: Based on MKP1 parms. The original kinetics have been modified to obey the k2 = 4 * k3 rule, while keeping kcat and Km fixed. The only constraining data point is the time course of MAPK dephosphorylation, which this model satisfies. The rates are treated as the same as for MKP-1, based on Chu et al 1995 JBC 271(11):6497-6501"
call /kinetics/MAPK/MKP_2/MKP2_thr_deph/notes LOAD \
"See MKP2-tyr-deph"
call /kinetics/MAPK/PPhosphatase2A/MAPKK_deph/notes LOAD \
"See: Kyriakis et al Nature 358 pp 417-421 1992 Ahn et al Curr Op Cell Biol 4:992-999 1992 for this pathway. See parent PPhosphatase2A for parms."
call /kinetics/MAPK/PPhosphatase2A/MAPKK_deph_ser/notes LOAD \
"See parent PPhostphatase2A description for rate details"
call /kinetics/EGFR/L_EGFR/phosph_Shc/notes LOAD \
"Rates from Okada et al JBC 270:35 pp 20737 1995 Km = 0.70 to 0.85 uM, Vmax = 4.4 to 5.0 pmol/min. Unfortunately the amount of enzyme is not known, the prep is only partially purified. Tau phosph is max within 30 sec, falls back within 20 min. Ref: Sasaoka et al JBC 269:51 32621 1994. Use k3 = 0.1 based on this tau. 27 Apr 2001: Lowered k3 to 0.05 to fix conc-effect of SHC phosph by PDGF. This gives results for downstream effects in agreement with other papers, e.g., the Brondello papers."
complete_loading
