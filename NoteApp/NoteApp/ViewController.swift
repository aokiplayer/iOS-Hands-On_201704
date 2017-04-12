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
        // メモに追加するメソッドを実行
        self.addNewNote()
    }

    /// 入力内容をメモに追加するメソッド
    private func addNewNote() {
        // テキストフィールドの入力値を取得
        let line = textField.text

        // 入力内容を、テキストビューに表示
        textView.text = line
    }

    /// 画面が読み込まれ、ビューが準備完了後に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// メモリ不足の際に呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
