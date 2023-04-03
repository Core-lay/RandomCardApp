//
//  CWButton.swift
//  Programmatic CardWorkout
//
//  Created by mac on 30/3/23.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title:  String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        layer.cornerRadius = 8
        configure()
    }
    
    func configure() {
        let button = UIButton()
        titleLabel?.font =  .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
