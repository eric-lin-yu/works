//
//  FeedData.swift
//  Demo
//
//  Created by 則佑林 on 2021/2/23.
//

import Foundation

struct Media: Decodable {
    let m: URL
}
struct Item: Decodable {
    let title: String
    let media: Media
}
struct FeedData: Decodable {
    let items: [Item]
}
