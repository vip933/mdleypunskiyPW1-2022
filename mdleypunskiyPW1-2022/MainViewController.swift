//
//  ViewController.swift
//  mdleypunskiyPW1-2022
//
//  Created by Maxim Leypunskiy on 11/09/2022.
//

import UIKit

final class MainViewController: UIViewController {
    let HEIGHT_INDENT: CGFloat = 10
    let WIDTH_INDENT: CGFloat = 10
    let CORNER_RADIUS_DEFAULT: CGFloat = 15
    let BOTTOM_INDENT: CGFloat = 50
    
    var viewsList: [UIView] = []
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        setupViews()
        setupButton()
    }
    
    private func setupViews() {
        for _ in 0...6 {
            let view = UIView()
            view.backgroundColor = .green
            view.layer.cornerRadius = CORNER_RADIUS_DEFAULT
            viewsList.append(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        viewsSetLayout()
        print("Views setup sucessfull")
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(BOTTOM_INDENT - button.frame.height) / 2),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        button.setTitle("Push me harder, Daddy <3", for: .normal)
        button.addTarget(self, action: #selector(didButtonClicked), for: .touchUpInside)
        print("Button set up")
    }
    
    @objc
    private func didButtonClicked() {
        print("Click me harder")
        button.isEnabled = false
        button.setTitleColor(.lightGray, for: .normal)
        var set = Set<UIColor>()
                while set.count < viewsList.count {
                    set.insert(UIColor.init(hex: randomHexColorString())!)
                }
        UIView.animate(withDuration: 2, animations: {
            for view in self.viewsList {
                view.backgroundColor = set.popFirst()
                view.layer.cornerRadius = .random(in: 0...50)
            }
        }, completion: { _ in self.clickEnded()})
    }
    
    private func clickEnded() {
        self.button.isEnabled = true
        self.button.setTitleColor(.white, for: .normal)
    }
    
    private func viewsSetLayout() {
        // Left side.
        NSLayoutConstraint.activate([
            // [0;0]
            viewsList[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HEIGHT_INDENT),
            viewsList[0].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WIDTH_INDENT),
            viewsList[0].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 6) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[0].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3),
            
            // [1;0]
            viewsList[1].topAnchor.constraint(equalTo: viewsList[0].bottomAnchor, constant: HEIGHT_INDENT),
            viewsList[1].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WIDTH_INDENT),
            viewsList[1].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 3) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[1].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3 * 2),
            
            // [2;0]
            viewsList[2].topAnchor.constraint(equalTo: viewsList[1].bottomAnchor, constant: HEIGHT_INDENT),
            viewsList[2].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WIDTH_INDENT),
            viewsList[2].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[2].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3),
        ])
        
        // Right side.
        NSLayoutConstraint.activate([
            // [0;1]
            viewsList[3].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HEIGHT_INDENT),
            viewsList[3].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WIDTH_INDENT),
            viewsList[3].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 6) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[3].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3 * 2),
            
            // [1;1]
            viewsList[4].topAnchor.constraint(equalTo: viewsList[3].bottomAnchor, constant: HEIGHT_INDENT),
            viewsList[4].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WIDTH_INDENT),
            viewsList[4].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 3) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[4].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3),
            
            // [2;1]
            viewsList[5].topAnchor.constraint(equalTo: viewsList[4].bottomAnchor, constant: HEIGHT_INDENT),
            viewsList[5].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WIDTH_INDENT),
            viewsList[5].heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) - CGFloat((viewsList.count / 2)) * HEIGHT_INDENT - BOTTOM_INDENT),
            viewsList[5].widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 3 * WIDTH_INDENT) / 3 * 2),
        ])
    }
}

