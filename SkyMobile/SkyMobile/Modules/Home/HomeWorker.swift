//
//  HomeWorker.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

enum GenericError: Error {
    case onRequest
    case onResponse
}
class HomeWorker {

    private let defaultSession: URLSession = URLSession(configuration: .default)
    private var dataTaskRequest: URLSessionDataTask?

    func fetchMovies(onResult: @escaping(Result<[MovieModel], GenericError>) -> Void) {

        dataTaskRequest?.cancel()

        if var urlComponents = URLComponents(string: "https://sky-exercise.herokuapp.com/api/Movies") {
            guard let url = urlComponents.url else {
                onResult(.failure(.onRequest))
                return
            }

            dataTaskRequest = defaultSession.dataTask(with: url) { [weak self] (data, response, error) in
                defer {
                    self?.dataTaskRequest = nil
                }

                guard error == nil else {
                    onResult(.failure(.onRequest))
                    return
                }

                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    do {
                        let movies = try JSONDecoder().decode([MovieModel].self, from: data)
                        onResult(.success(movies))
                    } catch {
                        onResult(.failure(.onResponse))
                    }
                } else {
                    onResult(.failure(.onRequest))
                }
            }
            dataTaskRequest?.resume()
        }
    }
}
