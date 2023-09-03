M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.13.0 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
G28 W ; home all without mesh bed level

M83 ; set to relative
G1 E-3 F900 ; retract 3mm at 15mm/sec

;//Nozzle Clean Mode Start
G1 Z25  F720 ;move head into Z-position
G1 Y-3 F1000 ;move head into Y-position
G1 X220 F1000 ;move head into X-position
G4 S5; will wait for 5 seconds for filament to rinse
G1 X240 F1000 ;move head into X-position
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G4 S5; will wait for 5 seconds for filament to rinse
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X250 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 X240 F500 ;swipe head over Prusa Automatic Nozzle Cleaner
G1 E-2 F900 ; retract 2mm at 15mm/sec
G1 X0 F1000 ;move head into home X-position
G1 Y0 F1000 ;move head into home Y-position
;//Nozzle Clean Mode End

G80 ; mesh bed leveling
{if filament_settings_id[initial_tool]=~/.*Prusament PA11.*/}
G1 Z0.3 F720
G1 Y-3 F1000 ; go outside print area
G92 E0
G1 X60 E9 F1000 ; intro line
G1 X100 E9 F1000 ; intro line
{else}
G1 Z0.2 F720
G1 Y-3 F1000 ; go outside print area
G92 E0
G1 X60 E9 F1000 ; intro line
G1 X100 E12.5 F1000 ; intro line
{endif}
G92 E0
M221 S{if layer_height<0.075}100{else}95{endif}

; Don't change E values below. Excessive value can damage the printer.
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3).*/}M907 E430 ; set extruder motor current{endif}
{if print_settings_id=~/.*(SPEED @MK3|DRAFT @MK3).*/}M907 E538 ; set extruder motor current{endif}
