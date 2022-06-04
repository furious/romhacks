; better internal title
org $80FFC0
	db "SUPER CAMPEONES 4    "

; restore original code, bypass copy protection routines
org $808006
	ldx #$1FFF

org $0A80C1
	pld : plp : rtl

org $0086F2
	jsl $00FF74