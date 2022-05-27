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
    
    // Its switch button
    // 1st variant
    let mySwitch = UISwitch()
    // 2nd variant
    let mySwitch2 = UISwitch()
    
    // Кнопка
    let button = UIButton()
    
    let codeLabel = UILabel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(codeLabel)
        
        codeLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 150)
        codeLabel.text = "Some Text for codelabel generated from code"
        codeLabel.textColor = UIColor.red
        codeLabel.numberOfLines = 0
        
        codeLabel.shadowColor = .blue
        codeLabel.shadowOffset = CGSize(width: 1, height: 1)
        
        // layer настраивает сам лейбл
        codeLabel.layer.cornerRadius = 45
        codeLabel.layer.borderColor = UIColor.red.cgColor
        codeLabel.layer.borderWidth = 2
        
        
        
        
        
        // Попытка сверстать switch кодом
        // При указаниее frame - требует от нас CGRect(местоположение)
        self.mySwitch.frame = CGRect(x: 100, y: 400, width: 0, height: 0)
        // Просим view добавить элемент на себя
        self.view.addSubview(self.mySwitch)
        
        // по умолчанию говорим, что свич стоит в полодении enabled
        self.mySwitch.setOn(true, animated: true)
        
        // при инициализации пройдет проверка на положение switch
        if self.mySwitch.isOn {
            print("sw on")
        } else {
            print("sw off")
        }
        
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        
        
        // 2
        // задаем положение нового свича на 0 - 0
        self.mySwitch2.frame = CGRect.zero
        // говорим, что середина свича будет равна середина нашего view
        self.mySwitch2.center = self.view.center
        // добавляем наш свитч на view
        self.view.addSubview(self.mySwitch2)
        
        //tintColor - цвет при состоянии disabled
        self.mySwitch2.tintColor = UIColor.orange
        
        // цвет ползунка - статичный
        self.mySwitch2.thumbTintColor = UIColor.red
        
        //onTintColor - цвет свича в состоянии enabled
        self.mySwitch2.onTintColor = UIColor.blue
        
        
        
        // 2.1 Работа со свич -> включенное состояние и выключенное
        // в for указывают наблюдателя, в нашем случае если значение поменяется то...
        self.mySwitch2.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        
        // 3
        // Содаем кнопку кодом
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        // добавляем кнопке бэкграунд
        self.button.backgroundColor = UIColor.orange
        // Если не нажимать на кнопку то ее состояние должно быть normal
        self.button.setTitle("OK", for: .normal)
        
        // при клик оп кнопке highlighted
        self.button.setTitle("Кнопка нажата", for:  .highlighted)
        
        // добавляем кнопку в view
        self.view.addSubview(self.button)
        
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
    
    
    @objc func switchChange(paramTarget: UISwitch) {
        print("Param is - ",paramTarget)
        
        if paramTarget.isOn {
            print("sw on")
            self.button.isUserInteractionEnabled = false
        } else {
            print("sw off")
            self.button.isUserInteractionEnabled = true
        }
    }
    
    func isOn(target: UISwitch) {
        
    }
}
    
    
    


