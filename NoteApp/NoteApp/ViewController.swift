//
//  ViewController.swift
//  NoteApp
//
//  Created by Hiroyuki Aoki on 2017/04/12.
//  Copyright © 2017 CASAREAL, Inc. All rights reserved.
//

import UIKit

/// UITextFieldDelegateプロトコルを適用することで、ビューコントローラ自体がdelegateとなる
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!


    /// 追加ボタンがタップされた際に実行されるメソッド
    @IBAction func addNote(_ sender: UIButton) {
        // 入力を終了させたいので、テキストフィールドからカーソルを外しておく
        textField.resignFirstResponder()
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
            newNote = "[\(self.currentTimeText)] \(line)\n\(currentNote)"
        } else {
            newNote = line
        }

        // 文字列を、テキストビューに表示
        textView.text = newNote

        // 更新したメモの内容を、ユーザデフォルトを利用して永続化（キーとして "note" を指定）
        let defaults = UserDefaults.standard
        defaults.set(newNote, forKey: "note")
    }

    /// 現在日時文字列を返すプロパティ（Computedプロパティとして、アクセスのたびに計算させる）
    private var currentTimeText: String {
        // 現在日時
        let now = Date()

        // 日時フォーマットオブジェクト
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        // 日付をGMTでなく、日本のロケールでフォーマットするように指定
        formatter.locale = Locale(identifier: "ja_JP")

        // 日付をフォーマットし、文字列として返す
        let nowText = formatter.string(from: now)
        return nowText
    }

    /// 画面が読み込まれ、ビューが準備完了後に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()

        // テキストフィールドのdelegateとして、ビューコントローラ自身（UITextFieldDelegateに適応）を指定
        textField.delegate = self

        // 保存済みのメモを、あらかじめテキストビューに表示させておく（保存時のキーを指定）
        textView.text = UserDefaults.standard.string(forKey: "note")
    }

    /// メモリ不足の際に呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITextFieldDelegate

    /// テキストフィールド内で、Returnキーが押された際に実行されるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 入力を終了させたいので、テキストフィールドからカーソルを外しておく
        textField.resignFirstResponder()
        return true
    }

    /// テキストフィールド内の入力終了の際に実行されるメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        // メモの追加メソッドを呼び出し
        self.addNewNote()
    }
}
