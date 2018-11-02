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

#### Using the TableViewSection

This is a generic class that constrains the `Model` and `Cell` types for the related section. 

It also implements the `TableViewSectionType` protocol that provides an API for providing the information needed for the `UITableViewDataSource` implementation.

On the other hand, this class is receiving a `TableViewCellFactory` which provides the reusable implementation for creating/dequeuing a `Cell`.

With these players in the game, we have all that we need for correctly displaying data in a TableView.

Example:

```swift
// 1. Constraining the TableViewSection type:

typealias EmojisTableViewSection = TableViewSection<Emoji, EmojiTableViewCell>

// 2. Adding the Emoji cell factory:

static let emojiCellFactory = TableViewCellFactory<Emoji, EmojiTableViewCell> { (emoji, indexPath, tableView) -> EmojiTableViewCell in
    let cell: EmojiTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    cell.configure(with: emoji)
    return cell
}

// 3. Creating the array of sections:

var tableViewSections: [TableViewSectionType] = [
    EmojisTableViewSection(items: emojis, factory: EmojisViewController.emojiCellFactory)
]

// 4. Implementing the `UITableViewDataSource` using the `TableViewSectionType` API:

extension EmojisViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSections[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewSections[indexPath.section].dequeueCell(at: indexPath, in: tableView)
    }
}
```
