//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Brian Hersh on 5/14/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class BatleViewController: UIViewController {
    
    // MARK: - Properties
    let characterController = CharacterController()
    
    // MARK: Northmen IBOutlets
    @IBOutlet weak var northmenNameLabel: UILabel!
    @IBOutlet weak var northmenAliasLabel: UILabel!
    @IBOutlet weak var northmenTitleLabel: UILabel!
    @IBOutlet weak var northmenPowerLabel: UILabel!
    
    // MARK: Southerner IBOutlets
    @IBOutlet weak var southernerNameLabel: UILabel!
    @IBOutlet weak var southernerAliasLabel: UILabel!
    @IBOutlet weak var southernerTitleLabel: UILabel!
    @IBOutlet weak var southernerPowerLabel: UILabel!
    
    // MARK: Throne IBOutlets
    @IBOutlet weak var throneNameLabel: UILabel!
    @IBOutlet weak var throneAliasLabel: UILabel!
    @IBOutlet weak var throneTitleLabel: UILabel!
    @IBOutlet weak var thronePowerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func northmenButtonTapped(_ sender: Any) {
        updateNorthmenViews()
    }
    
    @IBAction func southernerButtonTapped(_ sender: Any) {
        updateSouthernerViews()
    }
    
    @IBAction func battleButtonTapped(_ sender: Any) {
        if northmenNameLabel.text != "" && northmenNameLabel.text != "name" && southernerNameLabel.text != "" && southernerNameLabel.text != "name" {
            print("prepare for battle!")
            battleForThrone()
        } else {
            alertControllerNeedCharacter()
        }
    }
    
    // MARK: - Methods
    func battleForThrone() {
        guard let northmenPower = northmenPowerLabel.text,
            let southernerPower = southernerPowerLabel.text else { return }
        
        let northernMultiplier = Int(northmenPower)! * (Int.random(in: 1...1000))
        let southernMultiplier = Int(southernerPower)! * (Int.random(in: 1...1000))
        
        updateThroneViews(northernMultiplier: northernMultiplier, southernMultiplier: southernMultiplier)
    }
    
    func updateThroneViews(northernMultiplier: Int, southernMultiplier: Int) {
        if northernMultiplier >= southernMultiplier {
            print("the north wins \(northernMultiplier) to \(southernMultiplier)")
            throneNameLabel.text = northmenNameLabel.text
            throneAliasLabel.text = northmenAliasLabel.text
            throneTitleLabel.text = northmenTitleLabel.text
            thronePowerLabel.text = northmenPowerLabel.text
            updateSouthernerViews()
            alertControllerDeclareWinnerNorth()
        } else {
            print("the south wins \(southernMultiplier) to \(northernMultiplier)")
            throneNameLabel.text = southernerNameLabel.text
            throneAliasLabel.text = southernerAliasLabel.text
            throneTitleLabel.text = southernerTitleLabel.text
            thronePowerLabel.text = southernerPowerLabel.text
            updateNorthmenViews()
            alertControllerDeclareWinnerSouth()
        }
    }
    
    func updateNorthmenViews() {
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
    
    func updateSouthernerViews() {
        let num = String(Int.random(in: 0 ... 2138))
        characterController.fetchCharacter(characterNumber: num) { (character) in
            DispatchQueue.main.async {
                self.southernerNameLabel.text = character?.name
                self.southernerAliasLabel.text = character?.aliases[0]
                self.southernerTitleLabel.text = character?.titles[0]
                self.southernerPowerLabel.text = character?.power
            }
        }
    }
}

// MARK: - AlertControllers
extension BatleViewController {
    
    func alertControllerNeedCharacter() {
        let alertController = UIAlertController(title: "Oops", message: "Recruit a character or two.", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "okay", style: .default, handler: nil)
        alertController.addAction(okay)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerDeclareWinnerNorth() {
        let alertController = UIAlertController(title: "The North has won the Throne!", message: "Prepare to defend against the next usurper.", preferredStyle: .alert)

        let okay = UIAlertAction(title: "I understand.", style: .default, handler: nil)
        alertController.addAction(okay)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerDeclareWinnerSouth() {
        let alertController = UIAlertController(title: "The South has won the Throne!", message: "Prepare to defend against the next usurper.", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "I understand.", style: .default, handler: nil)
        alertController.addAction(okay)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

