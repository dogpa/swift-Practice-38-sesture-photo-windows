//
//  ViewController.swift
//  swift Practice # 38 sesture photo windows
//
//  Created by CHEN PEIHAO on 2021/7/19.
//

import UIKit

class ViewController: UIViewController {

    let nameOfPhoto = ["龍泉溪斜射.jpg","七星潭日出.jpg","清水斷涯.jpg","西螺軌跡.jpg","旭海日出.jpg"]
    let NumbersOfPhoto = ["1","2","3","4","5"]
    let titleOfPhoto = ["龍泉溪斜射","七星潭日出","清水斷涯","西螺軌跡","旭海日出"]
    let interduceOfPhoto = [
        "每年只有六月跟八月各一週，斜射光的角度剛好會照射在土城龍泉溪上。",
        "環島旅行的那一年，清晨便騎著單車前往七星潭等待日出",
        "隨性的旅程，世界景觀的清水斷崖映入眼前，台灣這麼的漂亮",
        "深入歷史人文的城鎮，感受車水馬龍的瞬間，在這一秒鐘定格",
        "東海岸總是有著意想不到的景觀，連一個無名的漁港都能有著這麼漂亮的日出"
    ]
    
    var selectIndex: Int = 0
    
    
    //放照片的UILabel
    @IBOutlet weak var taiwanPhotoImageView: UIImageView!
    //小圓點的pageController
    @IBOutlet weak var numbersPageController: UIPageControl!
    //有照片名稱的segmentedController
    @IBOutlet weak var photoSegmentedController: UISegmentedControl!
    //照片的編號label
    @IBOutlet weak var photoNumberLabel: UILabel!
    //照片標題的label
    @IBOutlet weak var titlePhotoLabel: UILabel!
    //照片的介紹label
    @IBOutlet weak var intorducePhotoLabel: UILabel!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //改變照片顯示的圓角
        taiwanPhotoImageView.layer.cornerRadius = 40
        taiwanPhotoImageView.clipsToBounds = true
        
        //預設初始的照片標題、數字編號、內容的顯示內容
        photoNumberLabel.text = NumbersOfPhoto[0]
        titlePhotoLabel.text = titleOfPhoto[0]
        intorducePhotoLabel.text = interduceOfPhoto[0]
        
    }
    
    //建立一個後續使用的function
    func followChange(){
        //照片的名稱跟著照片名稱array的值連動
        taiwanPhotoImageView.image = UIImage(named: nameOfPhoto[selectIndex])
        //pagecontroller個改變會跟著變數連動
        numbersPageController.currentPage = selectIndex
        //segmentedcontroller的改變跟改變變數的值
        photoSegmentedController.selectedSegmentIndex = selectIndex
        //照片編號會跟著編號的array的值改變
        photoNumberLabel.text = NumbersOfPhoto[selectIndex]
        //照片標題內文會跟著照片標題的array的值改變
        titlePhotoLabel.text = titleOfPhoto[selectIndex]
        //照片介紹的內文會跟著照片介紹的array的值改變
        intorducePhotoLabel.text = interduceOfPhoto[selectIndex]
        
    }
    

    
    
    
    //page controller切換不同的值做出不同的改變引入函數的值也跟著不一樣
    //先改變 selectIndex的值後 followChange的值跟著 selectIndex的值變化
    @IBAction func pageControllerChange(_ sender: UIPageControl) {
        selectIndex = sender.currentPage
        if numbersPageController.currentPage == 0 {
            selectIndex = 0
            followChange()
        }else if numbersPageController.currentPage == 1{
            selectIndex = 1
            followChange()
        }else if numbersPageController.currentPage == 2{
            selectIndex = 2
            followChange()
        }else if numbersPageController.currentPage == 3{
            selectIndex = 3
            followChange()
        }else{
            selectIndex = 4
            followChange()
        }
    }
    
    //segmented Controller的改變跟上面的Page Controller相似
    @IBAction func sgmentedChange(_ sender: UISegmentedControl) {
        selectIndex = sender.selectedSegmentIndex
        if photoSegmentedController.selectedSegmentIndex == 0{
            selectIndex = 0
            followChange()
        }else if photoSegmentedController.selectedSegmentIndex == 1{
            selectIndex = 1
            followChange()
        }else if photoSegmentedController.selectedSegmentIndex == 2{
            selectIndex = 2
            followChange()
        }else if photoSegmentedController.selectedSegmentIndex == 3{
            selectIndex = 3
            followChange()
        }else{
            selectIndex = 4
            followChange()
        }
    }
    
    //左側的Button的Action
    @IBAction func previousPhoto(_ sender: UIButton) {
        //每按一下 selectIndex就一直-1
        selectIndex -= 1
        if selectIndex == 4{
            followChange()
        }else if selectIndex == 3{
            followChange()
        }else if selectIndex == 2{
            followChange()
        }else if selectIndex == 1{
            followChange()
        }else if selectIndex == 0 {
            followChange()
        }else{
            //只要不是在0-4之間 就執行selecIndex為4的選項製造無限循環
            selectIndex = 4
            followChange()
        }
    }
    
    
    //右側的Button的Action
    @IBAction func PulsPhoto(_ sender: UIButton) {
        //每按一下就+1
        selectIndex += 1
        if selectIndex == 0{
            followChange()
        }else if selectIndex == 1 {
            followChange()
        }else if selectIndex == 2 {
            followChange()
        }else if selectIndex == 3{
            followChange()
        }else if selectIndex == 4 {
            followChange()
        }else{
            //只要不是在0-4之間 就執行selecIndex 為 0 製造無限循環
            selectIndex = 0
            followChange()
        }
    }
    
    //滑左往右與滑右往左
    @IBAction func nextPhoto(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left{
            selectIndex += 1
            if selectIndex == 0{
                followChange()
            }else if selectIndex == 1 {
                followChange()
            }else if selectIndex == 2 {
                followChange()
            }else if selectIndex == 3{
                followChange()
            }else if selectIndex == 4 {
                followChange()
            }else{
                //只要不是在0-4之間 就執行selecIndex 為 0 製造無限循環
                selectIndex = 0
                followChange()
            }
        }else if sender.direction == .right{
            //每按一下 selectIndex就一直-1
            selectIndex -= 1
            if selectIndex == 4{
                followChange()
            }else if selectIndex == 3{
                followChange()
            }else if selectIndex == 2{
                followChange()
            }else if selectIndex == 1{
                followChange()
            }else if selectIndex == 0 {
                followChange()
            }else{
                //只要不是在0-4之間 就執行selecIndex為4的選項製造無限循環
                selectIndex = 4
                followChange()
            }
        }
    }
    
    @IBAction func photoRandom(_ sender: UIButton) {
        selectIndex = .random(in: 0...4)
        followChange()
    }
    
    
    
    
}

