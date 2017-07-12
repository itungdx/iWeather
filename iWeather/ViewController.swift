//
//  ViewController.swift
//  iWeather
//
//  Created by Tung on 6/15/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_quote: UILabel!
    @IBOutlet weak var lbl_nhietDo: UILabel!
    var temp : Int!
    var status : String!
    @IBOutlet weak var btn_changeTemp: UIButton!
    @IBAction func btn_changeTemp(_ sender: UIButton) {
        if status == "C" {
            temp = Int(lbl_nhietDo.text!)! + 63
            btn_changeTemp.setTitle("F", for: .normal)
            lbl_nhietDo.text = String(temp)
            status = "F"
        }else{
            temp = Int(lbl_nhietDo.text!)! - 63
            btn_changeTemp.setTitle("C", for: .normal)
            lbl_nhietDo.text = String(temp)
            status = "C"
        }
    }
    @IBAction func btn_refesh(_ sender: UIButton) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        let backgroundIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        lbl_city.text = city[cityIndex]
        lbl_quote.text = quote[quoteIndex]
        lbl_nhietDo.text = String(tempRandom())
        background.image = UIImage.init(named: backgroundImage[backgroundIndex])
    }
    @IBOutlet weak var background: UIImageView!
    var quote = ["'Xa cách đối với tình yêu như gió đối với lửa : nó thổi tắt ngọn lửa nhỏ nhưng thổi bùng ngọn lửa lớn.","Vẻ đẹp đánh vào ánh mắt nhưng phẩm giá chinh phục tâm hồn"]
    var city = ["Ha Noi","Ho Chi Minh"]
    var backgroundImage = ["Blood","Moon","Sun"]
    override func viewDidLoad() {
        super.viewDidLoad()
        status = "C"
        
    }
    func tempRandom() -> Int{
        return Int(arc4random_uniform(40))
    }
}

