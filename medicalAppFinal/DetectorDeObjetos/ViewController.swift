//
//  ViewController.swift
//  DetectorDeObjetos
//
//  Created by Jhoney Lopes on 10/06/17.
/*
 Copyright 2017 Jhoney Lopes
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import CoreML
import Vision
import Firebase
import FirebaseMLCommon


var serverImage: UIImage? = nil
var topResult = ""
class ViewController: UIViewController {
    
    @IBOutlet var skinDiseaseImageView: UIImageView!
    @IBOutlet var result1Label: UILabel!
    @IBOutlet var result1Confidence: UILabel!
    @IBOutlet var result2Label: UILabel!
    @IBOutlet var result2Confidence: UILabel!
    @IBOutlet var result3Label: UILabel!
    @IBOutlet var result3Confidence: UILabel!
    
    override func viewDidLoad() {
        let alertController = UIAlertController(title: "iOScreator", message:
            "Hello, world!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
        
        let initialConditions = ModelDownloadConditions(allowsCellularAccess: true,
                                                                                 allowsBackgroundDownloading: true)
        let updateConditions = ModelDownloadConditions(allowsCellularAccess: false,
                                                       allowsBackgroundDownloading: true)
        let remoteModel = RemoteModel(
            name: "SkinDiseaseModel1",  // The name you assigned in the console.
            allowsModelUpdates: true,
            initialConditions: initialConditions,
            updateConditions: updateConditions
        )
        ModelManager.modelManager().register(remoteModel)

    

     

        
        
        
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//Choosing the Image
extension ViewController {
    
    @IBAction func selectImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .savedPhotosAlbum
        present(pickerController, animated: true)
    }
    
}

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        
        guard let skinImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Error Retrieving Image Line 95")
        }
    
        var skinImageToDiagnose = VisionImage(image: skinImage)
        
        serverImage = skinImage
        skinDiseaseImageView.image = skinImage
        
        let labelerOptions = VisionOnDeviceAutoMLImageLabelerOptions(
            remoteModelName: "SkinDiseaseModel1",  // Or nil to not use a remote model
            localModelName: nil     // Or nil to not use a bundled model
        )
        labelerOptions.confidenceThreshold = 0.0 // to determine an appropriate value.
        
        let labeler = Vision.vision().onDeviceAutoMLImageLabeler(options: labelerOptions)
        
        var topThreeResults = [String]()
        var topThreeConfidences = [String]()
        
        
        labeler.process(skinImageToDiagnose) { labels, error in
            guard error == nil, let labels = labels else { return }

            

            print("1")
            print(labels)
            var counter = 0
            /*
            for label in labels {
                topThreeResults.append(String(describing: label.text))
                
                topThreeConfidences.append(String(describing: label.confidence))
                counter = counter + 1
                print("counter")
                if counter == 3 {
                    break
                }
             }
            */
            
            var firstlabel = labels[0].text
            var secondLabel = labels[1].text
            var thirdLabel = labels[2].text
            
            var firstConfidence = labels[0].confidence!
            print(firstConfidence)
            var secondConfidence = labels[1].confidence!
            print(firstConfidence)
            var thirdConfidence = labels[2].confidence!
            print(firstConfidence)
            if firstlabel == "ClearSkinDataSet" {
                firstlabel = "Clear Skin"
            }
            
            if secondLabel == "ClearSkinDataSet" {
                secondLabel = "Clear Skin"
            }
            
            if thirdLabel == "ClearSkinDataSet" {
                thirdLabel = "Clear Skin"
            }
            
            print("HI")
            self.result1Label.text = "Result 1: " + firstlabel
            self.result1Confidence.text = "Likelihood: " + String(describing: firstConfidence)
           
            
            self.result2Label.text = "Result 2: " + secondLabel
            self.result2Confidence.text = "Likelihood: " + String(describing: secondConfidence)
            
            self.result3Label.text = "Result 3: " + thirdLabel
            self.result3Confidence.text = "Likelihood: " + String(describing: thirdConfidence)
            
            

        }
        
        

        
    }
    
}







// MARK: - UINavigationViewControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    
}


