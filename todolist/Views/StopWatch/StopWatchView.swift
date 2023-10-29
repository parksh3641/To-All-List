//
//  StopWatchView.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

struct StopWatchView: View {
    @StateObject private var vm = ViewModel()
        private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        private let width: Double = 250
        
        var body: some View {
            VStack {
                Text("\(vm.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .alert("시간이 다 되었어요!", isPresented: $vm.showingAlert) {
                        Button("계속하기", role: .cancel) {
                            // Code
                        }
                    }
                    .padding()
                    .frame(width: width)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                
                Slider(value: $vm.minutes, in: 1...10, step: 1)
                    .padding()
                    .disabled(vm.isActive)
                    .animation(.easeInOut, value: vm.minutes)
                    .frame(width: width)

                HStack(spacing:50) {
                    Button("시작") {
                        vm.start(minutes: vm.minutes)
                    }
                    .disabled(vm.isActive)
                    
                    Button("초기화", action: vm.reset)
                        .tint(.red)
                }
                .frame(width: width)
            }
            .onReceive(timer) { _ in
                vm.updateCountdown()
            }
            
        }
}

#Preview {
    StopWatchView()
}
