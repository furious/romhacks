; better internal title
org $80FFC0
	db "PERFECT ELEVEN CB2  "

org $80FF93
	jml $B4DCC0

; restore original code, bypass copy protection routines
;org $80A0B4
;	lda $820000, x
;
;org $8583A7
;	lda #$0000
;	tcd

org $818000
	pla
	jsl $85CEFE

; custom credits
org $35C3A7
	db "       CB2 - DUMP CREDITS:      "
drm1_check:
	db "    FURIOUS . CLE . REVENANT    "

org $35C8BF
drm2_check:
	db "     ITS FURIOUS ;)"

; custom drm
org $84FFC4
	lda drm1_check+5 : asl
	cmp #$A4AA : bne +
	lda drm1_check+8 : asl
	cmp #$AA9E : bne +
	lda $820000, x ; original code
	rtl
+	jml $8D8324


org $83FF82
	lda drm2_check+10 : asl
	cmp #$A4AA : bne +
	lda drm2_check+13 : asl
	cmp #$AA9E : bne +
	lda #$0000 : tcd ; original code
	rtl
+	jml $8D9343


; save routines restore
org $808000 : clc : xce : sei : cld 
org $808924 : sta $700000
org $808930 : mvn $70,$70
org $80AF60 : lda $700000,X
org $80C6FB : lda #$70
org $80C7D2 : lda #$70
org $80E5C2 : lda $700000,X
org $80E613 : lda $700000,X
org $858CDE : lda $700000,X
org $858D19 : lda $700000,X
org $858D46 : lda $700004,X
org $858D58 : lda $700000,X
org $858D7F : lda $700000,X
org $858D90 : lda $700000,X
org $858DB3 : lda $700000,X
org $858DD4 : lda $700002,X
org $858E02 : lda $700004,X
org $858E4C : lda $700000,X
org $87EC8E : lda $700CEC
org $87EC95 : db $D0
org $87EC97 : lda $700CEA
org $87ECAD : mvn $70,$87
org $87ECB6 : sta $700CEA
org $87ECBD : sta $700CEC
org $87ECCD : lda $700000,X
org $87ECDE : lda $700100,X
org $87ECE9 : mvn $70,$7E
org $87ECF5 : sta $700CEA
org $87ED04 : mvn $70,$70
org $87ED10 : mvn $70,$70
org $87ED1C : mvn $70,$70
org $87ED28 : mvn $70,$70
org $87ED34 : mvn $70,$70
org $87ED40 : mvn $70,$70
org $87ED4C : mvn $70,$70
org $87ED58 : mvn $70,$70
org $87ED64 : mvn $70,$70
org $87ED70 : mvn $70,$70
org $87ED7C : mvn $70,$70
org $87ED88 : mvn $70,$70
org $87ED94 : mvn $70,$70
org $87EDA0 : mvn $70,$70
org $87EDAC : mvn $70,$70
org $87EDC5 : lda $700100,X
org $87EDD0 : mvn $7E,$70
org $87EDEB : lda $70046E,X
org $87EDFA : lda $700000,X
org $87EE70 : sta $700000,X
org $87EE77 : sta $700002,X
org $87EE7E : sta $700004,X
org $87EE8F : mvn $70,$7E
org $87EEA4 : mvn $70,$80
org $87EEB6 : mvn $70,$7E
org $87EEC8 : mvn $70,$7E
org $87EEDA : mvn $70,$7E
org $87EEE7 : sta $700000,X
org $87EEFC : mvn $70,$7E
org $87EF0E : mvn $70,$7E
org $87EF20 : mvn $70,$7E
org $87EF2D : sta $700000,X
org $87EF42 : mvn $70,$7E
org $87EF54 : mvn $70,$7E
org $87EF66 : mvn $70,$7E
org $87EF73 : sta $700000,X
org $87EF8A : sta $700000,X
org $87EF9D : sta $700000,X
org $87EFA6 : sta $700000,X
org $87EFAF : sta $700000,X
org $87EFC0 : lda $700000,X
org $87EFD1 : lda $700000,X
org $87EFDA : lda $700000,X
org $87EFE3 : lda $700000,X
org $87F000 : lda $700000,X
org $87F013 : lda $700000,X
org $87F01A : lda $700002,X
org $87F021 : lda $700004,X
org $87F035 : mvn $7E,$70
org $87F045 : mvn $80,$70
org $87F057 : mvn $7E,$70
org $87F06E : mvn $7E,$70
org $87F085 : mvn $7E,$70
org $87F097 : mvn $7E,$70
org $87F0A9 : mvn $7E,$70
org $87F0B3 : lda $700000,X

; ascii text menu table
'A' = $0
'B' = $2
'C' = $4
'D' = $6
'E' = $8
'G' = $a
'H' = $c
'I' = $e
'L' = $20
'M' = $22
'N' = $24
'O' = $26
'P' = $28
'Q' = $2a
'R' = $2c
'S' = $2e
'T' = $40
'U' = $42
'X' = $44
; restore main menu
org $84CB58 : lda #$10
org $84CB65 : cmp #$11
org $81E088 : dw $BDD9
; reposition options and restore load saves
org $879BE4 : dw txt_load
org $88C1B3
	db $05
	db $42, $a9, 'O', $1d
	db $42, $b9, 'P', $1d
	db $42, $c9, 'C', $1d
	db $42, $d9, 'A', $1d
	db $42, $e9, 'O', $1d
txt_load:
	db $04
	db $2b, $a9, 'L', $1d
	db $2b, $b9, 'O', $1d
	db $2b, $c9, 'A', $1d
	db $2b, $d9, 'D', $1d


; txt window

org $829166
	db $10, $10, $10, $10, $10, $10