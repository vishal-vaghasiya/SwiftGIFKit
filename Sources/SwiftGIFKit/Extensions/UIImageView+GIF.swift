
import UIKit

public extension UIImageView {

    func loadGif(name: String) {

        DispatchQueue.global(qos: .userInitiated).async {

            let image = UIImage.gif(name: name)

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }

    func loadGif(url: String) {

        DispatchQueue.global(qos: .userInitiated).async {

            let image = UIImage.gif(url: url)

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
