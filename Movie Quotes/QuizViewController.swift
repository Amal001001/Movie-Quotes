//  QuizViewController.swift
//  Movie Quotes

import UIKit

class QuizViewController: UIViewController {

    var movieName: String?
    let allQuotes = Quotes()
    
    //struct for Quotes
    struct Quotes{
           let QuotesHolder = [
               ("being understood is an underrated pleasure.","The Mentalist"),
               ("Without Death, We'd Be At A Loss. It's The Prospect Of Death That Drives Us To Greatness.","Hannibal"),
               ("when you have eliminated the impossible, whatever remains, however improbable, must be the truth.","Sherlock Holmes"),
               ("It’s not who I am underneath, but what I do that defines me.","Batman"),
               ("I’m not afraid of death. I’m an old physicist. I’m afraid of time.","Interstellar"),
               ("If we’re going to win this fight, some of us might have to lose it.","The Avengers"),
               ("An idea is like a virus.","Inception"),
               ("Have You Ever Seen *That* Before In A Gift Shop?","Doctor Strange"),
               ("Reindeers are easier.","Frozen")
           ]
    }
    
    @IBOutlet weak var quoteLabel: UILabel!
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           for quote in allQuotes.QuotesHolder{
               if quote.1 == movieName{
                    quoteLabel.text = quote.0
                 }
           }
       }

}
