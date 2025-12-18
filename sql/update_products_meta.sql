-- Update category, description, image for existing products
-- Run this in phpMyAdmin (SQL tab) or via mysql CLI against database `marshmallow`.

START TRANSACTION;

UPDATE products SET category='makanan', description='Marshmallow lembut dengan rasa cokelat yang creamy dan manis, perfect untuk camilan atau dessert.', image='https://images.unsplash.com/photo-1635943835981-c97171003e23?w=400' WHERE product_name IN ('Marshmallow Chocolate','Chocolate');

UPDATE products SET category='makanan', description='Marshmallow dengan aroma kopi yang khas, perpaduan manis dan sedikit pahit yang unik.', image='https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400' WHERE product_name IN ('Marshmallow Coffee','Coffee');

UPDATE products SET category='makanan', description='Marshmallow premium dengan rasa espresso yang bold, ideal untuk pecinta kopi sejati.', image='https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400' WHERE product_name IN ('Marshmallow Espresso','Espresso');

UPDATE products SET category='makanan', description='Marshmallow lembut dengan rasa latte yang smooth dan creamy, cocok untuk semua usia.', image='https://images.unsplash.com/photo-1590080874088-eec64895b423?w=400' WHERE product_name IN ('Marshmallow Latte','Latte');

UPDATE products SET category='makanan', description='Marshmallow dengan rasa matcha premium dari Jepang, authentic dan menyegarkan.', image='https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400' WHERE product_name IN ('Marshmallow Matcha','Matcha');

UPDATE products SET category='makanan', description='Marshmallow eksklusif dengan rasa crème brûlée yang mewah dan karamel yang lezat.', image='https://images.unsplash.com/photo-1511381939415-e44015466834?w=400' WHERE product_name IN ('Marshmallow Crème Brûlée','Crème Brûlée');

UPDATE products SET category='makanan', description='Marshmallow super lembut dengan rasa pudding klasik yang manis dan creamy.', image='https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=400' WHERE product_name IN ('Marshmallow Pudding','Pudding');

UPDATE products SET category='makanan', description='Marshmallow inspired oleh dessert Italia legendaris dengan rasa kopi dan mascarpone.', image='https://images.unsplash.com/photo-1612182062422-2c7f53c3b6af?w=400' WHERE product_name IN ('Marshmallow Tiramisu','Tiramisu');

UPDATE products SET category='makanan', description='Marshmallow edisi spesial Natal dengan kombinasi rasa festive yang limited edition!', image='https://images.unsplash.com/photo-1607920591413-4ec007e70023?w=400' WHERE product_name IN ('Marshmallow Christmas Special','Christmas Special');

UPDATE products SET category='makanan', description='Marshmallow dengan rasa cheesecake yang rich dan creamy, absolutely delicious.', image='https://images.unsplash.com/photo-1530610476181-d83430b64dcd?w=400' WHERE product_name IN ('Marshmallow Cheesecake','Cheesecake');

UPDATE products SET category='makanan', description='Marshmallow premium rasa red velvet dengan hint of cocoa dan cream cheese.', image='https://images.unsplash.com/photo-1601000938365-1c6e0bafe55e?w=400' WHERE product_name IN ('Marshmallow Red Velvet','Red Velvet');

UPDATE products SET category='makanan', description='Marshmallow dengan rasa strawberry segar alami, manis dan fruity yang menyegarkan.', image='https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400' WHERE product_name IN ('Marshmallow Strawberry','Strawberry');

COMMIT;
