//
//  HistoryViewController.swift
//  Life Counter
//
//  Created by Jessica  Wang on 4/23/25.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var historyLog: [String] = [];

    @IBOutlet weak var textView: UITextView!;

    override func viewDidLoad() {
        super.viewDidLoad();
        textView.text = historyLog.joined(separator: "\n");
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyLog.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath);
        cell.textLabel?.text = historyLog[indexPath.row];
        return cell;
    }
}
