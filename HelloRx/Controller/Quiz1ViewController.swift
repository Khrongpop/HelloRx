//
//  Quiz1ViewController.swift
//  HelloRx
//
//  Created by Khrongpop on 8/4/2562 BE.
//  Copyright © 2562 Khrongpop. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Quiz1ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loginButtin: UIButton!
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSubScription()
        // Do any additional setup after loading the view.
    }
    
    func initialSubScription() {
        
        textField
            .rx //** <--- สำคัญมาก
            .text
            .orEmpty
            .asObservable()
            .map { (value) -> Bool in
                return value.count > 4
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
