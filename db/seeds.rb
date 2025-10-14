# db/seeds.rb

# Clear old data
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

# Users
User.create!(name: "Alice", email: "alice@example.com", password: "password")
User.create!(name: "Bob", email: "bob@example.com", password: "password")

# Products with images
products = [
  { name: "Laptop", description: "High-performance gaming laptop", price: 1200, stock: 10, category: "Electronics", image_file: "1.jpeg" },
  { name: "Smartphone", description: "Latest model smartphone", price: 800, stock: 25, category: "Electronics", image_file: "2.jpeg" },
  { name: "Camera", description: "Professional DSLR camera", price: 500, stock: 15, category: "Electronics", image_file: "3.jpeg" }
]

products.each do |prod|
  p = Product.create!(name: prod[:name], description: prod[:description], price: prod[:price], stock: prod[:stock], category: prod[:category])
  p.image.attach(io: File.open(Rails.root.join("app/assets/images/#{prod[:image_file]}")), filename: prod[:image_file])
end

puts "✅ Seeded 2 users and 3 products (Laptop, Smartphone, Camera) with images!"
