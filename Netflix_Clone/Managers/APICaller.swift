//
//  APICaller.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 31/03/2026.
//

import Foundation

struct contants {
}

enum APIError: Error{
    case failedToget
}

class APICaller {
    static let shared = APICaller()
    
    // get trending movies
    
    func getTrendingMovies(complition: @escaping (Result<[Movie], Error>) ->Void){
        
        
        guard let url = URL(string: "\(contants.baseURL)/3/trending/movie/day?api_key=\(contants.Api_Key)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complition(.success(results.results))
            }
            
            catch{
                complition(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    
    // get trending TV
    
    func getTrendingTv(complition: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(contants.baseURL)/3/trending/tv/day?api_key=\(contants.Api_Key)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            
            do{
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
            print(results)
            }
            
            catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    // get upcomming Movies
    
    func getUpcommingMovies(complition: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(contants.baseURL)/3/movie/upcomming?api_key=\(contants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            print(results)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // get popular movies
    
    func getPopular(complition: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(contants.baseURL)/3/movie/popular?api_key=\(contants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            print(results)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // get TopRated
    
    func getTopRated(complition: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(contants.baseURL)/3/movie/top_rated?api_key=\(contants.Api_Key)&language=en-US&page=1") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data , _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            print(results)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}


