//
//  ViewController.swift
//  ViewController
//
//  Created by Timur Alimbekov on 5/26/22.
//

import UIKit

class ViewController: UIViewController {
    
    //label надо ставить вверх
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showButton(_ sender: Any) {
        self.alert(title: "Welcome!", message: "Write your name:", style: .alert)
        self.welcomeLabel.text = "Hi, "
    }
    
    //Actions надо ставить вниз
    
    // 2 -> Метод создания простого алерта
    func alert(title: String, message: String, style: UIAlertController.Style) {
        //Это простой алерт
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        //Это действия алерта
        let alertAction = UIAlertAction(title: "Ok!", style: .cancel) { _ in
            let text = alertController.textFields?.first?.text
            self.welcomeLabel.text! += text ?? "Username"
            print(text ?? "nil")
        }
        
        // Добавить текстовое поле ввода
        alertController.addTextField(){ textField in
            // Конфигурация текстового поля - не видимый ввод 
            textField.isSecureTextEntry = true
        }
        // Добавить алерту его действие
        alertController.addAction(alertAction)
        //?
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}

