//
//  Weather.swift
//  WeatherApp
//
//  Created by ANURAG ADARSH on 18/03/18.
//  Copyright © 2018 ANURAG ADARSH. All rights reserved.
//

import Foundation
import CoreLocation
struct Weather {
//    currently":{
//    "time":1521350567,
//    "summary":"Clear",
//    "icon":"clear-day",
//    "precipIntensity":0,
//    "precipProbability":0,
//    "temperature":85.37,
    
    let summary:String
    let icon:String
    let temperature:Double
    
    enum jsonSerializationError:Error {
        case missing(String)
        case invalid(String,Any)
    }
    
    
    init(json:[String:Any]) throws
    {
        guard let summary = json["summary"] as? String else{throw jsonSerializationError.missing("summary")}
        guard let icon = json["icon"] as? String else{throw jsonSerializationError.missing("icon")}
        guard let temperature = json["temperature"] as? Double else{throw jsonSerializationError.missing("temperature")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature

    }
  //https://api.darksky.net/forecast/2e2f9ed2435a66c75142f46cc437fa85/24.8267,77.4233
    static let basePathString = "https://api.darksky.net/forecast/2e2f9ed2435a66c75142f46cc437fa85/"
    
    
    
    
    //completion todo........
    
    
    
    static func forcast(with location:CLLocationCoordinate2D,completion: @escaping ([Weather])->()){
        let url = basePathString + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request){
            (data,response,error) in
            var weatherArray:[Weather] = Array<Weather>()
            

            if let data = data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        if let dailyWeather = json["hourly"] as? [String:Any]{
                            if let dailyData = dailyWeather["data"] as? Array<[String:Any]>{
                                for oneDayWeather in dailyData{
                                    if let weatherObject = try? Weather(json: oneDayWeather) {
                                        weatherArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    }
                }catch{
                    
                }
                completion(weatherArray)
                
            }
            }
        task.resume()
        
    }
    
    //        wrong xxxxxxxxx    "daily": {
    //                "summary": "Mixed precipitation throughout the week, with temperatures falling to 39°F on Saturday.",
    //                "icon": "rain",
    //                "data": [{
    //                "time": 1509944400,
    //                "summary": "Rain starting in the afternoon, continuing until evening.",
    //                "icon": "rain",
    // ....................
    //                },
    //                ...
    //                ]
    //            },
}
