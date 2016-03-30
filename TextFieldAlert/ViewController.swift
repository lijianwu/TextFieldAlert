//
//  ViewController.swift
//  TextFieldAlert
//
//  Created by gdql－Apple on 16/3/30.
//  Copyright © 2016年 李坚武. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //按钮事件
    @IBAction func login(sender: AnyObject) {
        //创建定义两个文本框
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        //此处不能用style：actionsheet   不然会报bug，因为不能为actionSheet的alertController添加输入框
        let alertController = UIAlertController(title: "请登录", message: "请输入你的账号", preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "log in", style: UIAlertActionStyle.Destructive) { (action) -> Void in
            if let username = usernameTextField?.text{
                print("Username = \(username)")
            }else{
                print("No Username entered")
            }
            
            if let password = passwordTextField?.text{
                print("Password = \(password)")
            }else{
                print("密码错误")
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (txtUsername) -> Void in
            usernameTextField = txtUsername
            usernameTextField!.placeholder = "用户名正确"
            usernameTextField?.textColor = UIColor.redColor()
        }
        
        alertController.addTextFieldWithConfigurationHandler { (txtPassword) -> Void in
            passwordTextField = txtPassword
            //bool值类型,true and false
            passwordTextField!.secureTextEntry = true
            //string字符串型
            passwordTextField!.placeholder = "密码安全"
        }
        
        alertController.addAction(loginAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

