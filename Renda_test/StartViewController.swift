//
//  StartViewController.swift
//  Renda_test
//
//  Created by Yuki Hirayama on 2022/09/04.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let nextView = segue.destination as! GameViewController
            
            nextView.gamemord =  false
        }
        if segue.identifier == "toHardGame" {
            let nextView = segue.destination as! GameViewController
            
            nextView.gamemord =  true
        }
    }
    
    
    
    @IBAction func unwindToStartViewController(segue: UIStoryboardSegue) {
        
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
