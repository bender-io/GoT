//
//  CharacterController.swift
//  GameOfThrones
//
//  Created by Brian Hersh on 5/14/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

class CharacterController {
    
    // MARK: - Properties
    let baseURL = URL(string: "https://anapioficeandfire.com/api/characters/")
    
    // MARK: - CRUD Functions
    func fetchCharacter(characterNumber: String, completion: @escaping(Character?) -> Void ) {
        guard let url = baseURL else { return }
        let getterEndpointURL = url.appendingPathComponent(characterNumber)
        let requestURL = URLRequest(url: getterEndpointURL)
        print(requestURL)
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            guard let data = data else { return }
            
            do {
                let character = try JSONDecoder().decode(Character.self, from: data)
                completion(character)
                
            } catch {
                print(error.localizedDescription)
                completion(nil) ; return
            }
        }.resume()
    }
}
