import Foundation

extension ReusableView where Self: UIView {
    public static var reusableIdentifier: String {
        return String(describing: self)
    }
}
