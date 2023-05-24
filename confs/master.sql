-- Switch to the newly created database
CREATE USER "replication"@"%" IDENTIFIED BY "password";
GRANT REPLICATION SLAVE ON *.* TO "replication"@"%";
FLUSH PRIVILEGES;

USE inventario_escuelas;

-- Create the Region table
CREATE TABLE Region (
  region_id INT PRIMARY KEY,
  region_name VARCHAR(100),
  description VARCHAR(255)
);

-- Insert a random record into the Region table
INSERT INTO Region (region_id, region_name, description)
VALUES (1, 'Example Region', 'This is an example region.');

-- Create the EducationalCenter table
CREATE TABLE EducationalCenter (
  center_id INT PRIMARY KEY,
  center_name VARCHAR(100),
  address VARCHAR(255),
  contact_information VARCHAR(255),
  region_id INT,
  latitude DECIMAL(9, 6),
  longitude DECIMAL(9, 6),
  FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

-- Insert a random record into the EducationalCenter table
INSERT INTO EducationalCenter (center_id, center_name, address, contact_information, region_id, latitude, longitude)
VALUES (1, 'Example Center', '123 Main St', 'example@example.com', 1, 40.7128, -74.0060);

-- Create the InventoryItem table
CREATE TABLE InventoryItem (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(100),
  description VARCHAR(255),
  quantity INT,
  center_id INT,
  FOREIGN KEY (center_id) REFERENCES EducationalCenter(center_id)
);

-- Insert a random record into the InventoryItem table
INSERT INTO InventoryItem (item_id, item_name, description, quantity, center_id)
VALUES (1, 'Example Item', 'This is an example item.', 10, 1);

-- Create the ItemCategory table
CREATE TABLE ItemCategory (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(100)
);

-- Insert a random record into the ItemCategory table
INSERT INTO ItemCategory (category_id, category_name)
VALUES (1, 'Example Category');

-- Create the ItemSupplier table
CREATE TABLE ItemSupplier (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(100),
  contact_information VARCHAR(255)
);

-- Insert a random record into the ItemSupplier table
INSERT INTO ItemSupplier (supplier_id, supplier_name, contact_information)
VALUES (1, 'Example Supplier', 'supplier@example.com');

-- Create the SupplierItem table
CREATE TABLE SupplierItem (
  supplier_id INT,
  item_id INT,
  price DECIMAL(10, 2),
  quantity_available INT,
  FOREIGN KEY (supplier_id) REFERENCES ItemSupplier(supplier_id),
  FOREIGN KEY (item_id) REFERENCES InventoryItem(item_id)
);

-- Insert a random record into the SupplierItem table
INSERT INTO SupplierItem (supplier_id, item_id, price, quantity_available)
VALUES (1, 1, 10.99, 5);

-- Create the Employee table
CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100),
  position VARCHAR(100),
  contact_information VARCHAR(255)
);

-- Insert a random record into the Employee table
INSERT INTO Employee (employee_id, employee_name, position, contact_information)
VALUES (1, 'John Doe', 'Manager', 'john.doe@example.com');

-- Create the CenterEmployee table
CREATE TABLE CenterEmployee (
  center_id INT,
  employee_id INT,
  FOREIGN KEY (center_id) REFERENCES EducationalCenter(center_id),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Insert a random record into the CenterEmployee table
INSERT INTO CenterEmployee (center_id, employee_id)
VALUES (1, 1);

-- Create the CenterCoordinates table
CREATE TABLE CenterCoordinates (
  center_id INT PRIMARY KEY,
  latitude DECIMAL(9, 6),
  longitude DECIMAL(9, 6),
  FOREIGN KEY (center_id) REFERENCES EducationalCenter(center_id)
);

-- Insert a random record into the CenterCoordinates table
INSERT INTO CenterCoordinates (center_id, latitude, longitude)
VALUES (1, 40.7128, -74.0060);
