//BUS Base Addresses
.equ 	AHB1_BASE,	0x40020000

//GPIO	Register Offsets
.equ    GPIOA_MODER_Offset,      0x00
.equ    GPIOA_OTYPER_Offset,     0x04
.equ    GPIOA_OSPEEDR_Offset,    0x08
.equ    GPIOA_PUPDR_Offset,      0x0C
.equ    GPIOA_IDR_Offset,        0x10
.equ    GPIOA_ODR_Offset,        0x14
.equ    GPIOA_BSRR_Offset,       0x18
.equ    GPIOA_LCKR_Offset,       0x1C
.equ    GPIOA_AFRL_Offset,       0x20
.equ    GPIOA_AFRH_Offset,       0x24

//RCC	Offsets
.equ 	RCC_Offset,				0x3800
.equ 	RCC_AHB1ENR_Offset,		0x30

.equ	RCC_BASE,				(AHB1_BASE + RCC_Offset)

//RCC Register Defintions
.equ 	RCC_AHB1ENR,			(RCC_BASE + RCC_AHB1ENR_Offset)

//GPIO Register Definitions
.equ    GPIOA_MODER,             AHB1_BASE + GPIOA_MODER_Offset
.equ    GPIOA_OTYPER,            AHB1_BASE + GPIOA_OTYPER_Offset
.equ    GPIOA_OSPEEDR,           AHB1_BASE + GPIOA_OSPEEDR_Offset
.equ    GPIOA_PUPDR,             AHB1_BASE + GPIOA_PUPDR_Offset
.equ    GPIOA_IDR,               AHB1_BASE + GPIOA_IDR_Offset
.equ    GPIOA_ODR,               AHB1_BASE + GPIOA_ODR_Offset
.equ    GPIOA_BSRR,              AHB1_BASE + GPIOA_BSRR_Offset
.equ    GPIOA_LCKR,              AHB1_BASE + GPIOA_LCKR_Offset
.equ    GPIOA_AFRL,              AHB1_BASE + GPIOA_AFRL_Offset
.equ    GPIOA_AFRH,              AHB1_BASE + GPIOA_AFRH_Offset

		.syntax 	unified
		.cpu 		cortex-m4
		.thumb
		.section 	.text
		.globl		__main

__main:
		//Enable RCC Clock for GPIOA
		ldr 	r0, =RCC_AHB1ENR
		ldr 	r1, [r0]
		orr		r1, #(1<<0)
		str 	r1, [r0]

		//Set GPIO port mode register to output
		ldr 	r0, =GPIOA_MODER
		ldr 	r1, [r0]
		orr 	r1, #(1<<0)
		str 	r1, [r0]

		//Set Output type to open drain
		ldr 	r0, =GPIOA_OTYPER
		ldr 	r1, [r0]
		orr 	r1, #(0<<0)
		str 	r1, [r0]

		//Set to port pull-down
		ldr 	r0, =GPIOA_PUPDR
		ldr 	r1, [r0]
		orr 	r1, #(1<<1)
		str 	r1, [r0]

		//Write to ODR
		ldr 	r0, =GPIOA_ODR
		ldr 	r1, [r0]
		orr 	r1, #(1<<0)
		str 	r1, [r0]
		bx 		lr


stop:
		b		stop
		.align
		.end
