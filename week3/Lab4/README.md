# Inserting Initial Data into the Database
## Objective

Use *Entity Framework Core* to insert records into a SQL Server database using `AddRangeAsync()` and `SaveChangesAsync()` methods.
---

## Prerequisites

Ensure you have:
- [.NET 6+ SDK](https://dotnet.microsoft.com/en-us/download)
- Visual Studio / VS Code
- EF Core packages installed
- SQL Server or SQL Server Express installed
---

## Models Used

### Category.cs

```csharp
public class Category
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public ICollection<Product>? Products { get; set; }
}
```

### Product.cs

```csharp
public class Product
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public decimal Price { get; set; }
    public int CategoryId { get; set; }
    public Category? Category { get; set; }
}
```
---
## Steps
### Setup and Configuration

- Used `AppDbContext` to connect to the database via connection string in `appsettings.json`.
- Dependency Injection was used to inject `DbContext` through `ServiceCollection`.

### Inserting Data
```bash
using var context = new AppDbContext();

var electronics = new Category { Name = "Electronics" };
var groceries = new Category { Name = "Groceries" };

await context.Categories.AddRangeAsync(electronics, groceries);

var product1 = new Product { Name = "Laptop", Price = 75000, Category = electronics };
var product2 = new Product { Name = "Rice Bag", Price = 1200, Category = groceries };

await context.Products.AddRangeAsync(product1, product2);
await context.SaveChangesAsync();
```

### Run the Application

```bash
dotnet run
```

### Verify Insertion
- Open *SQL Server Management Studio (SSMS)* or *Azure Data Studio*
- Execute the following queries to verify inserted data:
    ```sql
    USE RetailDb;
    GO
    SELECT * FROM Categories;
    SELECT * FROM Products;
    ```
---

## Expected Output:

`dbo.Categories`
| Id | Name        |
| -- | ----------- |
| 1  | Electronics |
| 2  | Groceries   |

`dbo.Products`
| Id | Name     | Price | CategoryId |
| -- | -------- | ----- | ---------- |
| 1  | Laptop   | 75000 | 1          |
| 2  | Rice Bag | 1200  | 2          |