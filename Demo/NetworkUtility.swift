//
//  NetworkUtility.swift
//  Demo
//
//  Created by 則佑林 on 2021/2/23.
//

import UIKit

struct NetworkUtility {
    static func downloadImage(url: URL, handler: @escaping (UIImage?) -> ()) {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data, let image = UIImage(data: data) {
            handler(image)
        } else {
            handler(nil)
        }
    }
        task.resume()
}
}
