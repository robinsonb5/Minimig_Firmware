	section .fixed_vectors

Start:
	move.l #stack_top,a7
	
	; clear bss */
	lea.l   __bss_start__,a0    
	move.l  #__bss_end__,d0
l1
	cmp.l   d0,a0
	bge	  l2
	clr.l   (a0)+
	bra.s   l1
l2
	; Startup code complete, hand control over to C code.
	pea 1
	pea	.name
	jsr main
.loop
	bra.s .loop

	; Set up interrupt vectors...
;	lea	.int1,a0
;	move.l	a0,$64
;	lea	.int2,a0
;	move.l	a0,$68
;	lea	.int3,a0
;	move.l	a0,$6C
;	lea	.int4,a0
;	move.l	a0,$70
;	lea	.int5,a0
;	move.l	a0,$74
;	lea	.int6,a0
;	move.l	a0,$78
;	lea	.int7,a0
;	move.l	a0,$7C

.name
	dc.b	"Bootrom",0

DummyIntHandler
	rts

	xdef _boot

;_boot
;	pea	prg_start
;	rts

; Interrupt handler table, modified by C code.
IntHandler1 dc.l	DummyIntHandler
IntHandler2 dc.l	DummyIntHandler
IntHandler3 dc.l	DummyIntHandler
IntHandler4 dc.l	DummyIntHandler
IntHandler5 dc.l	DummyIntHandler
IntHandler6 dc.l	DummyIntHandler
IntHandler7 dc.l	DummyIntHandler

EnableInterrupts ; FIXME - use a trap or suchlike to make this happen even if we're in user mode.
	move.w	#$2000,SR
	rts

DisableInterrupts
	move.w	#$2700,SR
	rts

	; make symbols visible to C code

	XDEF EnableInterrupts
	XDEF DisableInterrupts
	XDEF IntHandler1
	XDEF IntHandler2
	XDEF IntHandler3
	XDEF IntHandler4
	XDEF IntHandler5
	XDEF IntHandler6
	XDEF IntHandler7

	section .fixed_vectors
	dc.l	stack_top
	dc.l	Start
	ds.b	$5c,0
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler
	dc.l	DummyIntHandler

