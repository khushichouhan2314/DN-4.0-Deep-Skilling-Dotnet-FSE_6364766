using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;
using RetailInventory.Models;

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

// Setup DI
var serviceProvider = new ServiceCollection()
    .AddSingleton<IConfiguration>(configuration)
    .AddDbContext<AppDbContext>(options =>
        options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")))
    .BuildServiceProvider();

// Insert Initial Data
using (var context = serviceProvider.GetRequiredService<AppDbContext>()){

    var electronics = new Category { Name = "Electronics" };
    var groceries = new Category { Name = "Groceries" };

    await context.Categories.AddRangeAsync(electronics, groceries);

    var product1 = new Product { Name = "Laptop", Price = 75000, Category = electronics };
    var product2 = new Product { Name = "Rice Bag", Price = 1200, Category = groceries };

    await context.Products.AddRangeAsync(product1, product2);
    await context.SaveChangesAsync();

    Console.WriteLine("\nInitial Data inserted successfully.\n");

    Console.WriteLine("Products AFTER insertion:");
    var afterProducts = await context.Products.Include(p => p.Category).ToListAsync();
    foreach (var product in afterProducts)
    {
        Console.WriteLine($"{product.Name} - Rs. {product.Price} (Category: {product.Category?.Name})");
    }
}
