//
//  GeoModel.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class GeoModel: Decodable {
    let lat: String
    let lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    
    enum CodingKeys: CodingKey {
        case lat
        case lng
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(String.self, forKey: .lat)
        self.lng = try container.decode(String.self, forKey: .lng)
    }
}
