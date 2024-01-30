//
//  AdditemViewController.swift
//  inventory
//
//  Created by Tami on 06.01.2024.
//

import UIKit
import SnapKit

final class AdditemViewController: UIViewController {
    
    private lazy var addItemLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить товар"
        label.textColor = .black
        label.font = UIFont(name: "Manrope", size: 24)
        label.font = .systemFont(ofSize: 24)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "blank")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "blank")
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        [addItemLabel].forEach { label in
            view.addSubview(label)
        }
    }
    
    private func setupConstraints() {
        addItemLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(110)
        }
    }

}
