//
//  WebView.swift
//  spider Watch App
//
//  Created by 임준협 on 2023/05/04.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("searchEngine") var searchEngine = "google"
    let searchEngines = ["Google", "DuckDuckGo", "Brave"]
    var body: some View {
        VStack{
            //            Button(action: {
            //
            //            }, label: {
            //
            //            })
            Section("Select search engine") {
                ForEach(searchEngines, id: \.self) { engine in
                    Button(action: {
                        searchEngine = engine
                    }, label: {
                        HStack{
                            if engine == searchEngine {
                                Image(systemName: "checkmark")
//                                    .tint(.green)
                                    .foregroundColor(.green)
                            }
                                Text(engine)
                            
                        }
                    })
                }
            }
        }
    }
}
