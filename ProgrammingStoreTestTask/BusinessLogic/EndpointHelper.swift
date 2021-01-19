//
//  EndpointFactory.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

typealias ImageSize = (width: Int, height: Int)

struct EndpointHelper {
    private let baseUrl = "https://via.placeholder.com"
    private var randomColor: String {
        UIColor().random.hex
    }
}

extension EndpointHelper {
    func url(
        _ size: ImageSize,
        _ color: UIColor? = nil
    ) -> URL? {
        let appliedColor: String
        if let color = color {
            appliedColor = color.hex
        } else {
            appliedColor = randomColor
        }
        return URL(string: baseUrl + "/\(size.width)x\(size.height)/" + appliedColor)
    }
}
