//
//  InfoCell.swift
//  sem1
//
//  Created by Matvey Garbuzov on 19.04.2022.
//

import UIKit

final class InfoCell: UIView {
    
    struct Model {
        let key: String
        let value: String
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been emplemented")
    }
    
    func update(with model: Model) {
        infoKeyLabel.text = model.key
        infoValueLabel.text = model.value
    }
    
    private func setup() {
        let stack = UIStackView()
        addSubview(stack)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.contentMode = .left
        stack.axis = .vertical
        stack.spacing = 0

        stack.addArrangedSubview(infoKeyLabel)
        stack.addArrangedSubview(infoValueLabel)

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor),
            stack.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private let infoKeyLabel: UILabel = {
        let ret = UILabel()
        ret.font = .boldSystemFont(ofSize: 22)
        ret.textColor = .secondary
        ret.numberOfLines = 1
        return ret
    }()

    private let infoValueLabel: UILabel = {
        let ret = UILabel()
        ret.font = .boldSystemFont(ofSize: 22)
        ret.textColor = .main
        ret.numberOfLines = 1
        return ret
    }()
}
