# ReusableViewKit

## Installation

### CocoaPods

#### Core

```
pod 'ReusableViewKit', '~>1.0.0'
```

#### TableViewSection

```
pod 'ReusableViewKit/TableViewSection', '~>1.0.0'
```

## Usage

### ReusableViewKit/Core

#### Providing the `reusableIdentifier` for a `UIView`

```swift
final class EmojiTableViewCell: UITableViewCell, ReusableView {
    // ..
}
```

#### Providing the `nibName` for a `UIView` or `UIViewController`

```swift
final class EmojiTableViewCell: UITableViewCell, NibLoadableView {
    // ..
}

// or ...

final class EmojisViewController: UIViewController, NibLoadableView {
    // ..
}
```

#### Result

##### TableViewCell registration

```swift
tableView.register(cell: EmojiTableViewCell.self, inBundle: .main)
```

##### TableViewCell dequeuing

```swift
extension EmojisViewController: UITableViewDataSource {
    // ...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmojiTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        // cell configuration ...
        return cell
    }
    // ...
}
```

##### ViewController from `.xib`

```swift
final class EmojisViewController: UIViewController, NibLoadableView {
    // ...
    private init(emojis: [Emoji]) {
        self.emojis = emojis
        super.init(nibName: EmojisViewController.nibName, bundle: .main)
    }
    // ...
}
```

### ReusableViewKit/TableViewSection

???
