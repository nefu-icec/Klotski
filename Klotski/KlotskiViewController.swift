//
//  KlotskiViewController.swift
//  Klotski
//
//  Created by 李大爷的电脑 on 14/03/2018.
//  Copyright © 2018 softlab. All rights reserved.
//

import UIKit
import AFImageHelper

class KlotskiViewController: UIViewController {
    
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    @IBOutlet weak var imageButton3: UIButton!
    @IBOutlet weak var imageButton4: UIButton!
    @IBOutlet weak var imageButton5: UIButton!
    @IBOutlet weak var imageButton6: UIButton!
    @IBOutlet weak var imageButton7: UIButton!
    @IBOutlet weak var imageButton8: UIButton!
    @IBOutlet weak var imageButton9: UIButton!
    
    let width = 900
    let part = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageButtons = [[imageButton1, imageButton2, imageButton3],
                            [imageButton4, imageButton5, imageButton6],
                            [imageButton7, imageButton8, imageButton9]]
        let smallWidth = width / part
        for i in 0...(part - 1) {
            for j in 0...(part - 1) {
                let image = UIImage(named: "demo.jpg")?.crop(bounds: CGRect(x: i * width / part,
                                                                            y: j * width / part,
                                                                            width: smallWidth,
                                                                            height: smallWidth))
                imageButtons[j][i]?.setBackgroundImage(image, for: .normal)
            }
        }
    }
}
