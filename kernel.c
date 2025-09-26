#include "./io.h"
#include "./multitasking.h"
#include "./irq.h"
#include "./isr.h"

void prockernel();
void proc_a();

int main() 
{
	// Clear the screen
	clearscreen();

	// Initialize our keyboard
	initkeymap();

	// Initialize interrupts
	idt_install();
    isrs_install();
    irq_install();

	// Start executing the kernel process
	startkernel(prockernel);
	
	return 0;
}

void prockernel()
{
	// Create the user processes
	createproc(proc_a, (void *) 0x10000);

	// Count how many processes are ready to run
	int userprocs = ready_process_count();

	printf("Kernel Process Started\n");
	
	// As long as there is 1 user process that is ready, yield to it so it can run
	while(userprocs > 0)
	{
		// Yield to the user process
		yield();
		
		printf("Kernel Process Resumed\n");

		// Count the remaining ready processes (if any)
		userprocs = ready_process_count();
	}

	printf("Kernel Process Terminated\n");
}

// The user processes
void proc_a()
{
	printf("User Process A Started\n");

	exit();
}
