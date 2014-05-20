#include <stdio.h>

int elevado(int base, int expoente)
{
    int rt = 1;
    for (int i = 0; i < expoente; i++, rt*=base);
    return rt;
}

bool isMagic(int number)
{
    if (number < 10) // numero só tem 1 digito;
    {
        return false;
    }
    int part1, part2; // as duas partes do numero
    int grandeza = 0; // quantidade de digitos do numero

    for (int i = 0; i < 10; i++) // medir grandeza do numero
    {
        if (number > elevado(10, i))
        {
            grandeza++;
        }
    }
    if (grandeza%2) // Se o numero é impar
    {
        return false;
    }

    // Pega as duas partes do numero
    part1 = number/elevado(10, grandeza/2);
    part2 = number%elevado(10, grandeza/2);

    printf("%d --> (%d + %d) = %d --> %d^2 = %d\n",
           number, part1, part2, part1+part2, part1+part2, elevado(part1 + part2, 2));

    return (elevado(part1 + part2, 2) == number);
}


int main()
{
    int number = 0;
    printf("digite o numero a ser testado: ");
    scanf("%d", &number);

    printf(isMagic(number)?"Sim\n":"Nao\n");

    return 0;
}
