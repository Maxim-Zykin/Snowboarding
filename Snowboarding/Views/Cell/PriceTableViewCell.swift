//
//  PriceTableViewCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 23.07.2023.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    static let cellID = "PriceCell"
    
    let liftNameLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.textColor = UIColor.black
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return text
    }()
    
    let costLabel: UILabel = {
        let text = UILabel()
        text.textColor = UIColor.black
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(liftNameLabel)
        contentView.addSubview(costLabel)
        contentView.backgroundColor = .white
        
        liftNameLabel.frame = CGRect(x: 15, y: 0, width: 300, height: contentView.frame.size.height)
        costLabel.frame = CGRect(x: contentView.frame.size.height+100, y: 5, width: 300, height: contentView.frame.size.height-10)
    }
}
