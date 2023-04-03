//
//  CardSelectionVC.swift
//  Programmatic CardWorkout
//
//  Created by mac on 30/3/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    var restartButton = CWButton(backgroundColor: .green, title: "Restart")
    var StopButton = CWButton(backgroundColor: .red, title: "Stop")
    var rulesButton = CWButton(backgroundColor: .blue, title: "Rules")
    
    var timer : Timer!
    var cards : [UIImage] = Deck.allValues

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
        startTimer()
        
    }
    
    func configureUI() {
        
        
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
        
    }


        @objc func stopTimer() {
            timer.invalidate()
    
}
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
   
    
    @objc func restartTimer() {
        startTimer()
    }
    
    @objc func showRandomImage() {
        cardImageView.image  = cards.randomElement() ?? UIImage(named: "AS")
    }

    
    func configureCardImageView() {
        
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image =  UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)])
    }
    
    func configureStopButton() {
        
        view.addSubview(StopButton)
        StopButton.translatesAutoresizingMaskIntoConstraints = false
        
        StopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            StopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50),
            StopButton.widthAnchor.constraint(equalToConstant: 260),
            StopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            StopButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
        
            restartButton.topAnchor.constraint(equalTo: StopButton.bottomAnchor, constant: 30),
            restartButton.leadingAnchor.constraint(equalTo: StopButton.leadingAnchor, constant: 0),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.widthAnchor.constraint(equalToConstant: 115)])

    }
    
    func configureRulesButton() {
        
        
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: StopButton.trailingAnchor, constant: 0),
            rulesButton.topAnchor.constraint(equalTo: StopButton.bottomAnchor, constant: 30)])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }

}
