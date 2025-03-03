//
//  MockData.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 04/03/25.
//

import SwiftUI

// MARK: - Food Item Model
struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: UIImage
    var rating: Double
}

struct MockData {
    static let foodItems = [
        FoodItem(name: "Cheeseburger", description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles. The combination of these fresh ingredients creates a deliciously satisfying experience that leaves you craving more. Whether you're enjoying it on the go or as a meal, this burger is sure to satisfy your hunger.", image: .burgur1, rating: 4.9),
        
        FoodItem(name: "Veggie Burger", description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. This burger is perfect for those looking for a tasty and nutritious alternative to traditional beef burgers. Every bite bursts with natural flavors, making it a favorite among veggie lovers.", image: .burgur2, rating: 4.8),
        
        FoodItem(name: "Chicken Burger", description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger! Made with tender chicken breast, lightly seasoned and grilled to perfection, it's served with crisp lettuce, fresh tomatoes, and a special sauce that enhances every bite.", image: .burgur3, rating: 4.6),
        
        FoodItem(name: "Fried Chicken Burger", description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce. The golden, crunchy coating gives way to tender, flavorful chicken inside, creating an irresistible taste experience. Enjoy it with your favorite side for the ultimate meal.", image: .burgur4, rating: 4.5),
        
        FoodItem(name: "Cheeseburger", description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles. The combination of these fresh ingredients creates a deliciously satisfying experience that leaves you craving more. Whether you're enjoying it on the go or as a meal, this burger is sure to satisfy your hunger.", image: .burgur1, rating: 4.9),
        
        FoodItem(name: "Veggie Burger", description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. This burger is perfect for those looking for a tasty and nutritious alternative to traditional beef burgers. Every bite bursts with natural flavors, making it a favorite among veggie lovers.", image: .burgur2, rating: 4.8),
        
        FoodItem(name: "Chicken Burger", description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger! Made with tender chicken breast, lightly seasoned and grilled to perfection, it's served with crisp lettuce, fresh tomatoes, and a special sauce that enhances every bite.", image: .burgur3, rating: 4.6),
        
        FoodItem(name: "Fried Chicken Burger", description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce. The golden, crunchy coating gives way to tender, flavorful chicken inside, creating an irresistible taste experience. Enjoy it with your favorite side for the ultimate meal.", image: .burgur4, rating: 4.5),
        
        FoodItem(name: "Cheeseburger", description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles. The combination of these fresh ingredients creates a deliciously satisfying experience that leaves you craving more. Whether you're enjoying it on the go or as a meal, this burger is sure to satisfy your hunger.", image: .burgur1, rating: 4.9),
        
        FoodItem(name: "Veggie Burger", description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. This burger is perfect for those looking for a tasty and nutritious alternative to traditional beef burgers. Every bite bursts with natural flavors, making it a favorite among veggie lovers.", image: .burgur2, rating: 4.8),
        
        FoodItem(name: "Chicken Burger", description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger! Made with tender chicken breast, lightly seasoned and grilled to perfection, it's served with crisp lettuce, fresh tomatoes, and a special sauce that enhances every bite.", image: .burgur3, rating: 4.6),
        
        FoodItem(name: "Fried Chicken Burger", description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce. The golden, crunchy coating gives way to tender, flavorful chicken inside, creating an irresistible taste experience. Enjoy it with your favorite side for the ultimate meal.", image: .burgur4, rating: 4.5),
        
        FoodItem(name: "Cheeseburger", description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles. The combination of these fresh ingredients creates a deliciously satisfying experience that leaves you craving more. Whether you're enjoying it on the go or as a meal, this burger is sure to satisfy your hunger.", image: .burgur1, rating: 4.9),
        
        FoodItem(name: "Veggie Burger", description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. This burger is perfect for those looking for a tasty and nutritious alternative to traditional beef burgers. Every bite bursts with natural flavors, making it a favorite among veggie lovers.", image: .burgur2, rating: 4.8),
        
        FoodItem(name: "Chicken Burger", description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger! Made with tender chicken breast, lightly seasoned and grilled to perfection, it's served with crisp lettuce, fresh tomatoes, and a special sauce that enhances every bite.", image: .burgur3, rating: 4.6),
        
        FoodItem(name: "Fried Chicken Burger", description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce. The golden, crunchy coating gives way to tender, flavorful chicken inside, creating an irresistible taste experience. Enjoy it with your favorite side for the ultimate meal.", image: .burgur4, rating: 4.5),
        
        FoodItem(name: "Cheeseburger", description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles. The combination of these fresh ingredients creates a deliciously satisfying experience that leaves you craving more. Whether you're enjoying it on the go or as a meal, this burger is sure to satisfy your hunger.", image: .burgur1, rating: 4.9),
        
        FoodItem(name: "Veggie Burger", description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. This burger is perfect for those looking for a tasty and nutritious alternative to traditional beef burgers. Every bite bursts with natural flavors, making it a favorite among veggie lovers.", image: .burgur2, rating: 4.8),
        
        FoodItem(name: "Chicken Burger", description: "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger! Made with tender chicken breast, lightly seasoned and grilled to perfection, it's served with crisp lettuce, fresh tomatoes, and a special sauce that enhances every bite.", image: .burgur3, rating: 4.6),
        
        FoodItem(name: "Fried Chicken Burger", description: "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce. The golden, crunchy coating gives way to tender, flavorful chicken inside, creating an irresistible taste experience. Enjoy it with your favorite side for the ultimate meal.", image: .burgur4, rating: 4.5)
    ]
}
