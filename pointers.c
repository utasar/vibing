int main()
{
	int i;
	float f;
	int * p; // p is a pointer to an int
	float * q; // q is a pointer to a float
	
	printf("&i = 0x%x\n", &i);
	printf("&f = 0x%x\n", &f);
	printf("&p = 0x%x\n", &p);
	printf("&q = 0x%x\n", &q);
	
	printf("i = 0x%x\n", i);
	printf("f = 0x%x\n", f);
	printf("p = 0x%x\n", p);
	printf("q = 0x%x\n", q);
	
	p = &i; // p points to i
	q = &f; // q points to f
	*p = 20; // dereference p
	*q = 7.5; // dereference q
	
	printf("&i = 0x%x\n", &i);
	printf("&f = 0x%x\n", &f);
	printf("&p = 0x%x\n", &p);
	printf("&q = 0x%x\n", &q);
	
	printf("i = 0x%x\n", i);
	printf("f = 0x%x\n", f);
	printf("p = 0x%x\n", p);
	printf("q = 0x%x\n", q);
}
