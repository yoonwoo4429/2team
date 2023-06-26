//
//  ContentView.swift
//  RockGame
//
//  Created by 박성훈 on 2023/06/26.
//

import SwiftUI

// ⭐️이건 대박 꿀팁⭐️
// 구조체 클래스 이넘은 사용자의 핸드메이드 타입
enum Rps: Int, CaseIterable {   // CaseIterable 프로토콜을 채택해서 allCases에 접근 가능
    case scissors = 1
    case paper = 2
    case rock = 3
}

// 배열은 안에 있는거 랜덤으로 뽑아내기 쉽자나요 그쵸?
// shuffle -> 섞는것  / 하나를 뽑아서 가챠를 하고싶어요 -> 배열명.randomElement()!

struct ContentView: View {
    
    @State var result: String = "버튼을 선택하세요"
    
    @State var computerPick: Rps = Rps.rock  // allCases를 통해 랜덤 가능
    @State var userPick: String = "3-1"
    
    var body: some View {
        VStack {
            
            Text("\(result)")
                .font(.largeTitle)
                .padding()
            
            
            HStack {
                
                VStack {
                    Text("컴퓨터: ")
                        .font(.title2)
                    
                    Image("\(computerPick.rawValue)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                }
                .padding()
                
                VStack {
                    Text("나: ")
                        .font(.title2)
                    
                    Image("\(userPick)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                }
                .padding()
                
            }
            
            HStack {
                Group {
                    Button {
                        getResult(myPick: 1)
                    } label: {
                        Text("✌️")
                    }
                    
                    
                    
                    Button {
                        getResult(myPick: 3)
                        
                    } label: {
                        Text("👊")
                    }
                    
                    Button {
                        getResult(myPick: 2)
                        
                    } label: {
                        Text("🖐️")
                    }
                }
                .font(.largeTitle)
                .padding()
            }
            .padding()
            
            
            Button {
                tappedResetButton()
            } label: {
                Image(systemName: "arrow.clockwise.circle")
            }
            .font(.largeTitle)
            
        
        }
        
    }
    
    // 버튼 눌렀을 때 결과를 나타내주는 함수
    func getResult(myPick: Int) {
        computerPick = Rps.allCases.randomElement() ?? Rps.rock // 강사님 느낌표 싫어해...
        
        if myPick == 1 {
            userPick = "1-1"
        } else if myPick == 2 {
            userPick = "2-1"
        } else {
            userPick = "3-1"
        }
        
        
        // 가위: 1, 보: 2, 바위: 3
        if myPick == computerPick.rawValue {
            result = "비김 ☹️"
        } else if (myPick % 3) == computerPick.rawValue - 1 {  // 내가 이기는 경우에 수가 다 있네?
            result = "이김 😎"
        } else {
            result = "짐 ☠️"
        }
        
    }
    
    
    func tappedResetButton() {
        result = "버튼을 선택하세요"
        computerPick = Rps.rock
        userPick = "3-1"
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
