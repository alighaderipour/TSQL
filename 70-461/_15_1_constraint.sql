1. What Are Constraints?
Constraints in SQL Server are rules applied to table columns to enforce data integrity and restrict invalid data entry. They ensure accuracy and reliability of the data. Constraints can define:

The type of data allowed (e.g., integers, strings).
The uniqueness of values.
Relationships between tables.
Key Characteristics:

Constraints are associated with columns or tables.
They are automatically enforced when data is inserted, updated, or deleted.
Constraints enhance the integrity of databases, reduce anomalies, and simplify coding.
Common constraint types in SQL Server include NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, and DEFAULT.

2. NOT NULL Constraint
The NOT NULL constraint ensures that a column cannot have NULL values. It is used when a value is mandatory for a field.

Syntax Example:

sql
Copy code
CREATE TABLE Employees (
    EmployeeID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Age INT
);
In this example, the EmployeeID and Name columns cannot have NULL values.
This constraint is particularly useful in avoiding data with unknown or missing values.
You cannot insert or update rows that lack values for NOT NULL columns.
3. UNIQUE Constraint
The UNIQUE constraint ensures that all values in a column are distinct. It prevents duplicate entries in the specified column(s).

Syntax Example:

sql
Copy code
CREATE TABLE Users (
    UserID INT UNIQUE,
    Email NVARCHAR(50) UNIQUE
);
Key Notes:

A table can have multiple UNIQUE constraints but only one PRIMARY KEY.
UNIQUE constraints can also include multiple columns in a composite unique key.
4. PRIMARY KEY Constraint
The PRIMARY KEY uniquely identifies each row in a table. It combines NOT NULL and UNIQUE.

Syntax Example:

sql
Copy code
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName NVARCHAR(100)
);
Key Points:

Each table can have only one primary key.
Primary keys can consist of multiple columns, forming a composite key.
5. FOREIGN KEY Constraint
The FOREIGN KEY constraint establishes a relationship between two tables. It enforces referential integrity by ensuring that a value in one table matches a value in another.

Syntax Example:

sql
Copy code
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
);
Key Features:

A FOREIGN KEY connects the child table (Orders) with the parent table (Customers).
If the parent key is updated or deleted, the FOREIGN KEY can enforce actions like CASCADE or NO ACTION.
6. CHECK Constraint
The CHECK constraint enforces a condition for the values in a column. If the condition is not met, the action fails.

Syntax Example:

sql
Copy code
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);
Key Uses:

Use CHECK for conditions like ranges or valid states.
Multiple CHECK constraints can be applied to a single table.
7. DEFAULT Constraint
The DEFAULT constraint assigns a default value to a column if no value is provided during insertion.

Syntax Example:

sql
Copy code
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    JoinDate DATE DEFAULT GETDATE()
);
Highlights:

Useful for columns like creation timestamps or default statuses.
Can reduce the need for null handling during data entry.
8. UNIQUE vs. PRIMARY KEY
While both UNIQUE and PRIMARY KEY enforce uniqueness, key differences include:

A table can have multiple UNIQUE constraints but only one PRIMARY KEY.
A PRIMARY KEY requires a combination of NOT NULL and UNIQUE, whereas UNIQUE allows null values.
Example:

sql
Copy code
CREATE TABLE Example (
    ID INT PRIMARY KEY,
    AlternateID INT UNIQUE
);
9. Composite Constraints
Composite constraints involve multiple columns working together. Common in PRIMARY KEY and UNIQUE constraints.

Example:

sql
Copy code
CREATE TABLE CourseEnrollment (
    CourseID INT,
    StudentID INT,
    PRIMARY KEY (CourseID, StudentID)
);
The combination of CourseID and StudentID forms a unique key.
This is vital in many-to-many relationships.
10. ALTER Table and Adding Constraints
Constraints can be added to existing tables using the ALTER TABLE command.

Example:

sql
Copy code
ALTER TABLE Employees
ADD CONSTRAINT CK_Age CHECK (Age >= 18);
This command:

Adds the CK_Age constraint to the Employees table.
Enforces that all ages must be 18 or older.
11. Disabling and Dropping Constraints
Constraints can be temporarily disabled or permanently removed.

Disable:

sql
Copy code
ALTER TABLE Employees NOCHECK CONSTRAINT CK_Age;
Drop:

sql
Copy code
ALTER TABLE Employees DROP CONSTRAINT CK_Age;
Uses:

Disabling constraints allows updates or maintenance that may temporarily violate rules.
Dropping constraints permanently removes restrictions.
12. Best Practices
When using constraints:

Plan Ahead: Identify mandatory columns and relationships during table design.
Combine Constraints: Use multiple constraints (e.g., NOT NULL and CHECK) for stricter data enforcement.
Name Constraints: Use descriptive names for better maintainability.
Example:

sql
Copy code
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    Stock INT NOT NULL CHECK (Stock >= 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0)
);
Well-defined constraints improve database reliability, reduce invalid data, and simplify application logic.

Let me know if you need further clarification!













