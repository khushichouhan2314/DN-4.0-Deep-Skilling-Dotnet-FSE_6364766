using System;

class Program
{
    static void Main()
    {
        double baseValue = 5000;
        double growthRate = 0.05;
        int years = 10;

        double result = Forecast(baseValue, growthRate, years);
        Console.WriteLine(result);
    }

    static double Forecast(double value, double rate, int years)
    {
        if (years == 0)
            return value;
        return Forecast(value, rate, years - 1) * (1 + rate);
    }
}