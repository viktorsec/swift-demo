//
//  JSONParser.swift
//  movies-app
//
//  Created by Viktor Sec on 21/04/2019.
//  Copyright © 2019 Viktor Sec. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [String: AnyObject]
            
            return json!
        } catch (let parseError) {
            print("There was an error parsing the JSON: \(parseError.localizedDescription)")
        }
        return nil
    }
}
