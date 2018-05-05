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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func open() {
        let config = FolioReaderConfig()
        let bookPath = Bundle.main.path(forResource: "book", ofType: "epub")
        let folioReader = FolioReader()
        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath!, andConfig: config)
    }
}

