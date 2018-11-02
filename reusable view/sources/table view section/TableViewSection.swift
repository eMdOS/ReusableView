import Foundation

open class TableViewSection<Model, Cell: UITableViewCell> {
    private(set) var items: [Model]
    private let factory: TableViewCellFactory<Model, Cell>

    public init(items: [Model], factory: TableViewCellFactory<Model, Cell>) {
        self.items = items
        self.factory = factory
    }

    open func itemAt(index: Int) -> Model {
        return items[index]
    }

    open func cell(at indexPath: IndexPath, in tableView: UITableView) -> Cell {
        return factory.create(items[indexPath.row], indexPath, tableView)
    }
}

// MARK: - TableViewSectionType

extension TableViewSection: TableViewSectionType {
    public var numberOfRows: Int {
        return items.count
    }

    public func dequeueCell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return factory.create(items[indexPath.row], indexPath, tableView)
    }
}
