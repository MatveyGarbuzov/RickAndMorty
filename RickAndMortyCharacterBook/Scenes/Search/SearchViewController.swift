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
        
        setupSearchField()
        setupTableView()
        setup()
    }
    
    private let tableView = UITableView()
    
    private let searchField: CustomTextField = {
        // Paddings for searchIcon
        let leftPadding = 12
        let width       = 28
        let height      = 28
        
        let searchIconView: UIImageView = {
            let ret = UIImageView(image: UIImage(named: "searchIcon"))
            ret.frame = CGRect(
                x: leftPadding,
                y: 0,
                width: width,
                height: height
            )
            ret.tintColor = .main
            return ret
        }()
        
        let iconContainerView: UIView = {
            let ret = UIView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: leftPadding + width,
                    height: height
                )
            )
            ret.addSubview(searchIconView)
            return ret
        }()
        
        let ret  = CustomTextField()
        ret.leftView = iconContainerView
        ret.leftViewMode = .always
        ret.layer.cornerRadius = 10
        ret.layer.borderWidth = 2
        ret.layer.borderColor = UIColor.main.cgColor
        ret.font = .boldSystemFont(ofSize: 17)
        ret.textColor = .main
        ret.backgroundColor = .BG
        ret.tintColor = .white
        ret.attributedPlaceholder = NSAttributedString(
            string: "  Search for character",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondary as Any]
        )
        
        return ret
    }()
    
    func setupSearchField() {
        let tap = UITapGestureRecognizer(
            target: searchField, action: #selector(UIView.endEditing)
        )
        view.addGestureRecognizer(tap)
        searchField.delegate = self
    }
    
    func setup() {
        view.backgroundColor = .BG
        
        view.addSubview(searchField)
        view.addSubview(tableView)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
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
        print("Editing begin.")
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
