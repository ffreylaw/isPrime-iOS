//
//  ViewController.swift
//  isPrime
//
//  Created by Jeffrey Jiahai Luo on 12/12/2016.
//  Copyright © 2016 El Root. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        setupNavigation()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "isPrime"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(handlePrimeList))
    }
    
    func handlePrimeList() {
        let tableVC = TableViewController()
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    func setupView() {
        view.addSubview(resultTextLabel)
        view.addSubview(inputContainerView)
        view.addSubview(isPrimeButton)
        view.addSubview(resetButton)
        
        resultTextLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8).isActive = true
        resultTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        resultTextLabel.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        inputContainerView.topAnchor.constraint(equalTo: resultTextLabel.bottomAnchor, constant: 8).isActive = true
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        inputContainerView.addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        inputTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        inputTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor).isActive = true
        
        isPrimeButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 8).isActive = true
        isPrimeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        isPrimeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        isPrimeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        resetButton.topAnchor.constraint(equalTo: isPrimeButton.bottomAnchor, constant: 8).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func handleIsPrime() {
        if let input = inputTextField.text, let number = Int(input) {
            let flag = isPrime(number)
            if flag {
                resultTextLabel.backgroundColor = UIColor.green
                resultTextLabel.text = "YES"
            } else {
                resultTextLabel.backgroundColor = UIColor.red
                resultTextLabel.text = "NO"
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid input\n(overflow or non-integer input)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        var isPrime = number > 1 ? true : false
        var divisor = 2
        while divisor * divisor <= number {
            if number % divisor == 0 {
                isPrime = false
                break
            }
            divisor += 1
        }
        return isPrime
    }
    
    func handleReset() {
        resultTextLabel.backgroundColor = UIColor.black
        resultTextLabel.text = "isPrime"
        inputTextField.text = ""
    }
    
    let resultTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black
        label.text = "isPrime"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = NSTextAlignment.center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter a number..."
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()

    lazy var isPrimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("isPrime", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleIsPrime), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        return button
    }()
    
}

