import Foundation

// MARK: - Registration

extension UITableView {
    public func register<Cell: UITableViewCell>(cell: Cell.Type, inBundle bundle: Bundle) where Cell: ReusableView, Cell: NibLoadableView {
        let nib = UINib(nibName: Cell.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: Cell.reusableIdentifier)
    }

    public func register<View: UITableViewHeaderFooterView>(headerFooterView: View.Type, inBundle bundle: Bundle) where View: ReusableView, View: NibLoadableView {
        let nib = UINib(nibName: View.nibName, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: View.reusableIdentifier)
    }
}

// MARK: - Dequeuing

extension UITableView {
    public func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell where Cell: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(Cell.reusableIdentifier)")
        }
        return cell
    }

    public func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>() -> View where View: ReusableView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.reusableIdentifier) as? View else {
            fatalError("Could not dequeue header/footer view with identifier: \(View.reusableIdentifier)")
        }
        return view
    }
}
