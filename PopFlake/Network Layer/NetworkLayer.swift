//
//  NetworkLayer.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
class NetworkLayer
{
    func getResponse<T:Codable>(of type: T.Type, url: URL,completion: @escaping (T?)->())
    {
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url)
        { (data, response, error) in
            guard  error == nil
            else
            {
                completion(nil)
                return
            }
            guard let data = data
            else
            {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do
            {
                let results = try decoder.decode(T.self, from: data)
                completion(results)
            }
            catch
            {
                // handle exception
                completion(nil)
            }
            
        }
        task.resume()
        
    }
}
