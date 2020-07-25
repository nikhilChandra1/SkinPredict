//
//  termsAndConditionsViewController.swift
//  medicalAppFinal
//
//  Created by Nikhil Chandra on 11/30/19.
//  Copyright © 2019 Jhoney Lopes. All rights reserved.
//

import UIKit

class termsAndConditionsViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:("https://docs.google.com/document/d/13_xQg0v3xJWLz7HjpKKSDaYQdHc1OvER-2j9LOICm28/edit?usp=sharing"))
        print(url)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
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
