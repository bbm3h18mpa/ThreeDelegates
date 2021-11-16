//
//  ViewController.swift
//  ThreeDelegates
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 25.10.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, KontaktViewDeleagte {
    
    @IBOutlet weak var tvKontakt: UITableView!
    var entries: [Kontakt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entries.append(Kontakt(name: "Florian", alter: 20, geschlecht: Geschlecht.MANN))
        
        tvKontakt.dataSource = self
        tvKontakt.register(KontaktTableViewCell.self, forCellReuseIdentifier: "KontaktTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(entries.count)
        return entries.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("erstelle TableViewCell")
        let kontakt: Kontakt = entries[indexPath.row]
//        let cell = KontaktTableViewCell()
        let cell: KontaktTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KontaktTableViewCell", for: indexPath) as! KontaktTableViewCell
        cell.lblName.text = kontakt.name
        cell.lblGeschlecht.text = kontakt.geschlecht.rawValue
        cell.lblAlter.text = String(kontakt.alter)
        print("ohne Probleme erstellt und returned")
        return cell
    }
    
    @IBAction func onNeuerKontaktButton(_ sender: UIButton) {
        //Instanz des Storyboards vom 2. ViewControllers
        let kontaktViewController = storyboard?.instantiateViewController(identifier: "KontaktViewController") as! KontaktViewController
        
        kontaktViewController.delegate = self
        //Methode zum Anzeigen der 2. View
        present(kontaktViewController, animated: true, completion: nil)
    }
    
    func newKontakt(kontakt: Kontakt) {
        print(kontakt.name + " wurde zurückgegeben")
        entries.append(kontakt)
        tvKontakt.reloadData()
    }
}
