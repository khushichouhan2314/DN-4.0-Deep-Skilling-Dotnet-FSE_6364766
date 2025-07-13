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

var products = await context.Products.Include(p => p.Category).ToListAsync();

Console.WriteLine("Product List:");
foreach (var product in products)
{
    Console.WriteLine($"- {product.Name} | Rs. {product.Price} | Category: {product.Category?.Name}");
}