//
//  ClassTableViewCell.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/05.
//

import UIKit
import SnapKit

class ClassTableViewCell: UITableViewCell {
//     썸네일, 운영기관, 운영기간 정보
    let thumbImageView = UIImageView()
    
    let classLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    let agencyLabel = UILabel()
    let dateLabel = UILabel()
    
    
    func drawCell(myClass : Class){
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(thumbImageView)
        
        thumbImageView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(0)
            maker.width.equalTo(165)
        }
        
        ImageManager.shared.setImage(link: myClass.class_image.image["raw"]! , completion: { [weak self] (image) in
            self?.thumbImageView.image = image
        })
       
        self.contentView.addSubview(classLabel)
        classLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.leading.equalTo(thumbImageView.snp.trailing).offset(8)
        }
        classLabel.text = myClass.name
        
    }

    
    override func prepareForReuse() {
        thumbImageView.image = nil
        classLabel.text = ""
    }
}
