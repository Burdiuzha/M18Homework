//
//  APImanager .swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 09.01.2022.


import Foundation
import UIKit

class APImanager {
    
    func getImdbURL (searchTitle: String) -> URL {
        let urlMainPart = "https://imdb-api.com/API/Search/k_il0e4iky/"
        let searchTitleEncoding = searchTitle.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let urlFull = urlMainPart + searchTitleEncoding
        let url = URL(string: urlFull)
        print(urlFull)
 
        return url!
    }
    
    func getImage(url: String) -> UIImage? {
      guard
        let urlIn = URL(string: url),
        let data = try? Data(contentsOf: urlIn)
        else {
            print("Ошибка, не удалось загрузить изображение")
            return nil
        }
        return UIImage(data: data)
    }
    
    func getImdbResults(url: URL, completion: @escaping (_ results: [Result]) -> Void ) {
        print("getImdbResults")
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let imdb = try? JSONDecoder().decode(Imdb.self, from: data) {
                completion(imdb.results)
                }
           }
        task.resume()
    }
}
