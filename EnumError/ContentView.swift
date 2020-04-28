//
//  ContentView.swift
//  EnumError
//
//  Created by Ernesto Fernandez on 28/04/2020.
//  Copyright © 2020 Ernesto Fernandez. All rights reserved.
//

import SwiftUI

enum SomeEnum {
    case someCase
}

class ContentViewModel: ObservableObject {

//    var someEnum: SomeEnum = .someCase // <--- here, it doesn't work
    @Published var numbers: [Int] = []
    var someEnum: SomeEnum = .someCase // <--- here, it works

    func onAppear() {
        numbers = Array(0...9)
    }

}

struct ContentView: View {

    @ObservedObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.numbers, id: \.self) {
                Text(String($0))
            }
        }
        .onAppear {
            self.viewModel.onAppear()
        }
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}
