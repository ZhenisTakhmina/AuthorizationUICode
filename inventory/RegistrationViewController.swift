//
//  RegistrationViewController.swift
//  inventory
//
//  Created by Tami on 05.01.2024.
//

import UIKit
import SnapKit

final class RegistrationViewController: UIViewController {
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация ✅"
        label.textColor = .black
        label.font = UIFont(name: "Inter", size: 34)
        label.font = .systemFont(ofSize: 34)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let image = UIImage(named: "Vector")
        imageView.image = image
        let leftView = UIView()
        leftView.addSubview(imageView)
        leftView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.placeholder = "Имя"
        textField.keyboardType = .alphabet
        textField.leftView = leftView
        return textField
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let image = UIImage(named: "telephone")
        imageView.image = image
        let leftView = UIView()
        leftView.addSubview(imageView)
        leftView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.placeholder = "Телефон номер"
        textField.keyboardType = .numberPad
        textField.leftView = leftView
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let image = UIImage(named: "password")
        imageView.image = image
        let leftView = UIView()
        leftView.addSubview(imageView)
        leftView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.placeholder = "Пароль"
        textField.keyboardType = .alphabet
        textField.leftView = leftView
        return textField
    }()
    
    private lazy var repeatTextField: UITextField = {
        let textField = UITextField()
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let image = UIImage(named: "password")
        imageView.image = image
        let leftView = UIView()
        leftView.addSubview(imageView)
        leftView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.placeholder = "Повторите пароль"
        textField.keyboardType = .alphabet
        textField.leftView = leftView
        return textField
    }()
    
    private lazy var vrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField,phoneTextField,passwordTextField,repeatTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш пароль должен содержать хотя бы один символ и состоять из 8 или более символов."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .systemGray3
        label.font = UIFont(name: "Manrope", size: 12)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(signupBtnPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        [registerLabel,vrStackView,infoLabel, signupButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        registerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(120)
        }
        
        vrStackView.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(250)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(vrStackView.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        signupButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "blank")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "blank")
    }
    
    @objc private func signupBtnPress() {
        
    }
}
