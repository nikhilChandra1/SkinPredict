//
//  correctDiagnosisController.swift
//  medicalAppFinal
//
//  Created by Nikhil Chandra on 4/14/19.
//  Copyright © 2019 Jhoney Lopes. All rights reserved.
//
import UIKit
import Firebase
import FirebaseStorage

class correctDiagnosisController: UIViewController {
    
    @IBOutlet var diagnosisLabel: UILabel!
    @IBOutlet var diagnosisImage: UIImageView!
    

    func createAlert(title: String, message: String) {
        
        
        
    }
    /*
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    */
    @IBAction func doAnotherDiagnosis(_ sender: Any) {
        serverImage = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        do {
            if serverImage == nil {
                createAlert(title: "Please First Take a Diagnosis", message: "There is no image to evaluate")
            }
            
        if serverImage != nil {
            diagnosisImage.image = serverImage
            diagnosisLabel.text = "Correct Diagnosis: " + correctDiagnosis
                let storageRef = StorageReference()
                let skinDiseaseImageReference = storageRef.child("SkinDiseaseUnsortedImages/" + String(describing: correctDiagnosis) + ".png")
            if let skinImage = serverImage {
                if let data = UIImagePNGRepresentation(skinImage) {
                    
                    // Upload the file to the path
                    let uploadTask = skinDiseaseImageReference.putData(data, metadata: nil) { (metadata, error) in
                        guard let metadata = metadata else {
                            // Uh-oh, an error occurred!
                            return
                        }
                        // Metadata contains file metadata such as size, content-type.
                        let size = metadata.size
                        // You can also access to download URL after upload.
                        skinDiseaseImageReference.downloadURL { (url, error) in
                            guard let downloadURL = url else {
                                // Uh-oh, an error occurred!
                                return
                            }
                        }
                    }

                }
            }
            
        } else {
            createAlert(title: "Please First Take a Diagnosis", message: "There is no image to evaluate")
        }
            
        
        } catch {
            createAlert(title: "Diagnosis Not Done", message: "Please First Do a Diagnosis")
        }
    
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
