/*
	TEST PROGRAM #3: compute first 16 fibonacci numbers
			 with forwarding and stall conditions in the loop


	long output[16];
	
	void
	main(void)
	{
	  long i, fib;
	
	  output[0] = 1;
	  output[1] = 2;
	  for (i=2; i < 16; i++)
	    output[i] = output[i-1] + output[i-2];
	}
*/

start:	li	x4, 0x20000000
	li	x5, 0x20000008
	li	x6, 0x20000010
	li	x10, 2
	li	x2, 1
	sw	x2, 0(x4)
	sw	x2, 0(x5)
loop:	lw	x2, 0(x4)
	lw	x3, 0(x5)
	add	x3,	x3,	x2 #
	addi	x4,	x4,	0x8 #
	addi	x5,	x5,	0x8 #
	addi	x10,	x10,	0x1 #
	slti	x11,	x10,	16 #
	sw	x3, 0(x6)
	addi	x6,	x6,	0x8 #
	bne	x11,	x0,	loop #
	li s0, 0x30010000 #gpio base address
	sw x3, 0x14(s0) #send out to gpio direct out
	j start