//
//  ViewController.swift
//  MachReader
//
//  Created by ShuichiNagao on 2018/05/05.
//  Copyright © 2018 mach-technologies. All rights reserved.
//

import UIKit
import FolioReaderKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        open()
    }

    func open() {
        //let config = FolioReaderConfig()
        let config = readerConfiguration()
        let bookPath = Bundle.main.path(forResource: "book", ofType: "epub")
        let folioReader = FolioReader()
        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath!, andConfig: config)
    }
    
    private func readerConfiguration() -> FolioReaderConfig {
        let config = FolioReaderConfig(withIdentifier: "SAMPLE")
        config.shouldHideNavigationOnTap = false
        config.scrollDirection = .vertical

        // Custom sharing quote background
        config.quoteCustomBackgrounds = []
        if let image = UIImage(named: "demo-bg") {
            let customImageQuote = QuoteImage(withImage: image, alpha: 0.6, backgroundColor: UIColor.black)
            config.quoteCustomBackgrounds.append(customImageQuote)
        }

        let textColor = UIColor(red:0.86, green:0.73, blue:0.70, alpha:1.0)
        let customColor = UIColor(red:0.30, green:0.26, blue:0.20, alpha:1.0)
        let customQuote = QuoteImage(withColor: customColor, alpha: 1.0, textColor: textColor)
        config.quoteCustomBackgrounds.append(customQuote)

        return config
    }
}

