//
//  BookListViewController.swift
//  MachReader
//
//  Created by ShuichiNagao on 2018/05/09.
//  Copyright © 2018 mach-technologies. All rights reserved.
//

import UIKit
import FolioReaderKit
import MobileCoreServices


class BookListViewController: UIViewController {
    
    private lazy var readerConfig: FolioReaderConfig = {
        let config = FolioReaderConfig(withIdentifier: "SAMPLE")
        config.shouldHideNavigationOnTap = false
        config.scrollDirection = .vertical
        
        config.quoteCustomBackgrounds = []
        config.tintColor = UIColor(red: 0.00, green: 0.66, blue: 0.46, alpha: 1.0)
        let textColor = UIColor(red:0.86, green:0.73, blue:0.70, alpha:1.0)
        let customColor = UIColor(red:0.30, green:0.26, blue:0.20, alpha:1.0)
        let customQuote = QuoteImage(withColor: customColor, alpha: 1.0, textColor: textColor)
        config.quoteCustomBackgrounds.append(customQuote)

        return config
    }()
    
    
    // MARK: - Private method
    
    private func openICloudDrive() {
        let documentPickerController = UIDocumentPickerViewController(documentTypes: [String("org.idpf.epub-container")], in: .import)
        documentPickerController.delegate = self
        present(documentPickerController, animated: true)
    }

    
    // MARK: - IBAction method
    
    @IBAction private func handleICloudButton(_ sender: Any) {
        openICloudDrive()
    }
}

// MARK: - UIDocumentPickerDelegate
extension BookListViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("opened url : \(url)")
        
        let folioReader = FolioReader()
        folioReader.presentReader(parentViewController: self, withEpubPath: url.path, andConfig: readerConfig)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("cancelled")
    }
}
