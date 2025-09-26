int z = 1;

for (int i = 0; i < y; i++) {
    
    // product = z * x
    int product = 0;
    for (int j = 0; j < x; j++) {
        product = product + z;
    }
    
    z = product;

}
