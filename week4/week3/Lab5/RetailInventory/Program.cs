using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RetailInventory.Data;

var config = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json")
    .Build();

var services = new ServiceCollection();
services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(config.GetConnectionString("DefaultConnection")));

using var provider = services.BuildServiceProvider();
var context = provider.GetRequiredService<AppDbContext>();

Console.WriteLine("\tAll Products");
var products = await context.Products.Include(p => p.Category).ToListAsync();
foreach (var p in products)
{
    Console.WriteLine($"{p.Name} - ₹{p.Price} | Category: {p.Category?.Name}");
}

Console.WriteLine("\n\tFind Product by ID (1)");
var product = await context.Products.FindAsync(1);
Console.WriteLine($"Found: {product?.Name}");

Console.WriteLine("\n\tFirst Product with Price > ₹50000");
var expensive = await context.Products.FirstOrDefaultAsync(p => p.Price > 50000);
Console.WriteLine($"Expensive: {expensive?.Name}");