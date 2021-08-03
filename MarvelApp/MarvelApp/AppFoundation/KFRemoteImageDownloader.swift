//
//  KFRemoteImageDownloader.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import Kingfisher
import UIKit

class KFDownloader {
    
    private var url: URL!
    private var imageView: UIImageView!
    
    init(url: URL, withImageView imageView: UIImageView) {
        self.url = url
        self.imageView = imageView
    }
    
    public func startDownload() {
        let processor = DownsamplingImageProcessor(size: self.imageView.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 20)
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: UINames.placeholderImage),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("KFDownloader success: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("KFDownloader failure: \(error.localizedDescription)")
            }
        }
    }
}
