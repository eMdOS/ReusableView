import Foundation

public final class TableViewCellFactory<Model, Cell: UITableViewCell> {
    public let create: (Model, IndexPath, UITableView) -> Cell

    public init(_ closure: @escaping (Model, IndexPath, UITableView) -> Cell) {
        create = closure
    }
}
