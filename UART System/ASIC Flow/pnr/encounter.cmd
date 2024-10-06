#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Thu Sep 21 06:02:23 2023                #
#                                                     #
#######################################################

#@(#)CDS: First Encounter v08.10-p004_1 (32bit) 11/04/2008 14:34 (Linux 2.6)
#@(#)CDS: NanoRoute v08.10-p008 NR081027-0018/USR58-UB (database version 2.30, 67.1.1) {superthreading v1.11}
#@(#)CDS: CeltIC v08.10-p002_1 (32bit) 10/23/2008 22:04:14 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CTE v08.10-p016_1 (32bit) Oct 26 2008 15:11:51 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CPE v08.10-p009

setUIVar rda_Input ui_topcell SYS_TOP
setUIVar rda_Input ui_netlist /home/ahesham/Projects/System_pnr/DFT/netlists/SYS_TOP.v
setUIVar rda_Input ui_timelib,min /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib
setUIVar rda_Input ui_timelib,max /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib
setUIVar rda_Input ui_timelib /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib
setUIVar rda_Input ui_leffile {/home/ahesham/Projects/System_pnr/std_cells/lef/tsmc13fsg_7lm_tech.lef /home/ahesham/Projects/System_pnr/std_cells/lef/tsmc13_m_macros.lef /home/ahesham/Projects/System_pnr/pnr/import/SYS_TOP.lef}
setUIVar rda_Input ui_captbl_file /home/ahesham/Projects/System_pnr/std_cells/captables/tsmc13fsg.capTbl
setUIVar rda_Input ui_timingcon_file /home/ahesham/Projects/System_pnr/DFT/sdc/SYS_TOP.sdc
setUIVar rda_Input ui_pwrnet VDD
setUIVar rda_Input ui_gndnet VSS
commitConfig
create_library_set -name min_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib"
create_library_set -name max_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib"
create_library_set -name typ_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"
create_constraint_mode -name func_mode -sdc_files {../DFT/sdc/SYS_TOP_func.sdc}
create_constraint_mode -name scan_mode -sdc_files {../DFT/sdc/SYS_TOP_scan.sdc}
create_constraint_mode -name capture_mode -sdc_files {../DFT/sdc/SYS_TOP_capture.sdc}
create_rc_corner -name RCcorner -cap_table "../std_cells/captables/tsmc13fsg.capTbl"
create_delay_corner -name min_corner -library_set min_library -rc_corner RCcorner
create_delay_corner -name max_corner -library_set max_library -rc_corner RCcorner
create_analysis_view -name setup1_analysis_view -delay_corner max_corner -constraint_mode func_mode
create_analysis_view -name hold1_analysis_view  -delay_corner min_corner -constraint_mode func_mode
create_analysis_view -name setup2_analysis_view -delay_corner max_corner -constraint_mode capture_mode
create_analysis_view -name hold2_analysis_view  -delay_corner min_corner -constraint_mode capture_mode
create_analysis_view -name setup3_analysis_view -delay_corner max_corner -constraint_mode scan_mode
create_analysis_view -name hold3_analysis_view  -delay_corner min_corner -constraint_mode scan_mode
set_analysis_view -setup {setup1_analysis_view setup2_analysis_view setup3_analysis_view } \
                  -hold { hold1_analysis_view hold2_analysis_view hold3_analysis_view}
