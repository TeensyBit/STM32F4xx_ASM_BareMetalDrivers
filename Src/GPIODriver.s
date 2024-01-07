		.syntax 	unified
		.cpu 		cortex-m4
		.thumb
		.section 	.text
		.globl		__main

.equ 	AHB1_Base	0x40020000
.equ	RCC_Base	(AHB_Base+0x3800)
__main:
