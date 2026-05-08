//
//  SwiftGIFKit.swift
//  SwiftGIFKit
//
//  Created by Vishal Vaghasiya on 08/05/26.
//

import UIKit
import ImageIO

public extension UIImage {

    static func gif(data: Data) -> UIImage? {

        guard let source = CGImageSourceCreateWithData(
            data as CFData,
            nil
        ) else {
            return nil
        }

        return GIFAnimator.animatedImage(with: source)
    }

    static func gif(url: String) -> UIImage? {

        guard
            let url = URL(string: url),
            let data = try? Data(contentsOf: url)
        else {
            return nil
        }

        return gif(data: data)
    }

    static func gif(name: String) -> UIImage? {

        guard
            let url = Bundle.main.url(
                forResource: name,
                withExtension: "gif"
            ),
            let data = try? Data(contentsOf: url)
        else {
            return nil
        }

        return gif(data: data)
    }
}
