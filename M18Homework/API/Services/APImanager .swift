//
//  APImanager .swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 09.01.2022.
//

import Foundation

class APImanager {
    
    func getImdbResults(searchTitle: String) -> [Result] {
        var result: [Result] = []
        
        //let dispatchGroup = DispatchGroup()
        
        let urlMainPart = "https://imdb-api.com/API/Search/k_u6yiij6s/"
        let searchTitleEncoding = searchTitle.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let urlFull = urlMainPart + searchTitleEncoding
        let url = URL(string: urlFull)
        let request = URLRequest(url: url!)
        
        //dispatchGroup.enter()
        
        //DispatchQueue.main.async {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let imdb = try? JSONDecoder().decode(Imdb.self, from: data) {
                DispatchQueue.main.async {
                    result = imdb.results
                    print(imdb.results[0].title)
                }
        }
      //}
    }
        task.resume()
        print("Результат приравнивания \(result)")
        return result
   }
}
