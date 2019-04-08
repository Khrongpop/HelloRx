//
//  Quiz2ViewController.swift
//  HelloRx
//
//  Created by Khrongpop on 8/4/2562 BE.
//  Copyright © 2562 Khrongpop. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Quiz2ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtin: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSubScription()
        // Do any additional setup after loading the view.
    }
    
    func initialSubScription() {
        
        let username = usernameField
            .rx
            .text
            .orEmpty
            .asObservable()
            .map { (value) -> Bool in
                return value.count > 4
            }
        
        let password = passwordField
            .rx
            .text
            .orEmpty
            .asObservable()
            .map { (value) -> Bool in
                return value.count > 4
        }
        
        Observable
            .combineLatest(username,password)
            { (isValidUsr, isValidPwd) in
                return isValidUsr && isValidPwd
            }
            .bind(to: loginButtin.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
