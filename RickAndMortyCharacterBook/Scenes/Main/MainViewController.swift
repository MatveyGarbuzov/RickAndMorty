//
//  MainViewController.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 18.06.2022.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    private let RandMTitle = UILabel()
    private let characterBookLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabelSetup()
        bookLabelSetup()
    }
    
    private func titleLabelSetup() {
        RandMTitle.frame = CGRect(x: 0, y: 0, width: 343, height: 258)
        RandMTitle.backgroundColor = .bg
        
        RandMTitle.textColor = .main
        RandMTitle.font = UIFont(name: "SFUIDisplay-Black", size: 72)
        RandMTitle.lineBreakMode = .byWordWrapping
        RandMTitle.numberOfLines = 0
        
        RandMTitle.attributedText = NSMutableAttributedString(string: "RICK\nAND\nMORTY", attributes: [
            NSAttributedString.Key.strokeColor : UIColor.main,
            NSAttributedString.Key.foregroundColor : UIColor.bg,
            NSAttributedString.Key.kern: 3,
            NSAttributedString.Key.strokeWidth : -2.0
        ])
        
        self.view.addSubview(RandMTitle)
        RandMTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            RandMTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            RandMTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            RandMTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func bookLabelSetup() {
        characterBookLabel.frame = CGRect(x: 0, y: 0, width: 343, height: 100)
        characterBookLabel.backgroundColor = .bg
        
        characterBookLabel.textColor = .main
        characterBookLabel.font = UIFont(name: "SFUIDisplay-Black", size: 32)
        characterBookLabel.numberOfLines = 0
        characterBookLabel.lineBreakMode = .byWordWrapping
        
        characterBookLabel.attributedText = NSMutableAttributedString(string: "CHARACTER\nBOOK", attributes: [NSAttributedString.Key.kern: 3])
        
        self.view.addSubview(characterBookLabel)
        characterBookLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterBookLabel.topAnchor.constraint(equalTo: RandMTitle.bottomAnchor, constant: 24),
            characterBookLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            characterBookLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// TODO: Add image
// TODO: Add image
// TODO: Add image
// TODO: Add image
// TODO: Add image
// TODO: Add image
