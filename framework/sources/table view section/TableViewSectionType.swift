import UIKit

public protocol TableViewSectionType {
    var numberOfRows: Int { get }
    func dequeueCell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}
