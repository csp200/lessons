#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to generate a random double between 0 and 1
double random_double() {
    return (double)rand() / (double)RAND_MAX;
}

// Monte Carlo function to estimate Pi
double monte_carlo_pi(int num_iterations) {
    int inside_circle = 0;

    for (int i = 0; i < num_iterations; ++i) {
        double x = random_double();
        double y = random_double();

        if ((x * x + y * y) <= 1.0) {
            inside_circle++;
        }
    }

    return 4.0 * (double)inside_circle / (double)num_iterations;
}

int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Number of iterations for Monte Carlo simulation
    int num_iterations;
    printf("Enter the number of iterations: ");
    scanf("%d", &num_iterations);

    if (num_iterations <= 0) {
        printf("Number of iterations must be greater than 0.\n");
        return 1;
    }

    // Calculate Pi
    double pi_estimate = monte_carlo_pi(num_iterations);

    printf("Estimated value of Pi after %d iterations: %.10f\n", num_iterations, pi_estimate);

    return 0;
}

