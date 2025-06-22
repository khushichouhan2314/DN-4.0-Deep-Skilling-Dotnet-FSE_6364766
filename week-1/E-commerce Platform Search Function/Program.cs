
using System;

class Program
{
    static void Main()
    {
        Product[] products = {
            new Product(3, "Shoes", "Fashion"),
            new Product(1, "Phone", "Electronics"),
            new Product(4, "Laptop", "Electronics"),
            new Product(2, "T-Shirt", "Fashion")
        };

        //  Linear Search
        Console.WriteLine("Linear Search for 'Laptop':");
        Product linearResult = LinearSearch(products, "Laptop");
        PrintResult(linearResult);

        Array.Sort(products, (a, b) => a.ProductName.CompareTo(b.ProductName));

        // Binary Search 
        Console.WriteLine("\n Binary Search for 'Laptop':");
        Product binaryResult = BinarySearch(products, "Laptop");
        PrintResult(binaryResult);
    }

    static Product LinearSearch(Product[] products, string searchName)
    {
        foreach (var product in products)
        {
            if (product.ProductName.Equals(searchName, StringComparison.OrdinalIgnoreCase))
            {
                return product;
            }
        }
        return null;
    }

    static Product BinarySearch(Product[] products, string searchName)
    {
        int left = 0, right = products.Length - 1;

        while (left <= right)
        {
            int mid = (left + right) / 2;
            int compare = string.Compare(products[mid].ProductName, searchName, StringComparison.OrdinalIgnoreCase);

            if (compare == 0)
                return products[mid];
            else if (compare < 0)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return null;
    }

    static void PrintResult(Product p)
    {
        if (p != null)
        {
            Console.WriteLine($" Found Product: ID= {p.ProductId}, Name= {p.ProductName}, Category= {p.Category}");
        }
        else
        {
            Console.WriteLine("Product not found.");
        }
    }
}
