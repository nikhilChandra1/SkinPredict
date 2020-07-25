//
//  homeViewController.swift
//  medicalAppFinal
//
//  Created by Nikhil Chandra on 7/26/19.
//  Copyright © 2019 Jhoney Lopes. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    @IBAction func continueButton(_ sender: Any) {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
         performSegue(withIdentifier: "toDiagnosisController", sender: nil)
        } else {
            print("First launch, setting UserDefault.")
            performSegue(withIdentifier: "toTermsAndConditions", sender: nil)
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
