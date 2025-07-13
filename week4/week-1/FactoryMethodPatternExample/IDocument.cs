using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactoryMethodPatternExample
{
    using System;

    public interface IDocument
    {
        void Open();
    }

    public class WordDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening Word document.");
        }
    }

    public class PdfDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening PDF document.");
        }
    }

    public class ExcelDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening Excel document.");
        }
    }

}
