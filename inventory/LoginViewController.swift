//
//  LoginViewController.swift
//  inventory
//
//  Created by Tami on 05.01.2024.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать 👋"
        label.textColor = .black
        label.font = UIFont(name: "Manrope", size: 34)
        label.font = .systemFont(ofSize: 34)
        return label
    }()

    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Чтобы продолжить, войдите в систему или пройдите регистрацию"
        label.textColor = .systemGray2
        label.font = UIFont(name: "Manrope", size: 16)
        label.numberOfLines = 0
        return label
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
        textField.borderStyle = .none
        textField.placeholder = "Телефон номер"
        textField.keyboardType = .numberPad
        textField.backgroundColor = .systemGray6
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
        textField.borderStyle = .none
        textField.placeholder = "Пароль"
        textField.keyboardType = .alphabet
        textField.backgroundColor = .systemGray6
        textField.leftView = leftView
        return textField
    }()
    
    private lazy var signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(signinBtnPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет акаунта?"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Manrope", size: 12)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var registerBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(registerBtnPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var hrStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [infoLabel,registerBtn])
        stack.axis = .horizontal
        stack.spacing = 2
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cornerRadius()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        [welcomeLabel,subtitleLabel,phoneTextField,passwordTextField,signinButton,hrStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func cornerRadius() {
        phoneTextField.roundCorners(corners: [.allCorners], radius: 13)
        passwordTextField.roundCorners(corners: [.allCorners], radius: 13)
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(120)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(15)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(250)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        signinButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        hrStackView.snp.makeConstraints { make in
            make.top.equalTo(signinButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
   

    @objc private func signinBtnPress() {
        self.navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
    @objc private func registerBtnPress() {
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
