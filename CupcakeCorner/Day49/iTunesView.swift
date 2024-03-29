//
//  iTunesView.swift
//  CupcakeCorner
//
//  Created by Mihai Leonte on 12/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct iTunesView: View {
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
                
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }

                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct iTunesView_Previews: PreviewProvider {
    static var previews: some View {
        iTunesView()
    }
}
