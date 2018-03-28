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
    
    
    var sections = sectionsData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 54.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "IWU Hours"
        
    }
    
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
        
        let colorRed = UIColor(hex: 0xFF736D)
        let colorYellow = UIColor(hex: 0xfbffa0)
        let colorGreen = UIColor(hex: 0xA8FFA9)
        
        let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)
        
        if sections[section].name == "Baldwin Dining Room" {

            switch hour
            {
            case 7...9, 11...13, 17: header.contentView.backgroundColor = colorGreen
                break
            case 0...6, 10, 14...16, 18...24: header.contentView.backgroundColor = colorRed
                break
            default:header.contentView.backgroundColor = colorRed
            }
            
        }
        
        if sections[section].name == "Wildcat Express" {
            switch hour
            {
            case 8...20: header.contentView.backgroundColor = colorGreen
                break
            case 0...7, 21...24: header.contentView.backgroundColor = colorRed
                break
            default:header.contentView.backgroundColor = colorRed
            }
        }
        
        if sections[section].name == "Trader James" {
            switch hour
            {
            case 10...22: header.contentView.backgroundColor = colorGreen

                break
            case 0...9,24: header.contentView.backgroundColor = colorRed
                break
            case 23: header.contentView.backgroundColor = colorYellow
                break
            default:header.contentView.backgroundColor = colorRed
            }
        }
        
        if sections[section].name == "Mario's Pizza" {
            switch hour
            {
            case 10...22: header.contentView.backgroundColor = colorGreen
                break
            case 0...9,24: header.contentView.backgroundColor = colorRed
                break
            case 23: header.contentView.backgroundColor = colorYellow
                break
            default:header.contentView.backgroundColor = colorRed
            }
        }
        
        if sections[section].name == "McConn Coffee Co." {
            switch hour
            {
            case 7...22: header.contentView.backgroundColor = colorGreen
                break
            case 0...6,24: header.contentView.backgroundColor = colorRed
                break
            case 23: header.contentView.backgroundColor = colorYellow
                break
            default:header.contentView.backgroundColor = colorRed
            }
        }
        
        if sections[section].name == "Jackson Library" {
            switch hour
            {
            case 7...16: header.contentView.backgroundColor = colorGreen
                break
            case 0...6,18...24: header.contentView.backgroundColor = colorRed
                break
            case 17: header.contentView.backgroundColor = colorYellow
                break
            default:header.contentView.backgroundColor = colorRed
            }
        }
        
        if sections[section].name == "Rec Center" {
            switch hour
            {
            case 6...18: header.contentView.backgroundColor = colorGreen
                break
            case 0...6, 20...24: header.contentView.backgroundColor = colorRed
                break
            case 19: header.contentView.backgroundColor = colorYellow
                break
            default:header.contentView.backgroundColor = colorRed
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
        header.arrowLabel.text = ">"
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

