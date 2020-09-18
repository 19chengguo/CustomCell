//
//  CommentsCell.swift
//  ChengGuo
//
//  Created by ChengGuoTech || CG-005 on 2020/9/15.
//  Copyright © 2020 ChengGuoTech || CG-005. All rights reserved.
//

import UIKit

class CommentsViewCell: UITableViewCell {
    typealias Nothing = () -> ()

    @IBOutlet weak var imageContent: UIView!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var contentWithBottom: NSLayoutConstraint!

    var last_bottom :CGFloat = 0
    
    var row_bottom: CGFloat = 0
    
    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    //img
    @IBOutlet weak var lastHeight: NSLayoutConstraint!
    @IBOutlet weak var imageContentBottom: NSLayoutConstraint!
    
    
    var callBackHeight: Nothing?
    
    var isShow = false
    
    var imgDatas:[String]?{
        didSet{

            let row: CGFloat = 3.0
            let img_w:CGFloat = 85
            let padding:CGFloat = 10.0
            
            let len = imgDatas!.count
            
            
            
            for i in 0..<len{
                let rowX  = CGFloat(i).truncatingRemainder(dividingBy: row)
                
                let X = rowX * (img_w + padding)
                
                let Y = CGFloat(i/Int(row)) * (img_w+padding)
                
                let img = UIImageView.init(frame: CGRect.init(x: X, y: Y, width: img_w, height: img_w))
                img.backgroundColor = UIColor.orange
                img.isUserInteractionEnabled = true
                
                imageContent.addSubview(img)
                 
                
                if i == 2 {
                    let btn = UIButton.init(type: .custom)
                    btn.frame = .init(x: 0, y: 0, width: img_w, height: img_w)
                    btn.backgroundColor = .black
                    btn.addTarget(self, action: #selector(change), for: UIControl.Event.touchUpInside)
                    img.addSubview(btn)
                    row_bottom = img.frame.origin.y + img.frame.size.height

                }
//
                
                
                //获取最后一个button高度
                if i == len-1{
                    print(rowX,X,Y,i,img.bounds)
                    last_bottom = img.frame.origin.y + img.frame.size.height
                }
                
            }
            contentWithBottom.isActive = false
            contentWithBottom.priority = .defaultLow
            
            lastHeight.priority = .defaultHigh
            lastHeight.constant = row_bottom
            
            imageContent.isHidden = false;
            imageContent.clipsToBounds = true
            self.layoutIfNeeded()
        }
    }
    
    @objc func change(){
        imageContent.isHidden = false;

        contentWithBottom.isActive = false
        contentWithBottom.priority = .defaultLow
        labelHeight.priority = UILayoutPriority(rawValue: 1000)
        labelHeight.constant = 81.5
        
        if(isShow){
            lastHeight.priority = UILayoutPriority(rawValue: 999)
            lastHeight.constant = last_bottom
        }else{
            lastHeight.priority = UILayoutPriority(rawValue: 999)
            lastHeight.constant = row_bottom
        }

        isShow = !isShow
        callBackHeight?()
//        self.layoutIfNeeded()
        
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if imgDatas != nil {
            imageContent.isHidden = false
            
            lastHeight.priority = .defaultLow
            
            imageContentBottom.priority = .defaultHigh
        }else{
            imageContent.isHidden = true
            contentWithBottom.isActive = true
            contentWithBottom.priority = .defaultHigh
            imageContentBottom.priority = .defaultLow
            self.layoutIfNeeded()
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CommentsViewCell{
        fileprivate func test() {
    //        for _ in imgDatas!{
    //            let img = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    //            img.backgroundColor = .black
    //            stackView.addArrangedSubview(img)
    //        }
    //
    //
    //        stackView.isHidden = false
    //        stackViewTop.priority = .defaultHigh
    //        stackViewLeft.priority = .defaultHigh
    //        stackViewRight.priority = .defaultHigh
    //        stackViewBottm.priority = .defaultHigh
    //        contentWithBottom.priority = .defaultLow
    //        NSLayoutConstraint.activate([stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4)])
    //
    //        self.layoutIfNeeded()
        }
    
        fileprivate func test2() {
            // Initialization code
            
    //        if (imgDatas != nil) {
    //            stackViewTop.priority = .defaultHigh
    //            stackViewLeft.priority = .defaultHigh
    //            stackViewRight.priority = .defaultHigh
    //            stackViewBottm.priority = .defaultHigh
    //            NSLayoutConstraint.activate([stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4)])
    //            contentWithBottom.priority = .defaultLow
    //        }else{
    //            stackView.isHidden = true
    //            contentWithBottom.priority = .defaultHigh
    //
    //        }
    //        self.layoutIfNeeded()
        }
}
