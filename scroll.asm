; assembler: http://dasm-dillon.sourceforge.net/
; compile command line:
; dasm test.asm -otest.prg
; load in VICE with file->autostart disk/tape image
; then start with "SYS 32769"

  processor 6502
  .org $801

; BASIC header
; 0sys2061
  .hex 0c08 0000 9e32 3036 3100 0000

; zeropage config
rastpos = $10 ; (w)
     
direct = $11; (w) 

         sei              ;disable interrupts


; main     lda #$00         ;load $00 into A
;         sta $d011        ;turn off screen. (now you have only borders!)
;         sta $d020        ;make border black.



          ldx #$00       ; reg x = 0
loop:     lda message,x	 ; ladda in data från position x från messafe och lägg i reg A
          jsr $ffd2  ;sta $0400,x    ; store A into adress $0400 + X .. so, 400,401,402..etc when X increases..
          inx            ; x++
          cpx #$0c       ; compare X with $d, which is = 13 since "hello woorld!" is 13 chars
          bne loop       ; if its not equal, then its not finished ..so goto loop..
          rts            ; behövs ?? slutar iaf..		  
		 

		 
message .byte "HELLO WORLD!"

	