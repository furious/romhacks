; better internal title
org $00FFC0
	db "LATIN AMERICA SOCCER"

; fix: restore original code
org $00B5AD : pea $0F00
org $00DA8E : jsr $B5AA
org $00DAB2 : jsr $B5AA
org $00DAD6 : jsr $B5AA
org $00DA46 : jsr $B5AA
org $00DA6A
	jsr $B5AA
  	lda #$C41F
  	sta $00AC