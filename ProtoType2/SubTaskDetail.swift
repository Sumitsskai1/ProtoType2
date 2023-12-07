//
//  SubTaskDetail.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/12.
//

import SwiftUI

struct SubTaskDetail: View {
    @State var Maintasks :[Task]
    let mainIndex :Int
    let subIndex :Int
    @State var taskDeadLine = String("")
    @State var taskMemo = String("")
    var body: some View {
        VStack{
            HStack {
                Text("Main Task Name")
                Spacer()
            }
            Text(" " + Maintasks[mainIndex].childrenTask[subIndex].parentTask)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("Sub Task Name")
                Spacer()
            }
            Text(" " + Maintasks[mainIndex].childrenTask[subIndex].name)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Dead Line")
                Spacer()
            }

            TextField(" " + Maintasks[mainIndex].childrenTask[subIndex].deadline, text: $taskDeadLine)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Memo")
                Spacer()
            }
            
            TextField(" " + Maintasks[mainIndex].childrenTask[subIndex].memo, text: $taskMemo)
                .frame(width: 250, height: 100, alignment: .topLeading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle(Maintasks[mainIndex].childrenTask[subIndex].name)
        .navigationBarItems(trailing: HStack {
            Button("保存") {
                if !taskDeadLine.isEmpty {
                    Maintasks[mainIndex].childrenTask[subIndex].deadline = taskDeadLine
                }
                if !taskMemo.isEmpty {
                    Maintasks[mainIndex].childrenTask[subIndex].memo = taskMemo
                }
                //追加ボタン押下時にその配列の状態を保存する
                let encoder = JSONEncoder()
                if let encodeValue = try? encoder.encode(Maintasks) {
                    UserDefaults.standard.set(encodeValue, forKey: keyString)
                }
            }
        })
        .padding()
        
        Spacer()
    }
}
