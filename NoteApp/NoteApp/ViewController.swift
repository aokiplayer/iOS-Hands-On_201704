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
        // このメソッドを抜ける直前に、テキストフィールドの入力内容をクリア
        defer {
            textField.text = ""
        }

        // テキストフィールドの入力値を取得（未入力なら何もせずにメソッドを抜ける）
        guard let line = textField.text, !line.isEmpty else { return }

        let newNote: String

        // テキストビューに表示されている文字列を取得できた場合は、改行文字と入力値を追加
        if let currentNote = textView.text, !currentNote.isEmpty {
            newNote = "\(line)\n\(currentNote)"
        } else {
            newNote = line
        }

        // 文字列を、テキストビューに表示
        textView.text = newNote
    }

    /// 画面が読み込まれ、ビューが準備完了後に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()

        // テキストビューの表示内容を、あらかじめクリアしておく
        textView.text = ""
    }

    /// メモリ不足の際に呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
