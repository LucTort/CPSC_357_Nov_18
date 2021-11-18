//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 11/11/21.
//

import SwiftUI
struct ContentView: View {
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple])

    @State private var selection = 1
    @State private var isButtonVisible: Bool = true
    @State private var visibility = false
    @State private var rotation: Double = 0
    @State private var scale: Double = 1
    @GestureState private var offset: CGSize = .zero
    
var body: some View {
    TabView(selection: $selection) {
//    Text("First Content View")
        
        VStack {
            Toggle(isOn:$isButtonVisible.animation( .linear(duration: 0.1))) {
        Text("Show Circle")
        }.padding()
        if isButtonVisible {
        Button(action: {}) {
            Circle()
            .fill(RadialGradient (gradient: colors,
            center: .center,
            startRadius: CGFloat(0), endRadius: CGFloat(200)))
        }
        }
            let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
            state = dragValue.translation
            }
            Image(systemName: "hand.point.right.fill")
            .font(.largeTitle)
            .offset(offset)
            .gesture(drag)
            
            
        
        }
        
            
    .tabItem {
    Image(systemName: "1.circle")
    Text("Trippy Circle")
    }.tag(1)
                
        
        
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 0.2))) {
        Text("Toggle")
        }
        .padding()
        if visibility {
        Text("Blue Pill")
        .font(.largeTitle)
            
            Capsule()
            .stroke(lineWidth: 10)
            .foregroundColor(.blue)
            .frame(width: 200, height: 100)
        }
        if !visibility {
        Text("Red Pill")
        .font(.largeTitle)
            
            Capsule()
            .stroke(lineWidth: 10)
            .foregroundColor(.red)
            .frame(width: 200, height: 100)
        }
        }
        
        
    .tabItem {
    Image(systemName: "2.circle")
    Text("Blue Pill")
    }.tag(2)
        
        

        Button(action: {
        self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            self.scale = (self.scale < 0.5 ? self.scale + 0.1 : 0.5)

        }){
        Ellipse()
        .fill(Color.red)
        .overlay(Ellipse()
        .stroke(Color.blue, lineWidth: 10))
        .scaleEffect(scale)
        .rotationEffect(.degrees(rotation))
        .animation (.spring(response: 1, dampingFraction:
                                0.2, blendDuration: 0))
        }
        

//        .frame(width: 250, height: 150)
        
    .tabItem {
    Image(systemName: "3.circle")
    Text("They're Watching")
    }.tag(3)
    }.font(.largeTitle)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
