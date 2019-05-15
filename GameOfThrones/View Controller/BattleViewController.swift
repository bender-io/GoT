//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Brian Hersh on 5/14/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class BatleViewController: UIViewController {
    
    let characterController = CharacterController()
    
    // MARK: IBOutlets
    @IBOutlet weak var northmenNameLabel: UILabel!
    @IBOutlet weak var northmenAliasLabel: UILabel!
    @IBOutlet weak var northmenTitleLabel: UILabel!
    @IBOutlet weak var northmenPowerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func northmenButtonTapped(_ sender: Any) {
        updateViews()
    }
    
    func updateViews() {
        let num = String(Int.random(in: 0 ... 2138))
        characterController.fetchCharacter(characterNumber: num) { (character) in
            DispatchQueue.main.async {
                self.northmenNameLabel.text = character?.name
                self.northmenAliasLabel.text = character?.aliases[0]
                self.northmenTitleLabel.text = character?.titles[0]
                self.northmenPowerLabel.text = character?.power
            }
        }
    }
}

