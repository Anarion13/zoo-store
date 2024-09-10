-- Add image_url column to products table
ALTER TABLE products ADD COLUMN image_url TEXT;

-- First, let's add some categories
INSERT INTO categories (name) VALUES
('Food'),
('Toys'),
('Habitats'),
('Accessories');

-- Now, let's add 15 products with image URLs
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
('Premium Dog Food', 'High-quality nutrition for adult dogs', 29.99, (SELECT id FROM categories WHERE name = 'Food'), 100, 'https://images.unsplash.com/photo-1585664811087-47f65abbad64?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9nJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D'),
('Interactive Cat Toy', 'Stimulating toy for feline entertainment', 12.99, (SELECT id FROM categories WHERE name = 'Toys'), 50, 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0JTIwdG95fGVufDB8fDB8fHww'),
('Deluxe Bird Cage', 'Spacious cage for medium-sized birds', 89.99, (SELECT id FROM categories WHERE name = 'Habitats'), 20, 'https://images.unsplash.com/photo-1520808663317-647b476a81b9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlyZCUyMGNhZ2V8ZW58MHx8MHx8fDA%3D'),
('Aquarium Filter', 'Efficient filter for 20-50 gallon tanks', 34.99, (SELECT id FROM categories WHERE name = 'Accessories'), 30, 'https://images.unsplash.com/photo-1520301255226-bf5f144451c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXF1YXJpdW18ZW58MHx8MHx8fDA%3D'),
('Hamster Exercise Wheel', 'Silent wheel for small rodents', 9.99, (SELECT id FROM categories WHERE name = 'Toys'), 40, 'https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFtc3RlcnxlbnwwfHwwfHx8MA%3D%3D'),
('Reptile Heat Lamp', 'Provides warmth for cold-blooded pets', 24.99, (SELECT id FROM categories WHERE name = 'Accessories'), 25, 'https://images.unsplash.com/photo-1590001155093-a3c66ab0c3ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVwdGlsZXxlbnwwfHwwfHx8MA%3D%3D'),
('Premium Cat Food', 'Balanced nutrition for indoor cats', 27.99, (SELECT id FROM categories WHERE name = 'Food'), 80, 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0JTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D'),
('Dog Chew Toy', 'Durable toy for aggressive chewers', 14.99, (SELECT id FROM categories WHERE name = 'Toys'), 60, 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9nJTIwdG95fGVufDB8fDB8fHww'),
('Rabbit Hutch', 'Comfortable outdoor housing for rabbits', 129.99, (SELECT id FROM categories WHERE name = 'Habitats'), 15, 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiYml0fGVufDB8fDB8fHww'),
('Fish Food Flakes', 'Nutritious flakes for tropical fish', 7.99, (SELECT id FROM categories WHERE name = 'Food'), 120, 'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmlzaCUyMGZvb2R8ZW58MHx8MHx8fDA%3D'),
('Cat Scratching Post', 'Sturdy post to protect furniture', 39.99, (SELECT id FROM categories WHERE name = 'Accessories'), 35, 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0JTIwc2NyYXRjaGluZyUyMHBvc3R8ZW58MHx8MHx8fDA%3D'),
('Small Animal Bedding', 'Soft, absorbent bedding for small pets', 19.99, (SELECT id FROM categories WHERE name = 'Accessories'), 50, 'https://images.unsplash.com/photo-1548767797-d8c844163c4c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFtc3RlciUyMGJlZGRpbmd8ZW58MHx8MHx8fDA%3D'),
('Parrot Perch', 'Natural wood perch for large birds', 16.99, (SELECT id FROM categories WHERE name = 'Accessories'), 40, 'https://images.unsplash.com/photo-1544923408-75c5cef46f14?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFycm90fGVufDB8fDB8fHww'),
('Turtle Dock', 'Floating platform for aquatic turtles', 22.99, (SELECT id FROM categories WHERE name = 'Habitats'), 25, 'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHVydGxlfGVufDB8fDB8fHww'),
('Guinea Pig Pellets', 'Vitamin C enriched food for guinea pigs', 11.99, (SELECT id FROM categories WHERE name = 'Food'), 70, 'https://images.unsplash.com/photo-1548767797-d8c844163c4c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3VpbmVhJTIwcGlnfGVufDB8fDB8fHww');