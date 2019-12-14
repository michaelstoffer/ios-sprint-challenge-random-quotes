//
//  QuoteFetcher.swift
//  Quotes Framework
//
//  Created by Michael Stoffer on 12/14/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

public class QuoteFetcher {
    public enum FetcherError: Int, Error {
        case unknownError
        case noData
        case invalidURL
    }
    
    public init() {}
    
    public func fetchQuote(completion: @escaping (String?, Error?) -> Void) {
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.setValue("Zn6GslkyY9mshlvCHYSrczsmBUnSp1a5FqijsnbRDlvYCO175m", forHTTPHeaderField: "X-Mashape-Key")
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, FetcherError.noData)
                }
                return
            }
            
            do {
                guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]],
                    let object = jsonArray.first,
                    let quote = object["quote"] as? String else {
                        DispatchQueue.main.async {
                            completion(nil, FetcherError.noData)
                        }
                        return
                }
                print("Quote: \(quote)")
                DispatchQueue.main.async {
                    completion(quote, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
        }.resume()
    }
    
    private let baseURL = URL(string: "https://andruxnet-random-famous-quotes.p.mashape.com/")!
}
