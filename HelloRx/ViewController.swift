//
//  ViewController.swift
//  HelloRx
//
//  Created by Khrongpop on 4/4/2562 BE.
//  Copyright © 2562 Khrongpop. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import RxAtomic

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let disposeBag: DisposeBag
        textField
            .rx //** <--- สำคัญมาก
            .text
            .orEmpty
            .asObservable()
            .subscribe(onNext: { (str) in
                print("textField str: [\(str)]")
            })
           .disposed(by: disposeBag)
        
        textField2
            .rx //** <--- สำคัญมาก
            .text
            .orEmpty
            .asObservable()
            .do(onNext: { (str) in
                /*
                 Function DO จะทำงานเมื่อมี Event ผ่านเข้ามาใน Stream นี้
                 แต่จะไม่สามารถแก้ไขค่าอะไรได้
                 */
                print("TextField2 str: [\(str)]")
            })
            .bind(to: textField.rx.text)
            .disposed(by: disposeBag)
        
        button
            .rx //** <--- สำคัญมาก
            .tap
            .subscribe(onNext: { (value) in
                /*
                 Button จะส่งค่ามาเป็น Void คือ () เท่านั้น
                 */
                print("Button always emit Void [ \(value) ]")
            })
            .disposed(by: disposeBag)
        

        // Do any additional setup after loading the view.
    }


}

