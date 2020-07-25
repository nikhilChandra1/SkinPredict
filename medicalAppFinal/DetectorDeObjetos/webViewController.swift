//
//  webViewController.swift
//  medicalAppFinal
//
//  Created by Nikhil Chandra on 4/9/19.
//  Copyright © 2019 Jhoney Lopes. All rights reserved.
//

import UIKit

class webViewController: UIViewController {

    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:("https://www.mayoclinic.org/search/search-results?q=" + String(describing: topResult)))
        print(url)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
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
