//
//  StudentController.swift
//  StudentPUT
//
//  Created by Caleb Strong on 8/2/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import Foundation

class StudentController {
    
    // DataSource
    // Build URL
    // Fetch Students
    // Post Students
    
    static var students: [Student] = []
    
    static let baseURL = URL(string: "https://survey-ios14.firebaseio.com/students")
    
    static func fetchStudents(completion: @escaping () -> Void) {
        
        guard let url = baseURL?.appendingPathExtension("json") else { completion(); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("There was an error: \(error.localizedDescription)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from the dataTask")
                completion()
                return
            }
            
            guard let studentsDictionary = ( try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String: String]] else {
                NSLog("Unable to serialize JSON")
                completion()
                return
            }
            
            students = studentsDictionary.flatMap { Student(dictionary: $0.value) }
            completion()
        }
        
        dataTask.resume()
    }
    
}
