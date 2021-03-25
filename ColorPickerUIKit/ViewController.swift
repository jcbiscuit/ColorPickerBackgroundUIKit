//
//  ViewController.swift
//  ColorPickerUIKit
//
//  Created by Jody Clelland on 25/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var selectedColor = UIColor.systemRed
    private var colorPicker = UIColorPickerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        view.backgroundColor = selectedColor
        setupBarButton()
    }

    private func selectColor() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = selectedColor
        present(colorPicker, animated: true)
    }
    
    private func setupBarButton() {
        let pickedColorAction = UIAction(title:"Pick Color") { _ in
            self.selectColor()
        }
        
        let pickColorBarButton = UIBarButtonItem(image: UIImage(systemName: "eyedropper"), primaryAction: pickedColorAction)
        
        navigationItem.rightBarButtonItem = pickColorBarButton
    }
    
}
extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController:
                                                    UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        view.backgroundColor = selectedColor
        
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("Did dismiss controller")
    }
}

