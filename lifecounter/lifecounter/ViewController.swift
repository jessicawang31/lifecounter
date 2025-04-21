//
//  ViewController.swift
//  lifecounter
//
//  Created by Jessica  Wang on 4/20/25.
//

import UIKit

class ViewController: UIViewController {
    var player1Lives = 20;
    var player2Lives = 20;
    @IBOutlet weak var lifeCounter1: UILabel!;
    @IBOutlet weak var lifeCounter2: UILabel!;
    @IBOutlet weak var playerLost: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1Lives = 20;
        player2Lives = 20;
        lifeCounter1.text = "Life Count: \(player1Lives)";
        lifeCounter2.text = "Life Count: \(player2Lives)";
        playerLost.isHidden = true;
    }

    // update life counter
    func updateLifeCounter1() {
        lifeCounter1.text = "Life Count: \(player1Lives)";
        loser();
    }
    
    func updateLifeCounter2() {
        lifeCounter2.text = "Life Count: \(player2Lives)";
        loser();
    }
    
    // +1
    @IBAction func add1Life1(_ sender: Any) {
        player1Lives += 1;
        updateLifeCounter1();
    }
    
    @IBAction func add1Life2(_ sender: Any) {
        player2Lives += 1;
        updateLifeCounter2();
    }
    
    // -1
    @IBAction func subtract1Life1(_ sender: Any) {
        player1Lives -= 1;
        updateLifeCounter1();
    }
    
    @IBAction func subtract1Life2(_ sender: Any) {
        player2Lives -= 1;
        updateLifeCounter2();
    }
    
    // + 5
    @IBAction func add5Life1(_ sender: Any) {
        player1Lives += 5;
        updateLifeCounter1();
    }
    
    @IBAction func add5Life2(_ sender: Any) {
        player2Lives += 5;
        updateLifeCounter2();
    }
    
    // -5
    @IBAction func subtract5Life1(_ sender: Any) {
        player1Lives -= 5;
        updateLifeCounter1();
    }
    
    @IBAction func subtract5Life2(_ sender: Any) {
        player2Lives -= 5;
        updateLifeCounter2();
    }
    
    // player lost
    func loser(){
        if player1Lives <= 0 {
            playerLost.text = "Player 1 LOSES!";
            playerLost.isHidden = false;
        }
        else if player2Lives <= 0 {
            playerLost.text = "Player 2 LOSES!";
            playerLost.isHidden = false;
        }
    }
}

