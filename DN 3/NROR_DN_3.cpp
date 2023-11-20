#include <iostream>
#include <cmath>

// Funkcija za izračun vrednosti funkcije e^(3x)
double e3x(double x) {
    return exp(3 * x);
}

// Funkcija za izračun vrednosti arctan(x) s pomočjo razvoja Taylorjeve vrste
double arctan(double x, int n) {
    double result = 0;
    for (int i = 0; i < n; ++i) {
        int sign;
        if (i % 2 == 0) {
            sign = 1;
        } else {
            sign = -1;
}
        result += sign * pow(x, 2 * i + 1) / (2 * i + 1);
    }
    return result;
}

// Trapezna metoda za izračun integrala
double trapeznaMetoda(double a, double b, int n) {
    double h = (b - a) / n;
    double integral = (e3x(a) * arctan(a, 100) + e3x(b) * arctan(b, 100)) / 2.0;

    for (int i = 1; i < n; ++i) {
        double x_i = a + i * h;
        integral += e3x(x_i) * arctan((x_i)/2, 100);
    }

    return integral * h;
}

int main() {
    // Definirajte meje integracije in število podintervalov
    double a = 0.0;
    double b = M_PI / 4; // Uporaba vgrajene konstante π
    int n = 10000; // Določitev števila podintervalov

    // Izračunajte vrednost integrala s trapezno metodo
    double rezultat = trapeznaMetoda(a, b, n);

    // Izpiše rezultat
    std::cout << "Ocena integrala: " << rezultat << std::endl;

    return 0;
}

