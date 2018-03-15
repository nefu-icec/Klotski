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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let image1 = UIImage(named: "demo.jpg")?.crop(bounds: CGRect(x: 0, y: 0, width: 374, height: 374))
        imageButton1.setBackgroundImage(image1, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
