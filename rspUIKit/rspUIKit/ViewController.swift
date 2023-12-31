//
//  ViewController.swift
//  rspUIKit
//
//  Created by 김윤우 on 2023/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    let rsp: [String] = ["", "scissors", "rock", "paper"]
    
     // var computerImage: UIImageView!
        
    var computerImage: UIImageView!
    var userImage: UIImageView!
    
    
    @IBOutlet weak var resultMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func selectedButton(_ sender: UIButton) {
        let rspRandomIndex: Int = Int.random(in: 1...3)
         
        
        loadImage(imageName: rsp[rspRandomIndex])
        userImage(imageName: rsp[sender.tag ])
        
        if sender.tag  == rspRandomIndex {
            resultMessage.text = "비겼습니다"
            
        } else if (sender.tag  % 3) + 1 == rspRandomIndex {
            resultMessage.text = "졌습니다"
            
        } else {
            resultMessage.text = "이겼습니다"
        }
        print("random\(rspRandomIndex)")
        print("random\(rspRandomIndex)")
        print("tag: \(sender.tag )")
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resultMessage.text = "아래 버튼을 선택 하세요"
        loadImage(imageName: "")
        //subview를 돌면서 모든 imageView를 찾아 삭제
        for subview in self.view.subviews {
            if let imageView = subview as? UIImageView {
                imageView.removeFromSuperview()
            }
        }

        
    }
    
    
    func loadImage(imageName: String) {
        let image: UIImage? = UIImage(named: imageName)
        computerImage = UIImageView(image: image)
        computerImage.frame = CGRect(x: 237, y: 180, width: 140, height: 178)
        view.addSubview(computerImage)
        computerImage.setNeedsDisplay()
    }
    
    func userImage(imageName: String) {
        let image: UIImage? = UIImage(named: imageName)
        userImage = UIImageView(image: image)
        userImage.frame = CGRect(x: 16, y: 180, width: 140, height: 178)
        view.addSubview(userImage)
        userImage.setNeedsDisplay()
    }
    
    }


/*
 
 */
