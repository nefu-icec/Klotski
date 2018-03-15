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
    var x = 0, y = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var images: [UIImage] = []
        let smallWidth = width / part
        for i in 0...(part - 1) {
            for j in 0...(part - 1) {
                images.append((UIImage(named: "demo.jpg")?.crop(bounds: CGRect(x: i * width / part,
                                                                               y: j * width / part,
                                                                               width: smallWidth,
                                                                               height: smallWidth)))!)
            }
        }
        
        let imageButtons = [[imageButton1, imageButton2, imageButton3],
                            [imageButton4, imageButton5, imageButton6],
                            [imageButton7, imageButton8, imageButton9]]

        let ground = randomGround(2)
        for i in 0...(part - 1) {
            for j in 0...(part - 1) {
                if ground[i][j] != -1 {
                    imageButtons[j][i]?.setBackgroundImage(images[ground[i][j]], for: .normal)
                } else {
                    x = i
                    y = j
                }
            }
        }
        
        print("\(x) \(y)")
    }
    
    @IBAction func click(_ sender: UIButton) {
        let exchangeX = sender.tag % part
        let exchangeY = (sender.tag - exchangeX) / part
        if (x - 1 == exchangeX && y == exchangeY) ||
            (x + 1 == exchangeX && y == exchangeY) ||
            (x == exchangeX && y - 1 == exchangeY) ||
            (x == exchangeX && y + 1 == exchangeY) {
            
        } else {
            let alertController = UIAlertController(title: "Tip",
                                                    message: "Cannot exchange!",
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func randomGround(_ n: Int) -> [[Int]] {
        var ground = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, -1]]

        var x = part - 1, y = part - 1
        
        for _ in 0...(n - 1) {
            var newX = x, newY = y
            repeat {
                newX = x
                newY = y
                if arc4random_uniform(2) == 0 {
                    newX += arc4random_uniform(2) == 0 ? -1 : 1
                } else {
                    newY += arc4random_uniform(2) == 0 ? -1 : 1
                }
            } while((newX < 0 || newX > part - 1) || (newY < 0 || newY > part - 1))
            
            
            let tmp = ground[x][y]
            ground[x][y] = ground[newX][newY]
            ground[newX][newY] = tmp
            x = newX
            y = newY

            printGround(ground)
        }
        return ground
    }
    
    func printGround(_ ground: [[Int]]) {
        for i in 0...2 {
            for j in 0...2 {
                print("\(ground[i][j]) ", terminator: " ")
            }
            print("\n")
        }
        print("--------")
    }
}
