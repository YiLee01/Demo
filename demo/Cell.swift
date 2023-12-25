//
//  Cell.swift
//  demo
//
//  Created by YL on 2023/12/25.
//

import Foundation
import SnapKit

class MessageCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var contentLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var avatarView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var badgeView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var badgeLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 在这里进行其他必要的初始化操作
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(avatarView)
        contentView.addSubview(badgeView)
        badgeView.addSubview(badgeLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-20)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.equalTo(titleLabel)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.right.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        avatarView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        badgeView.snp.makeConstraints { (make) in
            make.right.equalTo(avatarView)
            make.top.equalTo(avatarView)
            make.width.height.equalTo(20)
        }
        
        badgeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

@available(iOS 17, *)
#Preview {
    MessageCell()
}
