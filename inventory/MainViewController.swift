//
//  MainViewController.swift
//  inventory
//
//  Created by Tami on 06.01.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас пока нет товаров 📦"
        label.font = UIFont(name: "Manrope", size: 25)
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(addBtnPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "blank")
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "blank")
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        [infoLabel,addButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func addBtnPress() {
        self.navigationController?.pushViewController(AdditemViewController(), animated: true)
    }
}
