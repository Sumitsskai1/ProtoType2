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
    @State var taskDeadLine = Date()
    @State var taskMemo = String("")
    var body: some View {
        VStack{
            HStack {
                Text("メインタスク")
                Spacer()
            }
            Text(" " + Maintasks[mainIndex].childrenTask[subIndex].parentTask)
                .frame(width: 300, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            DatePicker("タスク期限",
                       selection: $taskDeadLine,
                       displayedComponents: [.date])
            .environment(\.locale, Locale(identifier: "ja_JP"))
            HStack {
                Text("メモ")
                Spacer()
            }
            
            TextEditor(text:$Maintasks[mainIndex].childrenTask[subIndex].memo)
                .frame(width: 300, height: 300, alignment: .topLeading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle(Maintasks[mainIndex].childrenTask[subIndex].name)
        .navigationBarItems(trailing: HStack {
            Button(action: {
                Maintasks[mainIndex].childrenTask[subIndex].deadline = taskDeadLine
                if !taskMemo.isEmpty {
                    Maintasks[mainIndex].childrenTask[subIndex].memo = taskMemo
                }
                //追加ボタン押下時にその配列の状態を保存する
                let encoder = JSONEncoder()
                if let encodeValue = try? encoder.encode(Maintasks) {
                    UserDefaults.standard.set(encodeValue, forKey: keyString)
                }
            }) {
                Image(systemName: "externaldrive.badge.checkmark")
                    .fontWeight(.light)
                Text("Save")
            }
        })
        .padding()
        
        Spacer()
    }
}

