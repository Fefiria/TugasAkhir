-- Create a new database
CREATE DATABASE IF NOT EXISTS marshmallow;

-- Use the database
USE marshmallow;

-- Create a sample table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
);

-- Create another sample table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price INT NOT NULL,
    stock INT DEFAULT 0,
    category VARCHAR(80) DEFAULT 'lainnya',
    description TEXT DEFAULT '',
    image VARCHAR(500) DEFAULT ''
);

-- Insert sample data
INSERT INTO users (user_name) VALUES 
('John Doe'),
('Jane Smith');

-- Insert sample products
INSERT INTO products (product_name, price, stock, category, description, image) VALUES 
('Marshmallow Chocolate', 15000, 100, 'makanan', 'Marshmallow lembut dengan rasa cokelat yang creamy dan manis, perfect untuk camilan atau dessert.', 'https://images.unsplash.com/photo-1635943835981-c97171003e23?w=400'),
('Marshmallow Coffee', 15000, 100, 'makanan', 'Marshmallow dengan aroma kopi yang khas, perpaduan manis dan sedikit pahit yang unik.', 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400'),
('Marshmallow Espresso', 20000, 100, 'makanan', 'Marshmallow premium dengan rasa espresso yang bold, ideal untuk pecinta kopi sejati.', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400'),
('Marshmallow Latte', 15000, 100, 'makanan', 'Marshmallow lembut dengan rasa latte yang smooth dan creamy, cocok untuk semua usia.', 'https://images.unsplash.com/photo-1590080874088-eec64895b423?w=400'),
('Marshmallow Matcha', 15000, 100, 'makanan', 'Marshmallow dengan rasa matcha premium dari Jepang, authentic dan menyegarkan.', 'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400'),
('Marshmallow Crème Brûlée', 17000, 100, 'makanan', 'Marshmallow eksklusif dengan rasa crème brûlée yang mewah dan karamel yang lezat.', 'https://images.unsplash.com/photo-1511381939415-e44015466834?w=400'),
('Marshmallow Pudding', 20000, 100, 'makanan', 'Marshmallow super lembut dengan rasa pudding klasik yang manis dan creamy.', 'https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=400'),
('Marshmallow Tiramisu', 15000, 100, 'makanan', 'Marshmallow inspired oleh dessert Italia legendaris dengan rasa kopi dan mascarpone.', 'https://images.unsplash.com/photo-1612182062422-2c7f53c3b6af?w=400'),
('Marshmallow Christmas Special', 25000, 80, 'makanan', 'Marshmallow edisi spesial Natal dengan kombinasi rasa festive yang limited edition!', 'https://images.unsplash.com/photo-1607920591413-4ec007e70023?w=400'),
('Marshmallow Cheesecake', 15000, 100, 'makanan', 'Marshmallow dengan rasa cheesecake yang rich dan creamy, absolutely delicious.', 'https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=400'),
('Marshmallow Red Velvet', 20000, 100, 'makanan', 'Marshmallow premium rasa red velvet dengan hint of cocoa dan cream cheese.', 'https://images.unsplash.com/photo-1601000938365-1c6e0bafe55e?w=400'),
('Marshmallow Strawberry', 15000, 100, 'makanan', 'Marshmallow dengan rasa strawberry segar alami, manis dan fruity yang menyegarkan.', 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400');


-- Query to verify data insertion
SELECT * FROM users;
SELECT * FROM products;

