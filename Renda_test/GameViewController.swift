//
//  GameViewController.swift
//  Renda_test
//
//  Created by Yuki Hirayama on 2022/09/04.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var buttonLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var gamemord: Bool!
    
    var tapCount: Int = 0
    var timeCount: Float = 30.0
    
    var timer: Timer = Timer()
    
    let selectArray: [Int] = [1, 2, 3, 4]
    var index: Int!
    
    var random: Int!
    
    var buttonArray: [Int] = [1, 2, 3, 4]
    
    let missSound = try! AVAudioPlayer(data: NSDataAsset(name: "miss")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
        index = Int.random(in: 0...3)
        changeNumber()
        setNumber()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let nextView = segue.destination as! ResultViewController
            
            nextView.resultNumber =  tapCount
        }
    }
    
    @IBAction func tap1() {
        if timer.isValid == true {
            if buttonArray[0] == selectArray[index] {
                tap()
                changeNumber()
                if tapCount % 20 == 0 && gamemord == true {
                    changePosition()
                }
            } else {
                playSound()
            }
        }
        print(gamemord)
    }
    
    @IBAction func tap2() {
        if timer.isValid == true {
            if buttonArray[1] == selectArray[index] {
                tap()
                changeNumber()
                if tapCount % 20 == 0 && gamemord == true {
                    changePosition()
                }
            } else {
                playSound()
            }
        }
    }
    
    @IBAction func tap3() {
        if timer.isValid == true {
            if buttonArray[2] == selectArray[index] {
                tap()
                changeNumber()
                if tapCount % 20 == 0 && gamemord == true {
                    changePosition()
                }
            } else {
                playSound()
            }
        }
    }
    
    @IBAction func tap4() {
        if timer.isValid == true {
            if buttonArray[3] == selectArray[index] {
                tap()
                changeNumber()
                if tapCount % 20 == 0 && gamemord == true{
                    changePosition()
                }
            } else {
                playSound()
            }
        }
    }
    
    @objc func down() {
        timeCount = timeCount - 0.01
        
        if timeCount <= 0.00 {
            timer.invalidate()
            timeLabel.text = String(format: "0.00", timeCount)
            
            self.performSegue(withIdentifier: "toResult", sender: nil)
        } else {
            timeLabel.text = String(format: "%.2f", timeCount)
        }
    }
    
    @objc func changeNumber() {
        if tapCount != 0 {
            random = Int.random(in: 0...9)
            
            if random > 7 {
                index = Int.random(in: 0...3)
            }
        }
        
        buttonLabel.text = String(selectArray[index])
        
        if gamemord == false {
            switch index {
            case 0:
                buttonLabel.textColor = UIColor.orange
            case 1:
                buttonLabel.textColor = UIColor.green
            case 2:
                buttonLabel.textColor = UIColor.purple
            case 3:
                buttonLabel.textColor = UIColor.red
            default:
                break
            }
        } else {
            buttonLabel.textColor = UIColor.blue
        }
    }
    
    @objc func setNumber() {
        button1.setTitle(String(buttonArray[0]), for: .normal)
        button2.setTitle(String(buttonArray[1]), for: .normal)
        button3.setTitle(String(buttonArray[2]), for: .normal)
        button4.setTitle(String(buttonArray[3]), for: .normal)
    }
    
    @objc func changePosition() {
        
        buttonArray = buttonArray.shuffled()
        setNumber()
    }
    
    @objc func tap() {
        tapCount += 1
        label.text = String(tapCount)
    }
    
    @objc func playSound() {
        missSound.currentTime = 0
        missSound.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
