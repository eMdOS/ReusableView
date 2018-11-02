import Foundation

extension NibLoadableView where Self: UIViewController {
    public static var nibName: String {
        return String(describing: self)
    }
}
