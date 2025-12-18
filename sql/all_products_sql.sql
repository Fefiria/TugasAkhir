-- All-in-one SQL script
-- Purpose: add missing columns and update/insert product metadata
-- Usage: paste into phpMyAdmin SQL tab or run via MySQL CLI against database `marshmallow`.

USE marshmallow;

-- Add columns if they don't exist (MySQL/MariaDB: IF NOT EXISTS supported on many versions)
ALTER TABLE products ADD COLUMN IF NOT EXISTS category VARCHAR(80) DEFAULT 'lainnya';
ALTER TABLE products ADD COLUMN IF NOT EXISTS description TEXT DEFAULT '';
ALTER TABLE products ADD COLUMN IF NOT EXISTS image VARCHAR(500) DEFAULT '';

START TRANSACTION;

-- Marshmallow Chocolate
UPDATE products
SET category='makanan',
    description='Marshmallow lembut dengan rasa cokelat yang creamy dan manis, perfect untuk camilan atau dessert.',
    image='https://images.unsplash.com/photo-1635943835981-c97171003e23?w=400'
WHERE product_name IN ('Marshmallow Chocolate','Chocolate');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Chocolate',15000,100,'makanan',
'Marshmallow lembut dengan rasa cokelat yang creamy dan manis, perfect untuk camilan atau dessert.',
'https://images.unsplash.com/photo-1635943835981-c97171003e23?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Chocolate','Chocolate'));

-- Marshmallow Coffee
UPDATE products
SET category='makanan',
    description='Marshmallow dengan aroma kopi yang khas, perpaduan manis dan sedikit pahit yang unik.',
    image='https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400'
WHERE product_name IN ('Marshmallow Coffee','Coffee');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Coffee',15000,100,'makanan',
'Marshmallow dengan aroma kopi yang khas, perpaduan manis dan sedikit pahit yang unik.',
'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Coffee','Coffee'));

-- Marshmallow Espresso
UPDATE products
SET category='makanan',
    description='Marshmallow premium dengan rasa espresso yang bold, ideal untuk pecinta kopi sejati.',
    image='https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400'
WHERE product_name IN ('Marshmallow Espresso','Espresso');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Espresso',20000,100,'makanan',
'Marshmallow premium dengan rasa espresso yang bold, ideal untuk pecinta kopi sejati.',
'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Espresso','Espresso'));

-- Marshmallow Latte
UPDATE products
SET category='makanan',
    description='Marshmallow lembut dengan rasa latte yang smooth dan creamy, cocok untuk semua usia.',
    image='https://images.unsplash.com/photo-1590080874088-eec64895b423?w=400'
WHERE product_name IN ('Marshmallow Latte','Latte');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Latte',15000,100,'makanan',
'Marshmallow lembut dengan rasa latte yang smooth dan creamy, cocok untuk semua usia.',
'https://images.unsplash.com/photo-1590080874088-eec64895b423?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Latte','Latte'));

-- Marshmallow Matcha
UPDATE products
SET category='makanan',
    description='Marshmallow dengan rasa matcha premium dari Jepang, authentic dan menyegarkan.',
    image='https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400'
WHERE product_name IN ('Marshmallow Matcha','Matcha');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Matcha',15000,100,'makanan',
'Marshmallow dengan rasa matcha premium dari Jepang, authentic dan menyegarkan.',
'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Matcha','Matcha'));

-- Marshmallow Crème Brûlée
UPDATE products
SET category='makanan',
    description='Marshmallow eksklusif dengan rasa crème brûlée yang mewah dan karamel yang lezat.',
    image='https://images.unsplash.com/photo-1511381939415-e44015466834?w=400'
WHERE product_name IN ('Marshmallow Crème Brûlée','Crème Brûlée');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Crème Brûlée',17000,100,'makanan',
'Marshmallow eksklusif dengan rasa crème brûlée yang mewah dan karamel yang lezat.',
'https://images.unsplash.com/photo-1511381939415-e44015466834?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Crème Brûlée','Crème Brûlée'));

-- Marshmallow Pudding
UPDATE products
SET category='makanan',
    description='Marshmallow super lembut dengan rasa pudding klasik yang manis dan creamy.',
    image='https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=400'
WHERE product_name IN ('Marshmallow Pudding','Pudding');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Pudding',20000,100,'makanan',
'Marshmallow super lembut dengan rasa pudding klasik yang manis dan creamy.',
'https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Pudding','Pudding'));

-- Marshmallow Tiramisu
UPDATE products
SET category='makanan',
    description='Marshmallow inspired oleh dessert Italia legendaris dengan rasa kopi dan mascarpone.',
    image='https://images.unsplash.com/photo-1612182062422-2c7f53c3b6af?w=400'
WHERE product_name IN ('Marshmallow Tiramisu','Tiramisu');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Tiramisu',15000,100,'makanan',
'Marshmallow inspired oleh dessert Italia legendaris dengan rasa kopi dan mascarpone.',
'https://images.unsplash.com/photo-1612182062422-2c7f53c3b6af?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Tiramisu','Tiramisu'));

-- Marshmallow Christmas Special
UPDATE products
SET category='makanan',
    description='Marshmallow edisi spesial Natal dengan kombinasi rasa festive yang limited edition!',
    image='https://images.unsplash.com/photo-1607920591413-4ec007e70023?w=400'
WHERE product_name IN ('Marshmallow Christmas Special','Christmas Special');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Christmas Special',25000,80,'makanan',
'Marshmallow edisi spesial Natal dengan kombinasi rasa festive yang limited edition!',
'https://images.unsplash.com/photo-1607920591413-4ec007e70023?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Christmas Special','Christmas Special'));

-- Marshmallow Cheesecake
UPDATE products
SET category='makanan',
    description='Marshmallow dengan rasa cheesecake yang rich dan creamy, absolutely delicious.',
    image='https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=400'
WHERE product_name IN ('Marshmallow Cheesecake','Cheesecake');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Cheesecake',15000,100,'makanan',
'Marshmallow dengan rasa cheesecake yang rich dan creamy, absolutely delicious.',
'https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Cheesecake','Cheesecake'));

-- Marshmallow Red Velvet
UPDATE products
SET category='makanan',
    description='Marshmallow premium rasa red velvet dengan hint of cocoa dan cream cheese.',
    image='https://images.unsplash.com/photo-1601000938365-1c6e0bafe55e?w=400'
WHERE product_name IN ('Marshmallow Red Velvet','Red Velvet');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Red Velvet',20000,100,'makanan',
'Marshmallow premium rasa red velvet dengan hint of cocoa dan cream cheese.',
'https://images.unsplash.com/photo-1601000938365-1c6e0bafe55e?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Red Velvet','Red Velvet'));

-- Marshmallow Strawberry
UPDATE products
SET category='makanan',
    description='Marshmallow dengan rasa strawberry segar alami, manis dan fruity yang menyegarkan.',
    image='https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400'
WHERE product_name IN ('Marshmallow Strawberry','Strawberry');

INSERT INTO products (product_name, price, stock, category, description, image)
SELECT 'Marshmallow Strawberry',15000,100,'makanan',
'Marshmallow dengan rasa strawberry segar alami, manis dan fruity yang menyegarkan.',
'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name IN ('Marshmallow Strawberry','Strawberry'));

COMMIT;

-- Verify
SELECT product_id, product_name, price, stock, category, LEFT(description,200) AS description_preview, image FROM products ORDER BY product_id;
