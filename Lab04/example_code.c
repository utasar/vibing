int main()
{
    int total = 1;
    for (int i = 0; i < 10; i++)
    {
        total += 4;
        foo(total);
    }
}

void foo(int n)
{
    n += 1;
}
