//
//  SearchViewController.swift
//  RickAndMortyCharacterBook
//
//  Created by Matvey Garbuzov on 26.04.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BG
        
        setupTableView()
        setup()
        
        
    }

    private let tableView = UITableView()
    
    private let searchField: CustomTextField = {
        let ret  = CustomTextField()
        
        let searchIconView: UIImageView = {
            let ret = UIImageView(
                frame: CGRect(x: 5.62, y: 5.2, width: 16.76, height: 16.92)
            )
            ret.image = UIImage(systemName: "magnifyingglass")
            ret.tintColor = .main
//            ret.backgroundColor = .red
            
            return ret
        }()
        
        let iconContainerView: UIView = UIView(
            frame: CGRect(x: 17.62, y: 0, width: 28, height: 28)
        )
//        iconContainerView.backgroundColor = .green
        
        iconContainerView.addSubview(searchIconView)
        
        ret.leftView = iconContainerView
        ret.leftViewMode = .always
        ret.layer.cornerRadius = 10
        ret.layer.borderWidth = 2
        ret.layer.borderColor = UIColor.main.cgColor
        
        ret.attributedPlaceholder = NSAttributedString(
            string: "Search for character",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondary as Any]
        )
        ret.font = .boldSystemFont(ofSize: 17)
        ret.textColor = .main
        ret.backgroundColor = .BG
        ret.tintColor = .white
        
        return ret
    }()
    
    func setupSearchField() {
        let tap = UITapGestureRecognizer(target: searchField, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func setup() {
        
        view.addSubview(searchField)
        view.addSubview(tableView)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        searchField.delegate = self
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 82),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchField.heightAnchor.constraint(equalToConstant: 55),
            
            tableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        tableView.backgroundColor = .BG
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: UITableViewCell.defaultReuseIdentifier
        )
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("1")
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.textColor = .main
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return button pressed.")
        textField.resignFirstResponder()
        return false
    }

}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.defaultReuseIdentifier)
        cell?.backgroundColor = .greyBG
        return cell ?? UITableViewCell()
    }
}


final class SectionView: UITableViewCell {
    
    struct Model {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let titleLabel = UILabel()
    
    private func setup() {
        
    }
}

extension UITableViewCell {
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UITextField {
    
}


//        let searchIconView: UIImageView = {
//            let ret = UIImageView(
//                frame: CGRect(x: 0, y: 5, width: 20, height: 20)
//            )
//            ret.image = UIImage(systemName: "magnifyingglass")
//            ret.tintColor = .main
//            ret.backgroundColor = .red
//            return ret
//        }()
//
//        let iconContainerView: UIView = UIView(
//            frame: CGRect(x: 0, y: 0, width: 30, height: 30)
//        )
//        iconContainerView.backgroundColor = .green


//        let searchIconView = UIImageView(
//            frame: CGRect(x: 17.62, y: 0, width: 20, height: 20)
//        )
//        searchIconView.image = UIImage(systemName: "magnifyingglass")
//        searchIconView.tintColor = .main
//        searchIconView.backgroundColor = .red
