//
//  CustomTextField.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 26.04.2022.
//

import UIKit

class CustomTextField: UITextField {
    var textPadding = UIEdgeInsets(
        top: 13,
        left: 6,
        bottom: 13,
        right: 12
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TextField touched")
    }
}


