//
//  Employee.swift
//  SegmentedControl
//
// raywenderlich: https://www.raywenderlich.com/3418439-encoding-and-decoding-in-swift
//  Created by Emiliano Barbosa on 16/05/21.
//

import Foundation

// MARK: - Toy
struct Toy: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case name, id
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
    }
    var id: Int?
    var name: String?
}
extension Toy {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
    }
}

// MARK: - Employee
struct Employee: Codable {
    enum CodingKeys: CodingKey {
        case name, id, gift
    }
    enum GiftKeys: CodingKey {
        case toy
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        var giftConteiner = container.nestedContainer(keyedBy: GiftKeys.self, forKey: .gift)
        try giftConteiner.encode(favoriteToy, forKey: .toy)
    }
    
    var id: Int?
    var name: String?
    var favoriteToy: Toy?
}
extension Employee {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        id = try? container.decode(Int.self, forKey: .id)
        let giftContainer = try container.nestedContainer(keyedBy: GiftKeys.self, forKey: .gift)
        favoriteToy = try? giftContainer.decode(Toy.self, forKey: .toy)
    }
}
