//
//  GIFView.swift
//  SwiftGIFKit
//
//  Created by Vishal Vaghasiya on 08/05/26.
//

import UIKit
import ImageIO

enum GIFDecoder {

    static func delay(
        for index: Int,
        source: CGImageSource
    ) -> Double {

        let defaultDelay = 0.1

        guard
            let properties = CGImageSourceCopyPropertiesAtIndex(
                source,
                index,
                nil
            ) as? [CFString: Any],

            let gifProperties =
                properties[kCGImagePropertyGIFDictionary]
                as? [CFString: Any]
        else {
            return defaultDelay
        }

        let unclamped =
            gifProperties[kCGImagePropertyGIFUnclampedDelayTime]
            as? Double

        let clamped =
            gifProperties[kCGImagePropertyGIFDelayTime]
            as? Double

        let delay = unclamped ?? clamped ?? defaultDelay

        return delay < 0.02 ? defaultDelay : delay
    }
}
