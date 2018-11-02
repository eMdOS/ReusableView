import Foundation

extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return String(describing: self)
    }
}
