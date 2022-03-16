//
//  HabitViewCell.swift
//  MyHabits
//
//  Created by Надежда on 14.03.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.toAutoLayout()
        return view
    }()
    
    var habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = .habitNameFont
        label.toAutoLayout()
        return label
    }()
    
    var targetTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .targetTimeFont
        label.textColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.font = .timerFont
        label.textColor = .darkGray
        label.toAutoLayout()
        return label
    }()
    
    var checkPointImageView: UIImageView = {
        let checkPoint = UIImageView()
        checkPoint.layer.cornerRadius = 19
 //       checkPoint.layer.borderWidth = 1.5
        checkPoint.toAutoLayout()
        return checkPoint
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintsHabitViewCell()
        contentView.backgroundColor = UIColor(named: "allBackgroundColor")
    }
    
    func constraintsHabitViewCell() {
        contentView.addSubview(backView)
        backView.addSubviews([habitNameLabel, targetTimeLabel, timerLabel, checkPointImageView])
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            habitNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            
            targetTimeLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4),
            targetTimeLabel.leadingAnchor.constraint(equalTo: habitNameLabel.leadingAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: targetTimeLabel.bottomAnchor, constant: 30),
            timerLabel.leadingAnchor.constraint(equalTo: targetTimeLabel.leadingAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            
            checkPointImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -25),
            checkPointImageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            checkPointImageView.heightAnchor.constraint(equalToConstant: 38),
            checkPointImageView.widthAnchor.constraint(equalToConstant: 38)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}