
import UIKit
import ImageIO

internal enum GIFAnimator {

    static func animatedImage(
        with source: CGImageSource
    ) -> UIImage? {

        let count = CGImageSourceGetCount(source)

        var images: [CGImage] = []
        var delays: [Int] = []

        for index in 0..<count {

            guard let image = CGImageSourceCreateImageAtIndex(
                source,
                index,
                nil
            ) else {
                continue
            }

            images.append(image)

            let delay = GIFDecoder.delay(
                for: index,
                source: source
            )

            delays.append(Int(delay * 1000))
        }

        let duration = delays.reduce(0, +)

        let gcd = GIFMath.gcd(for: delays)

        var frames: [UIImage] = []

        for index in 0..<count {

            let frame = UIImage(cgImage: images[index])

            let repeatCount = delays[index] / gcd

            for _ in 0..<repeatCount {
                frames.append(frame)
            }
        }

        return UIImage.animatedImage(
            with: frames,
            duration: Double(duration) / 1000
        )
    }
}
