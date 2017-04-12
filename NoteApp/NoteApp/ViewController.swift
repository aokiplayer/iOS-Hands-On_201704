//
//  ViewController.swift
//  NoteApp
//
//  Created by Hiroyuki Aoki on 2017/04/12.
//  Copyright © 2017 CASAREAL, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!


    /// 追加ボタンがタップされた際に実行されるメソッド
    @IBAction func addNote(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

