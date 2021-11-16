//
//  KontaktViewController.swift
//  ThreeDelegates
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 25.10.21.
//

import UIKit

protocol KontaktViewDeleagte {
    func newKontakt(kontakt: Kontakt)
}

class KontaktViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: KontaktViewDeleagte!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAlter: UITextField!
    @IBOutlet weak var pvGeschlecht: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvGeschlecht.delegate = self
    }
    
    private func checkEingaben() -> Bool {
        return tfAlter.text != nil && !tfAlter.text!.isEmpty && Int(tfAlter.text!) != nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Geschlecht.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = view == nil || !view!.isKind(of: UILabel.self) ? UILabel() : view as! UILabel;
        
        pickerLabel.font = UIFont(name: "Montserrat", size: 16)
        pickerLabel.textAlignment = NSTextAlignment.center

        pickerLabel.text = Geschlecht.allCases[row].rawValue
        
        return pickerLabel;
    }
    
    @IBAction func onBestaetigenClick(_ sender: UIButton) {
        if (checkEingaben()) {
            delegate.newKontakt(kontakt: Kontakt(name: tfName.text!, alter: Int(tfAlter.text!)!, geschlecht: Geschlecht.allCases[pvGeschlecht.selectedRow(inComponent: 0)]))
            dismiss(animated: true, completion: nil)
        }
        else {
            print("Falsche eingaben")
        }
    }
}
