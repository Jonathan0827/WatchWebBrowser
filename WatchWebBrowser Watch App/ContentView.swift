//
//  ContentView.swift
//  spider Watch App
//
//  Created by 임준협 on 2023/04/26.
//

//import SwiftUI
import AuthenticationServices
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            urlView()
            TabView {
                searchView()
                SettingsView()
            }
            .tabViewStyle(.page)
            
        }
        .tabViewStyle(.carousel)
        
    }
}
struct urlView: View {
    @State var urlString: String = ""
    var body: some View {
        NavigationView{
            VStack{
                TextField("URL here", text: $urlString)
                    .onSubmit {
                        ViewSafari(urlString)
                    }
                Button(action: {
                    ViewSafari(urlString)
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                })
            }
        }
    }
    func ViewSafari(_ url: String) {
        var urlValue: String = url
        if url.hasPrefix("https:"){
        } else if url.hasPrefix("http:"){
        } else {
            urlValue = "https:"+url
            print(urlValue)
        }
        guard let urlURL = URL(string: urlValue) else {
            return
        }
        let session = ASWebAuthenticationSession(
            url: urlURL,
            callbackURLScheme: nil
        ) { _, _ in

        }
        session.prefersEphemeralWebBrowserSession = true

        session.start()
        urlString = ""
    }
}
struct searchView: View {
    @State var searchString: String = ""
    @AppStorage("searchEngine") var searchEngine = "Google"
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search here", text: $searchString)
                    .onSubmit {
                        search(searchString)

                    }
                Button(action: {
                    search(searchString)
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                })
                Text("Current search engine:")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text(searchEngine)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
    }
    func search(_ query: String) {
        var searchEngineService: String = searchEngine
        if searchEngine == "Brave" {
            searchEngineService = "search.brave"
        }
        guard let urlURL = URL(string: "https://\(searchEngineService).com/search?q=\(query)") else {
            return
        }
        let session = ASWebAuthenticationSession(
            url: urlURL,
            callbackURLScheme: nil
        ) { _, _ in

        }
        session.prefersEphemeralWebBrowserSession = true

        session.start()
        searchString = ""
    }
}
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//            Link("Apple.com", destination: URL(string: "https://www.apple.com")!)
//
//        }
//        .padding()
//    }
//}

