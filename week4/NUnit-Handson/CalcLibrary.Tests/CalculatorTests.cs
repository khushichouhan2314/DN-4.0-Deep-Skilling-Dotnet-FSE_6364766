using CalcLibrary;
using NUnit.Framework;
using System;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorTests
    {
        private ICalculator _calculator;

        [SetUp]
        public void SetUp()
        {
            _calculator = new Calculator();
        }

       
        [TestCase(5, 7, 12)]
        [TestCase(-1, 1, 0)]
        [TestCase(0, 0, 0)]
        public void Add_TwoNumbers_ReturnsCorrectSum(double a, double b, double expected)
        {
            var result = _calculator.Add(a, b);
            Assert.That(result, Is.EqualTo(expected), $"Expected {a} + {b} = {expected}");
        }

        
        [TestCase(10, 3, 7)]
        [TestCase(5, 10, -5)]
        public void Sub_TwoNumbers_ReturnsCorrectDifference(double a, double b, double expected)
        {
            var result = _calculator.Sub(a, b);
            Assert.That(result, Is.EqualTo(expected), $"Expected {a} - {b} = {expected}");
        }

       
        [TestCase(2, 3, 6)]
        [TestCase(-2, -4, 8)]
        public void Mul_TwoNumbers_ReturnsCorrectProduct(double a, double b, double expected)
        {
            var result = _calculator.Mul(a, b);
            Assert.That(result, Is.EqualTo(expected), $"Expected {a} * {b} = {expected}");
        }

      
        [TestCase(8, 2, 4)]
        [TestCase(9, 3, 3)]
        public void Div_TwoNumbers_ReturnsCorrectQuotient(double a, double b, double expected)
        {
            var result = _calculator.Div(a, b);
            Assert.That(result, Is.EqualTo(expected), $"Expected {a} / {b} = {expected}");
        }

        [Test]
        public void Div_DivideByZero_ThrowsDivideByZeroException()
        {
            Assert.Throws<DivideByZeroException>(() => _calculator.Div(10, 0), "Divide by zero should throw exception");
        }

        [Test]
        [Ignore("Modulus functionality not yet implemented.")]
        public void Mod_ModulusOperation_Pending() { }
    }
}
