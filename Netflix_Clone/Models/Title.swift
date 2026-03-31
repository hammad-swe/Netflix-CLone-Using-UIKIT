//
//  Movie.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 31/03/2026.
//

import Foundation

struct TrendingTitleResponse: Codable, Sendable {
    let results: [Title]
    
}

struct Title: Codable, Sendable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
}