floorPlan -d 240.47 160.47 6.0 6.0 6.0 6.0
clearDrc
windowSelect -11.181 127.540 26.663 102.138
zoomBox -16.883 128.317 13.703 99.027
deselectAll
zoomBox -4.644 122.124 4.990 117.779
zoomBox -0.522 120.484 0.960 119.169
zoomBox 225.731 105.767 251.132 69.219
addRing -spacing_bottom 0.5 -width_left 2 -width_bottom 2 -width_top 2 -spacing_top 0.5 -layer_bottom METAL5 -center 1 -stacked_via_top_layer METAL7 -width_right 2 -around core -jog_distance 0.205 -offset_bottom 0.205 -layer_top METAL5 -threshold 0.205 -offset_left 0.205 -spacing_right 0.5 -spacing_left 0.5 -offset_right 0.205 -offset_top 0.205 -layer_right METAL6 -nets {VSS VDD } -stacked_via_bottom_layer METAL1 -layer_left METAL6
zoomBox 226.768 106.026 248.281 88.919
zoomBox 233.128 101.052 242.096 95.174
zoomBox 223.398 128.317 254.502 76.995
zoomBox 221.542 119.349 256.962 92.143
addStripe -block_ring_top_layer_limit METAL3 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit METAL1 -set_to_set_distance 60 -stacked_via_top_layer METAL7 -padcore_ring_top_layer_limit METAL3 -spacing 0.5 -merge_stripes_value 0.205 -layer METAL2 -block_ring_bottom_layer_limit METAL1 -width 1 -nets {VSS VDD } -stacked_via_bottom_layer METAL1
zoomBox -6.515 161.495 31.588 116.394
zoomBox -7.862 157.389 19.226 145.799
selectWire 6.1500 3.3250 7.1500 156.2450 2 VSS
selectWire 7.6500 0.8250 8.6500 158.7450 2 VDD
deleteSelectedFromFPlan
addStripe -block_ring_top_layer_limit METAL7 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit METAL5 -set_to_set_distance 60 -stacked_via_top_layer METAL7 -padcore_ring_top_layer_limit METAL7 -spacing 0.5 -merge_stripes_value 0.205 -layer METAL6 -block_ring_bottom_layer_limit METAL5 -width 1 -nets {VSS VDD } -stacked_via_bottom_layer METAL1
zoomBox 53.879 145.166 80.837 113.802
zoomBox 60.358 137.935 68.141 133.100
selectWire 66.1500 3.3250 67.1500 156.2450 6 VSS
undo
selectWire 66.1500 3.3250 67.1500 156.2450 2 VSS
selectWire 67.6500 0.8250 68.6500 158.7450 2 VDD
deleteSelectedFromFPlan
zoomBox 109.608 125.207 209.660 83.216
selectWire 186.1500 3.3250 187.1500 156.2450 2 VSS
selectWire 187.6500 0.8250 188.6500 158.7450 2 VDD
selectWire 126.1500 3.3250 127.1500 156.2450 2 VSS
selectWire 127.6500 0.8250 128.6500 158.7450 2 VDD
deleteSelectedFromFPlan
addStripe -block_ring_top_layer_limit METAL7 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit METAL5 -set_to_set_distance 60 -stacked_via_top_layer METAL7 -padcore_ring_top_layer_limit METAL7 -spacing 0.5 -merge_stripes_value 0.205 -layer METAL6 -block_ring_bottom_layer_limit METAL5 -width 1 -nets {VSS VDD } -stacked_via_bottom_layer METAL1
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { 1 6 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 7 -crossoverViaTopLayer 7 -targetViaBottomLayer 1 -nets { VSS VDD }
zoomBox -14.032 153.459 49.214 120.023
selectWire 6.1500 3.3250 7.1500 156.2450 6 VSS
selectWire 7.6500 0.8250 8.6500 158.7450 6 VDD
deleteSelectedFromFPlan
verifyGeometry -noMinArea
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
saveFPlan /home/ahesham/Projects/System_pnr/pnr/SYS_TOP.fp
setDrawView fplan
windowSelect -12.268 106.695 -16.740 119.272
panPage -1 0
panPage 1 0
panPage 0 -1
panPage 0 1
zoomOut
zoomBox -16.579 164.840 38.736 120.803
uiSetTool move
zoomBox -16.883 164.606 22.256 118.208
selectObject Module U0_UART
zoomBox -45.508 162.062 38.807 94.127
zoomBox -37.360 164.864 44.288 40.447
setObjFPlanBox Module U0_UART 7.1235 93.225 95.5505 152.234
uiSetTool select
zoomBox -5.854 100.737 105.957 78.082
setLayerPreference allM1 -isVisible 0
zoomBox -18.439 118.468 111.422 76.477
uiSetTool move
setObjFPlanBox Module U0_UART 6.970 89.445 95.530 152.520
uiSetTool select
deselectAll
selectObject Module U0_UART
deselectAll
selectObject Module U0_UART
placeDesign -inPlaceOpt -prePlaceOpt
addTieHiLo -cell TIELOM -prefix LTIE
addTieHiLo -cell TIEHIM -prefix HTIE
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
zoomBox 220.546 156.311 255.538 31.893
deselectAll
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setDrawView ameba
setDrawView place
setDrawView fplan
setDrawView ameba
setDrawView fplan
setDrawView ameba
setDrawView fplan
verifyGeometry -noMinArea
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
setDrawView ameba
setDrawView place
setDrawView fplan
clearClockDomains
setClockDomains -all
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_preCTS -outDir timingReports
optDesign -preCTS
setDrawView ameba
setDrawView place
clockDesign -genSpecOnly Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
clearClockDomains
setClockDomains -all
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix SYS_TOP_postCTS -outDir timingReports
optDesign -postCTS -hold
clearClockDomains
setClockDomains -all
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postCTS -outDir timingReports
refinePlace -preserveRouting
setNanoRouteMode -routeWithEco true
setNanoRouteMode -droutePostRouteSwapVia true
globalDetailRoute
setDrawView ameba
setDrawView fplan
setLayerPreference fence -isVisible 0
setLayerPreference hinst -isVisible 0
setDrawView place
setDrawView ameba
setDrawView fplan
setDrawView place
clearClockDomains
setClockDomains -all
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
addFiller -cell {FILL1M FILL2M FILL4M FILL8M FILL16M FILL32M FILL64M} -prefix FILLER -markFixed
clearClockDomains
setClockDomains -all
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
setDrawView ameba
setDrawView fplan
addFiller -cell {FILL1M FILL2M FILL4M FILL8M FILL16M FILL32M FILL64M} -prefix FILLER -markFixed
undo
undo
setDrawView ameba
setDrawView fplan
setLayerPreference fence -isVisible 1
setLayerPreference hinst -isVisible 1
windowSelect -37.842 109.137 -34.685 110.189
selectObject Module U0_UART
deselectAll
selectObject Module U0_UART
deselectAll
selectObject Module U0_UART
uiSetTool move
setObjFPlanBox Module U0_UART -107.892 110.0365 -19.465 169.0455
setObjFPlanBox Module U0_UART -131.8285 105.302 -43.4015 164.311
deselectAll
selectObject Module U0_UART_FIFO
setObjFPlanBox Module U0_UART_FIFO -74.5545 69.3965 9.7325 125.643
deselectAll
selectInst U0_UART/U0_UART_TX/U0_mux/OUT_reg
undo
undo
undo
checkFiller -highlight true
clearClockDomains
setClockDomains -all
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
checkFiller -highlight true
checkFiller -highlight true
saveNetlist export/SYS_TOP.v
saveNetlist export/SYS_TOP_pg.v -includePowerGround
rcOut -spf export/SYS_TOP.spf
delayCal -sdf export/SYS_TOP.sdf -version 3.0
report_power -outfile report/power.rpt
streamOut export/SYS_TOP.gds -mapFile ./import/gds2InLayer.map -libName DesignLib -stripes 1 -units 2000 -mode ALL
saveDesign /home/ahesham/Projects/System_pnr/pnr/SYS_TOP.enc
