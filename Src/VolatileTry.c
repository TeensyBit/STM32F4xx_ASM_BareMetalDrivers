/*
 * VolatileTry.c
 *
 *  Created on: Jan 14, 2024
 *      Author: teensydev
 */

#include <stdint.h>

#define SRAM_ADDR 0x20000000

int main(void)
{
	uint32_t val = 0;
	uint32_t *p = (uint32_t*) 0x20000000;

	while(1)
	{
		val = *p;
		if(val!=0)
			break;
	}

	while(1)

	return 0;
}

