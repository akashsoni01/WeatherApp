//
//  ViewController.swift
//  WeatherApp
//
//  Created by ANURAG ADARSH on 18/03/18.
//  Copyright © 2018 ANURAG ADARSH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var weathers:[Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print("checking data feath")
//        Weather.forcast(with: "33,77") { (results) in
//            for result in results{
//                print(result)
//            }
//        }
        //the code was not run because we have not call our completion in our modal   RRRRRRRRR
        
        print("checking data feath")
              Weather.forcast(with: "37.8267,-122.4233") { (results) in
                    for result in results{
                        print(result)
                    }
}
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

