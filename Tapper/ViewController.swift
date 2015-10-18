//
//  ViewController.swift
//  Tapper
//
//  Created by Lucas Damiani on 18/10/15.
//  Copyright © 2015 Lucas Damiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Properties
    var maxTaps = 0
    var currentTaps = 0
    
    // Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var tapsTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = nil
        addDoneButton(textField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        if tapsTextField.hasText() {            maxTaps = Int(tapsTextField.text!)!
            currentTaps = 0
            updateTaps()
            startGame()
        }
    }
    
    @IBAction func onTap(sender: UIButton) {
        currentTaps++
        updateTaps()
        if isGameOver() {
            stopGameAndGoBackToInitialScreen()
        }
    }
    
    private func togglePlayState() {
        logoImageView.hidden = !logoImageView.hidden
        playButton.hidden = !playButton.hidden
        tapsTextField.hidden = !tapsTextField.hidden
        
        tapButton.hidden = !tapButton.hidden
        tapsLabel.hidden = !tapsLabel.hidden
    }
    
    private func updateTaps() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    private func isGameOver() -> Bool {
        return currentTaps >= maxTaps
    }
    
    private func startGame() {
        togglePlayState()
    }
    
    private func stopGameAndGoBackToInitialScreen() {
        togglePlayState()
    }
    
    private func addDoneButton(textField: UITextField!) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .Done,
            target: view, action: Selector("endEditing:"))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
}

