// IWU Hours
// Micah Maness, Matt Babb, Sam D
//

import Foundation

public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(name: "Student Center", items: [
        Item(name: "Game Room", detail: "ADD HOURS"),
        Item(name: "Health Center", detail: "ADD HOURS"),
        Item(name: "Financial Aid", detail: "ADD HOURS"),
        Item(name: "Student Accounts", detail: "ADD HOURS"),
    ]),
    
    Section(name: "Baldwin", items: [
    ]),
    
    Section(name: "Wildcat", items: [
    ]),
    
    Section(name: "McConn", items: [
        ]),
    
    Section(name: "Post Office", items: [
        ]),
    
    Section(name: "Bookstore", items: [
        ]),
    
    Section(name: "Library", items: [
        ]),
    
    Section(name: "Recreation and Wellness Center", items: [
        Item(name: "Weight Room", detail: "ADD HOURS"),
        Item(name: "Intramural Gym", detail: "ADD HOURS"),
        Item(name: "Rock Wall", detail: "ADD HOURS"),
        Item(name: "Pool", detail: "ADD HOURS"),
        ]),
]




