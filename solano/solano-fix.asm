; better internal title
org $80FFC0
	db "SOLANO SOCCER 99     "

; restore original code, bypass copy protection routines
org $A491E7
	lda $81E730, x