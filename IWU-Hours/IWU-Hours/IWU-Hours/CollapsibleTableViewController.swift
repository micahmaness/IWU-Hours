/* IWU-Hours
 * Micah Maness, Matthew Baab, Sam Diefenbacher
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

import UIKit
import Foundation


//
// MARK: - View Controller
//

class CollapsibleTableViewController: UITableViewController {
    /*
    lazy var refresher: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
       refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    */
    var sections = sectionsData

    override func viewDidLoad() {
        super.viewDidLoad()
        //ableView.refreshControl = refresher
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 54.0
        tableView.rowHeight = UITableViewAutomaticDimension
        self.title = "IWU Hours"

    }
    /*
    @objc
    func requestData()
    {
        print("refreshed")
        let deadline = DispatchTime.now() + .milliseconds(700)
        DispatchQueue.main.asyncAfter(deadline: deadline){
        self.refresher.endRefreshing()
        }
    }
    */
}
//
// MARK: - View Controller DataSource and Delegate
//
extension CollapsibleTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        


        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        let day = NSCalendar.current.component(.weekday,from: NSDate() as Date)
        let hour = NSCalendar.current.component(.hour,from: NSDate() as Date)
        let minute = 60 - NSCalendar.current.component(.minute,from: NSDate() as Date)
        let BaldwinOpenBreakfast = [7,8,9]
        let BaldwinOpenLunch = [11,12,13]
        let BaldwinOpenDinner = [17]
        let WildcatOpen = [8,9,10,11,12,13,14,15,16,17,18,19,20]
        let TraderjamesOpen = [9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
        let MariosOpen = [9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
        let McconnOpen = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]
        let JacksonOpen = [7,8,9,10,11,12,13,14,15,16,17]
        let RecOpen = [7,8,9,10,11,12,13,14,15,16,17,18]
        
        let BaldwinWeekdayBreakfast = "Breakfast: 7am-10am"
        let BaldwinWeekdayLunch = "Lunch: 11am-2pm"
        let BaldwinMon_ThuDinner = "Dinner: 5pm-6:30pm"
        let BaldwinFridayDinner = "Dinner: 5pm-6pm"
        let BaldwinSaturdayLunch = "Brunch: 11:30am-12:30pm"
        let BaldwinSaturdayDinner = "Dinner: 5pm-6pm"
        let BaldwinSundayLunch = "Brunch: 11:30am-1:15pm"
        let BaldwinSundayDinner = "Dinner: 5pm-6pm"

        let WildcatWeekday = "Open 8:30am-9pm, Chick-fil-a meal swipes after 2pm"
        let WildcatSaturday = "Open 12:30pm-5pm, Chick-fil-a meal swipes all day"
        let WildcatSunday = "Open 5pm-9pm, Chick-fil-a closed"
        
        let TraderJWeekday = "Open 10am-Midnight"
        let TraderJSaturday = "Open 2pm-Midnight"
        let TraderJSunday = "7pm-Midnight"
        
        let MariosWeekday = "Open 10am-Midnight"
        let MariosWeekend = "Open 6pm-Midnight"
        
        let McConnMWF = "Open 7am-11:30pm, Closed 9:30am-11am for Chapel"
        let McConnTuTh = "Open 7am-11:30pm"
        let McConnSaturday = "Open 9am-11:30pm"
        let McConnSunday = "Open 7pm-11:30pm"
        
        let JacksonMon_Thu = "Open 7:30am-Midnight"
        let JacksonFriday = "Open 7:30am-6pm"
        let JacksonSaturday = "Open 11am-8pm"
        let JacksonSunday = "Open 8pm-Midnight"
        
        let RecWeekday = "Open 6am-11pm"
        let RecSaturday = "Open 8am-7pm"
        let RecSunday = "Open 2pm-5pm, 8pm-10pm"
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        //let now = dateformatter.string(from: Date()) //Current time
        //let futureDate = Date(timeIntervalSinceNow: 29) //programed time
        //let timeformatClose = "\(sections[section].name) Opens In \(24 - hour)"
        //let timeformatOpen = "\(sections[section].name) Closes In \(24 - hour)"

        let colorRed = UIColor(hex: 0xFF736D)
        //let colorYellow = UIColor(hex: 0xfbffa0)
        let colorGreen = UIColor(hex: 0xA8FFA9)
        
        if sections[section].name == "Baldwin Dining Room" {
            if BaldwinOpenBreakfast.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinWeekdayBreakfast)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSundayLunch)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSaturdayLunch)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
            }
            else if BaldwinOpenLunch.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinWeekdayLunch)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSundayLunch)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSaturdayLunch)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
            }
            else if BaldwinOpenDinner.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=5{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinMon_ThuDinner)")]
                }
                else if day == 6{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinFridayDinner)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSundayDinner)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(BaldwinOpenLunch.last! - hour) hours and \(minute) minutes", detail: "\(BaldwinSaturdayDinner)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
            }
            else if !BaldwinOpenDinner.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(BaldwinOpenBreakfast[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
            }
            //Bug find!!! All non-open times default to checking for next breakfast, need intermediate closed options!
        }
        if sections[section].name == "Wildcat Express" {
            if WildcatOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(WildcatOpen.last! - hour) hours and \(minute) minutes", detail: "\(WildcatWeekday)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(WildcatOpen.last! - hour) hours and \(minute) minutes", detail: "\(WildcatSunday)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(WildcatOpen.last! - hour) hours and \(minute) minutes", detail: "\(WildcatSaturday)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(WildcatOpen.contains(hour) == true)
            }
            if !WildcatOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(WildcatOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!WildcatOpen.contains(hour) == true)
            }
        }
        if sections[section].name == "Trader James" {
          
            if  TraderjamesOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(TraderjamesOpen.last! - hour) hours and \(minute) minutes", detail: "\(TraderJWeekday)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(TraderjamesOpen.last! - hour) hours and \(minute) minutes", detail: "\(TraderJSunday)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(TraderjamesOpen.last! - hour) hours and \(minute) minutes", detail: "\(TraderJSaturday)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(TraderjamesOpen.contains(hour) == true)
            }
            if !TraderjamesOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(TraderjamesOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!TraderjamesOpen.contains(hour) == true)
            }
        }
        if sections[section].name == "Mario's Pizza" {

            if  MariosOpen.contains(hour)
            {
                
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(MariosOpen.last! - hour) hours and \(minute) minutes", detail: "\(MariosWeekday)")]
                }
                else if day == 1 || day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(MariosOpen.last! - hour) hours and \(minute) minutes", detail: "\(MariosWeekend)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(MariosOpen.contains(hour) == true)
            }
            if !MariosOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(MariosOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!MariosOpen.contains(hour) == true)
            }
        }
        if sections[section].name == "McConn Coffee Co." {
            if  McconnOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day == 2 || day == 4 || day == 6{
                    sections[section].items = [Item.init(name: "Closes in \(McconnOpen.last! - hour) hours and \(minute) minutes", detail: "\(McConnMWF)")]
                }
                else if day == 3 || day == 5{
                    sections[section].items = [Item.init(name: "Closes in \(McconnOpen.last! - hour) hours and \(minute) minutes", detail: "\(McConnTuTh)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(McconnOpen.last! - hour) hours and \(minute) minutes", detail: "\(McConnSunday)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(McconnOpen.last! - hour) hours and \(minute) minutes", detail: "\(McConnSaturday)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(McconnOpen.contains(hour) == true)
            }
            if !McconnOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(McconnOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!McconnOpen.contains(hour) == true)
            }
        }
        if sections[section].name == "Jackson Library" {
            if  JacksonOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=5{
                    sections[section].items = [Item.init(name: "Closes in \(JacksonOpen.last! - hour) hours and \(minute) minutes", detail: "\(JacksonMon_Thu)")]
                }
                else if day == 6{
                    sections[section].items = [Item.init(name: "Closes in \(JacksonOpen.last! - hour) hours and \(minute) minutes", detail: "\(JacksonFriday)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(JacksonOpen.last! - hour) hours and \(minute) minutes", detail: "\(JacksonSaturday)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(JacksonOpen.last! - hour) hours and \(minute) minutes", detail: "\(JacksonSunday)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(JacksonOpen.contains(hour) == true)
            }
            if !JacksonOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(JacksonOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!JacksonOpen.contains(hour) == true)
            }
        }
        if sections[section].name == "Rec & Wellness Center" {
            if  RecOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorGreen
                if day>=2 && day<=6{
                    sections[section].items = [Item.init(name: "Closes in \(RecOpen.last! - hour) hours and \(minute) minutes", detail: "\(RecWeekday)")]
                }
                else if day == 7{
                    sections[section].items = [Item.init(name: "Closes in \(RecOpen.last! - hour) hours and \(minute) minutes", detail: "\(RecSaturday)")]
                }
                else if day == 1{
                    sections[section].items = [Item.init(name: "Closes in \(RecOpen.last! - hour) hours and \(minute) minutes", detail: "\(RecSunday)")]
                }
                assert(header.contentView.backgroundColor == colorGreen)
                assert(RecOpen.contains(hour) == true)
            }
            if !RecOpen.contains(hour)
            {
                header.contentView.backgroundColor = colorRed
                sections[section].items = [Item.init(name: "Opens in \(RecOpen[0] - hour) hours and \(minute) minutes", detail: "")]
                assert(header.contentView.backgroundColor == colorRed)
                assert(!RecOpen.contains(hour) == true)
            }
        }

        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        // --------------------------------------------------------------
        
        // Header Label
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = "\u{25C8}"
        header.titleLabel.font = UIFont.systemFont(ofSize: 28)
        header.arrowLabel.font = UIFont.systemFont(ofSize: 24)
        
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension CollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
    //
    //Reorder Cells
    //
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = sections[sourceIndexPath.section]
        sections.remove(at: sourceIndexPath.section)
        sections.self.insert(movedObject, at: destinationIndexPath.section)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.section) \(sections)")
        self.tableView.reloadData() //Checks correctness of items in sections
    }
    
    //
    // Disable the delete buttons
    //
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        if section == 0 {
            return UIColor.red
        } else if section == 1 {
            return UIColor.green
        } else if section == 2 {
            return UIColor.brown
        }
        return UIColor.blue
    }

}

