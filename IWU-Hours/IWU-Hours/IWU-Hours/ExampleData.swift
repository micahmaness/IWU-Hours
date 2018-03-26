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
    Section (name: "Baldwin Dining Room", items: [
        Item(name: "Baldwin Dining Room", detail: "BREAKFAST\nMonday - Friday: 7:00 a.m - 10:00 a.m * No Breakfast on Weekends\n\nLUNCH\nMonday - Friday: 11:00 a.m. - 2:00 p.m.\nSaturday: 11:30 a.m - 12:30 p.m.\nSunday: 11:30 a.m - 1:15 p.m.\n\nDINNER\nMonday-Thursday 5:00 p.m. - 6:30 p.m.\nFriday-Sunday: 5:00 p.m. - 6:00 p.m.")
        ]),
    Section (name: "Wildcat Express", items: [
        Item(name: "Wildcat Express", detail: "Monday - Friday: 8:30 a.m. - 9:00 p.m. \nSaturday: 12:30 p.m - 5:00 p.m.\n\nChick-fil-a Meal Swipes\nMonday - Friday 2:00 p.m. - 9:00 p.m.\nSaturday All Day")
        ]),
    Section (name: "Trader James", items:[
        Item(name: "Trader James", detail: "Monday - Friday: 10:00 a.m. - Midnight\nSaturday: 2:00 p.m - Midnight")
        ]),
    Section (name: "Mario's Pizza", items:[
        Item(name: "Mario's Pizza & Wilbur's Wild Wings", detail: "Monday - Friday: 10:00 a.m. - Midnight\nSaturday-Sunday: 6:00 p.m - 12:00 a.m. Midnight ")
        ]),
    Section (name: "McConn Coffee Co.", items:[
        Item(name: "McConn Coffee Co.", detail: "Monday - Friday: 7:00 a.m. - 11:30 p.m\nSaturday: 9:00 a.m - 11:30 p.m\nSunday: 7:00 PM - 11:30 p.m\n*MWF closed from 9:30 - 11:00 for chapel services.")
        ]),
    Section (name: "Jackson Library", items:[
        Item(name: "Jackson Library", detail: "Monday - Thursday: 7:30 a.m. - Midnight\nFriday: 7:30 a.m. to 6 p.m.\nSaturday: 11 a.m. - 8 p.m.")
        ]),
    Section (name: "Rec Center", items:[
        Item(name: "Recreation and Wellness Center", detail: "Monday - Thursday: 6 a.m. - 11 p.m. \nFriday: 6 a.m. - 7 p.m. \nSaturday: 8 a.m. - 7 p.m. \nSunday: 2 p.m. - 5 p.m., 8 p.m. - 10 p.m.\n*Free Weight Room closes M-F from 8 a.m. - 12:00 p.m."),
        Item(name: "Rock Wall", detail: "Monday - Thursday: 6 p.m. - 10 p.m.\nFriday: 4 p.m. - 7 p.m.\nSaturday: 1 p.m. - 5 p.m.\nSunday: CLOSED")
        //Dorms/Girl Hours
        //Baldwin Menu??
        //Chapel/Chapel Schedule
        ])
    
]

