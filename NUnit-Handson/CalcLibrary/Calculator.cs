using System;

namespace CalcLibrary
{
    public interface ICalculator
    {
        double Add(double a, double b);
        double Sub(double a, double b);
        double Mul(double a, double b);
        double Div(double a, double b);
    }

    public class Calculator : ICalculator
    {
        public double Add(double a, double b) => a + b;
        public double Sub(double a, double b) => a - b;
        public double Mul(double a, double b) => a * b;
        public double Div(double a, double b)
        {
            if (b == 0)
                throw new DivideByZeroException("Cannot divide by zero.");
            return a / b;
        }
    }
}