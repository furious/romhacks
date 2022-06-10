norom
; fix: remove extra internal header
org $007FB0
	padbyte $FF : pad $008000

hirom
; better internal title
org $00FFC0
	db "CONTRA 98            "

; custom debug routine (disabled)
org $00FFE6
	dw $E28B ;debug_routine
;org $00FFA0
;debug_routine:
;	jml $08f384

; fix: rom mapping
org $00FFD5
	db $21 ; hirom

; fix: get up to 50 lives
org $00B85E
	cmp.w #50 : bcc +
	lda.w #50
+

; fix: starting lives options
org $00BB54
	cmp.w #3 : beq +
	iny
	cmp.w #30 : beq +
	iny
	cmp.w #50 : beq +
	iny
+
org $0588FB ; lives options table
	dw #3, #30, #50