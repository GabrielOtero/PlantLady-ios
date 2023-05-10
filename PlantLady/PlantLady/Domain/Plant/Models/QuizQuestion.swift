//
//  QuizQuestion.swift
//  PlantLady
//
//  Created by Gabriel Otero on 10/05/23.
//

import Foundation

// val id: Int, val title: String, val options: List<String>, var answer: Int = 0

struct QuizQuestion : Decodable, Equatable {
    let id: Int
    let title: String
    let options: [String]
    var answer: Int = 0
}
