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
    
    // v2 outlets
    @IBOutlet weak var player1AmountField: UITextField!;
    @IBOutlet weak var player2AmountField: UITextField!;
    @IBOutlet weak var playerStackView: UIStackView!;
    @IBOutlet weak var playerButton: UIButton!;
    
    var numPlayers = 2;
    var playerLives: [Int] = [20, 20];
    var gameStarted = false;
    @IBOutlet weak var numPlayersText: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1Lives = 20;
        player2Lives = 20;
        lifeCounter1.text = "Life Count: \(player1Lives)";
        lifeCounter2.text = "Life Count: \(player2Lives)";
        numPlayers = 2;
//        numPlayersText.text = "Number of Players: \(numPlayers)";
        playerLost.isHidden = true;
    }

    // update life counter
    func updateLifeCounter1() {
        lifeCounter1.text = "Life Count: \(player1Lives)";
        logHistory("Player 1 is now at \(player1Lives) life.");
        loser();
    }
    
    func updateLifeCounter2() {
        lifeCounter2.text = "Life Count: \(player2Lives)";
        logHistory("Player 2 is now at \(player2Lives) life.");
        loser();
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
//    @IBAction func add5Life1(_ sender: Any) {
//        player1Lives += 5;
//        updateLifeCounter1();
//    }
//    
//    @IBAction func add5Life2(_ sender: Any) {
//        player2Lives += 5;
//        updateLifeCounter2();
//    }
//    
//    // -5
//    @IBAction func subtract5Life1(_ sender: Any) {
//        player1Lives -= 5;
//        updateLifeCounter1();
//    }
//    
//    @IBAction func subtract5Life2(_ sender: Any) {
//        player2Lives -= 5;
//        updateLifeCounter2();
//    }
    
    // v2 functions
//    var numPlayers = 4
//    var playerLives: [Int] = []
//    var gameStarted = false
    
    // +, - user inputted amount
    @IBAction func changePlayer1LifeByAmount(_ sender: UIButton) {
        // value from text field
        var amount = 0;
        if let text = player1AmountField.text, let value = Int(text) {
            amount = value;
        }

        // update button tag
        if sender.tag == 1 {
            player1Lives += amount;
            logHistory("Player 1 gained \(amount) life.");
        } else {
            player1Lives -= amount;
            logHistory("Player 1 lost \(amount) life.");
        }
        updateLifeCounter1();
        
//        if !gameStarted {
//            gameStarted = true
//            playerButton.isEnabled = false
//        }
    }
    
    @IBAction func changePlayer2LifeByAmount(_ sender: UIButton) {
        // value from text field
        var amount = 0;
        if let text = player2AmountField.text, let value = Int(text) {
            amount = value;
        }

        // update button tag
        if sender.tag == 1 {
            player2Lives += amount;
            logHistory("Player 2 gained \(amount) life.");
        } else {
            player2Lives -= amount;
            logHistory("Player 2 lost \(amount) life.");
        }
        updateLifeCounter2();
        
//        if !gameStarted {
//            gameStarted = true
//            playerButton.isEnabled = false
//        }
    }
    
//    func createPlayerView(playerNumber: Int) -> UIStackView {
//        let container = UIStackView()
//        container.axis = .vertical
//        container.alignment = .leading
//        container.spacing = 5
//
//        let nameLabel = UILabel()
//        nameLabel.text = "Player \(playerNumber)"
//
//        let lifeLabel = UILabel()
//        lifeLabel.text = "Life Count: 20"
//        lifeLabel.tag = 100 + playerNumber  // So we can find this label later
//
//        container.addArrangedSubview(nameLabel)
//        container.addArrangedSubview(lifeLabel)
//
//        return container
//    }
//    
//    @IBAction func addPlayer(_ sender: UIButton) {
//        guard numPlayers < 8 else { return }
//
//        let newPlayerNumber = numPlayers + 1
//        let newPlayerView = createPlayerView(playerNumber: newPlayerNumber)
//        playerStackView.addArrangedSubview(newPlayerView)
//
//        playerLives.append(20)
//        numPlayers += 1
//
//        if numPlayers >= 8 {
//            playerButton.isEnabled = false
//        }
//    }
//    
//    @IBAction func stepperChanged(_ sender: UIStepper) {
//        let value = Int(sender.value)
//        
//        // Adjust the number of players based on the stepper value
//        while numPlayers < value && numPlayers < 8 {
//            let newPlayerNumber = numPlayers + 1
//            let newPlayerView = createPlayerView(playerNumber: newPlayerNumber)
//            playerStackView.addArrangedSubview(newPlayerView)
//            playerLives.append(20)
//            numPlayers += 1
//        }
//
//        // You can also support removing players if needed
//        while numPlayers > value && numPlayers > 2 {
//            if let last = playerStackView.arrangedSubviews.last {
//                playerStackView.removeArrangedSubview(last)
//                last.removeFromSuperview()
//                playerLives.removeLast()
//                numPlayers -= 1
//            }
//        }
//    }

    // history stuff
    @IBAction func goToHistoryScreen(_ sender: Any) {
        performSegue(withIdentifier: "goToHistory", sender: self);
    }
    
    var history: [String] = [];

    func logHistory(_ event: String) {
        history.append(event);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHistory", let destination = segue.destination as? HistoryViewController {
            destination.historyLog = history;
        }
    }

}

