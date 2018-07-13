//: [Previous](@previous)

import Foundation

struct Language: Codable {
    var name: String
    var version: Int
}

let swift = Language(name: "Swift", version: 4)
let php = Language(name: "PHP", version: 7)
let perl = Language(name: "Perl", version: 6)

let encoder = JSONEncoder()

if let encoded = try? encoder.encode(swift) {
    if let json = String(data: encoded, encoding: .utf8) {
        print(json)
    }
    
    let decoder = JSONDecoder()
    if let decoded = try? decoder.decode(Language.self, from: encoded) {
        print(decoded.name)
    }
}
