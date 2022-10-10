//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet var resultLB: UILabel!
    @IBOutlet var descLb: UILabel!
    
    // MARK: Public
    var answers: [Answer]! = nil
    
    // MARK: Life cycles properties
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateMostFrequentAnswer()
    }

    // MARK: IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    // MARK: Private Methods
    private func calculateMostFrequentAnswer() {
        var animalsCount: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            animalsCount[animal] = (animalsCount[animal] ?? 0) + 1
        }
        
        let sortedAnimalsCount = animalsCount.sorted { $0.value > $1.value }
        displayResult(for: sortedAnimalsCount.first?.key)
    }
    
    private func displayResult(for animal: Animal?) {
        resultLB.text = "Вы - \(animal?.rawValue ?? " ")!"
        descLb.text = animal?.definition
    }
}
