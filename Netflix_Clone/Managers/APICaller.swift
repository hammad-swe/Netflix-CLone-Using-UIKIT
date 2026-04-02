//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 31/03/2026.
//

import Foundation

struct Constants {
}

enum APIError: Error{
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    // get trending movies
    
    func getTrendingMovies(complition: @escaping (Result<[Title], Error>) ->Void){
        
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.Api_Key)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
            
        }
        task.resume()
        
    }
    
    
    // get trending TV
    
    func getTrendingTv(complition: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.Api_Key)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
            
        }
        task.resume()
    }
    
    // get upcomming Movies
    
    func getUpcommingMovies(complition: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
           
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
           
        }
        task.resume()
    }
    
    // get popular movies
    
    func getPopular(complition: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
            
        }
        task.resume()
    }
    
    // get TopRated
    
    func getTopRated(complition: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
        }
        task.resume()
    }
    
    // Get search or discover movie
    
    func getDiscoveredMovies(complition: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.Api_Key)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetiztion_types=flatrate") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
        }
        task.resume()
    }
    
    // Search Movies
    
    func search(with query: String,complition: @escaping (Result<[Title], Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.Api_Key)&query=\(query)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    complition(.success(results.results))
                }
                catch{
                    complition(.failure(APIError.failedToGetData))
                }
            }
        }
        task.resume()
    }
    
    //get movie from youtubApi to show
    
    func getMovie(with query : String, completion: @escaping (Result<VideoElement, Error>) -> Void){
        
        print("DEBUG: Searching YouTube for: \(query)")
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
       guard let url = URL(string: "\(Constants.YoutubebaseURL)/q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                do{
                    let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                    if let video = results.items.first {
                        completion(.success(video))
                    } else {
                        // This stops the crash and tells you what happened
                        print("YouTube returned 0 results for this search.")
                        return
                    }
//                    completion(.success(results.items[0]))
                    
                }
                catch{
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
}


