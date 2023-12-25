//
//  ViewController.swift
//  demo
//
//  Created by YL on 2023/12/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var dataSource: [Int] = Array(0...100)
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(MessageCell.self, forCellReuseIdentifier: "MessageCell")
        view.keyboardDismissMode = .interactive
        return view
    }()
    
    lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "请输入"
        view.backgroundColor = .yellow
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupnotication()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(textField)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func setupnotication() {
        // Keyboard stuff.
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
}

// MARK: - 键盘处理
extension ViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        let info:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        let keyboardHeight: CGFloat = keyboardSize.height

        let duration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)

        UIView.animate(withDuration: duration, delay: 0, options: animationCurve, animations: {
            self.textField.frame.origin.y = self.view.bounds.height - keyboardHeight - 30
        }, completion: nil)
        
        print(#function, keyboardHeight)
    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue

        let keyboardHeight: CGFloat = keyboardSize.height

        // Set animation properties
        let duration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)

        UIView.animate(withDuration: duration, delay: 0, options: animationCurve, animations: {
            self.textField.frame.origin.y = keyboardHeight
        }, completion: nil)
        
        print(#function, keyboardHeight)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        let keyboardHeight: CGFloat = keyboardSize.height

        let duration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)

        UIView.animate(withDuration: duration, delay: 0, options: animationCurve, animations: {
            self.textField.frame.origin.y = self.textField.frame.origin.y - keyboardHeight
        }, completion: nil)
        
        print(#function, keyboardHeight)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.textLabel?.text = "\(dataSource[indexPath.row])"
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
}

@available(iOS 17, *)
#Preview {
    ViewController()
}
