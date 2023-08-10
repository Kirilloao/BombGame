//
//  CategoryTestModel.swift
//  BombGame
//
//  Created by Kirill Taraturin on 09.08.2023.
//

import Foundation

struct Category {
    var image: String
    var name: String
    
    static func getGategories() -> [Category] {
        
        var allCategories: [Category] = []
        for (key, value) in categories {
            allCategories.append(Category(image: value, name: key))
        }
        
        return allCategories
    }
}

let categories = [
    "Природа" : "flower",
    "Исскуство и кино": "cinema",
    "Разное" : "planet",
    "Cпорит и хобби": "sports"
]
