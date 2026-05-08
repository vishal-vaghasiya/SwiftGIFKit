README.md

# SwiftGIFKit

A lightweight and fast GIF rendering library for iOS built with Swift Package Manager.

---

# Features

- GIF support from local files
- GIF support from remote URLs
- Lightweight implementation
- UIKit compatible
- Swift Package Manager support
- iOS 15+

---

# Installation

## Swift Package Manager

In Xcode:

```swift
File → Add Package Dependencies
```

Add your repository URL:

```swift
https://github.com/vishal-vaghasiya/SwiftGIFKit.git
```

---

# Usage

## Import Package

```swift
import SwiftGIFKit
```

---

# Load Remote GIF

```swift
imageView.loadGif(
    url: "https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif"
)
```

---

# Load Local File GIF

```swift
let url = documentsURL.appendingPathComponent("demo.gif")

imageView.loadGif(fileURL: url)
```

---

# Load GIF From App Bundle

```swift
if let url = Bundle.main.url(
    forResource: "demo",
    withExtension: "gif"
) {
    imageView.loadGif(fileURL: url)
}
```

---

# Load GIF From Data

```swift
imageView.loadGif(data: data)
```

---

# Full Example

```swift
import UIKit
import SwiftGIFKit

final class ViewController: UIViewController {

    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        imageView.frame = CGRect(x: 40, y: 200, width: 250, height: 250)
        imageView.contentMode = .scaleAspectFit

        view.addSubview(imageView)

        imageView.loadGif(
            url: "https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif"
        )
    }
}
```

---

# Requirements

- iOS 15+
- Swift 5.9+
- Xcode 15+

---

# License

MIT License
