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
        Item(name: "ADD HOURS", detail:"ADD MENU?"),
    ]),
    
    Section(name: "Wildcat", items: [
        Item(name: "ADD HOURS", detail: ""),
    ]),
    
    Section(name: "McConn", items: [
        Item(name: "ADD HOURS", detail: ""),
        ]),
    
    Section(name: "Post Office", items: [
        Item(name: "ADD HOURS", detail: ""),
        ]),
    
    Section(name: "Bookstore", items: [
        Item(name: "ADD HOURS", detail: ""),
        ]),
    
    Section(name: "Library", items: [
        Item(name: "ADD HOURS", detail: ""),
        ]),
    
    Section(name: "Recreation and Wellness Center", items: [
        Item(name: "Weight Room", detail: "ADD HOURS"),
        Item(name: "Intramural Gym", detail: "ADD HOURS"),
        Item(name: "Rock Wall", detail: "ADD HOURS"),
        Item(name: "Pool", detail: "ADD HOURS"),
        ]),
]




