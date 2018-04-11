/* IWU-Hours
 * Micah Maness, Matthew Baab, Sam Diefenbacher
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

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
    Section (name: "Baldwin Dining Room", items: []),
    Section (name: "Wildcat Express", items: []),
    Section (name: "Trader James", items:[]),
    Section (name: "Mario's Pizza", items:[]),
    Section (name: "McConn Coffee Co.", items:[]),
    Section (name: "Jackson Library", items:[]),
    Section (name: "Rec & Wellness Center", items:[])
    
]

