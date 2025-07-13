using System;
using SingletonPatternExample;

class Program
{
    public static void Main(string[] args)
    {
        Logger logger1 = Logger.Instance;
        logger1.Log("Message 1");

        Logger logger2 = Logger.Instance;
        logger2.Log("Message 2");

        if (ReferenceEquals(logger1, logger2))
        {
            Console.WriteLine(" Successful implementation of singleton");
            Console.WriteLine(" Both logger1 and logger2 are the same instance");
        }
        else
        {
            Console.WriteLine(" Singleton failed. Different instances exist.");
        }
        Console.ReadLine();
    }
}
