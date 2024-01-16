//
//  AddressModel.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class AddressModel: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoModel
    
    init(street: String, suite: String, city: String, zipcode: String, geo: GeoModel) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    
    enum CodingKeys: CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(String.self, forKey: .street)
        self.suite = try container.decode(String.self, forKey: .suite)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipcode = try container.decode(String.self, forKey: .zipcode)
        self.geo = try container.decode(GeoModel.self, forKey: .geo)
    }
}


