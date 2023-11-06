//
//  TimeWorkTableViewCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 23.07.2023.
//

import UIKit

class TimeWorkTableViewCell: UITableViewCell {

    static let cellID = "TimeWorkCell"
    
    let liftNameLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 3
        text.textColor = UIColor.black
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return text
    }()
    
   let timeWork: UILabel = {
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
        contentView.addSubview(timeWork)
        contentView.backgroundColor = .white
        
//        liftNameLabel.frame = CGRect(x: 15, y: 5, width: 1000, height: contentView.frame.size.height-10)
//        timeWork.frame = CGRect(x: contentView.frame.size.height+110, y: 18, width: 300, height: contentView.frame.size.height-10)
        
        liftNameLabel.frame = CGRect(x: 15, y: 0, width: 200, height: contentView.frame.size.height)
        timeWork.frame = CGRect(x: contentView.frame.size.height+90, y: 5, width: 300, height: contentView.frame.size.height-10)
    }
}
