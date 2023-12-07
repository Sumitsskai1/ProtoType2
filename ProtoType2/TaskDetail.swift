//
//  TaskDetail.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/12.
//

import SwiftUI

struct TaskDetail: View {
    @State var MainTasks : [Task]
    let mainIndex : Int
    @State var newSubTaskName = String("")
    @State var taskDeadLine = String("")
    @State var taskMemo = String("")
 
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("DeadLine")
                    Spacer()
                    TextField(MainTasks[mainIndex].deadline, text:$taskDeadLine)
                        .frame(width: 250, height: 30, alignment: .leading)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        
                }
                .padding()
                
                HStack {
                    Text("Memo")
                    Spacer()
                    TextField(MainTasks[mainIndex].memo, text:$taskMemo)
                        .frame(width: 250, height: 90, alignment: .topLeading)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                HStack {
                    Spacer()
                    TextField("New Sub Task Name...", text: $newSubTaskName)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button("Add") {
                        // TODO namae kaburi taiou ireru
                        MainTasks[mainIndex].childrenTask.append(
                            Task(parentTask:    String(format: MainTasks[mainIndex].name),
                                 name:          String(format: newSubTaskName )))
                        
                        let encoder = JSONEncoder()
                        if let encodeValue = try? encoder.encode(MainTasks) {
                            UserDefaults.standard.set(encodeValue, forKey: keyString)
                        }
                        
                    }
                    .frame(width:50, height: 20)
                }
                List {
                    ForEach(0..<MainTasks[mainIndex].childrenTask.count, id: \.self) { index in
                        NavigationLink {
                            SubTaskDetail(Maintasks: MainTasks, mainIndex: mainIndex, subIndex: index)
                                .onDisappear() {
                                    if let savedValue = UserDefaults.standard.data(forKey: keyString) {
                                        let decoder = JSONDecoder()
                                        if let value = try? decoder.decode([Task].self, from: savedValue) {
                                            MainTasks = value
                                        }
                                    }
                                }
                        } label: {
                            TaskRow(task: MainTasks[mainIndex].childrenTask[index])
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        MainTasks[mainIndex].childrenTask.remove(at: indexSet.first!)
                        let encoder = JSONEncoder()
                        if let encodeValue = try? encoder.encode(MainTasks) {
                            UserDefaults.standard.set(encodeValue, forKey: keyString)
                        }
                    })
                }
                .navigationBarTitle(MainTasks[mainIndex].name, displayMode: .inline)
                .navigationBarItems(trailing: HStack {
                    Button("保存") {
                        if !taskDeadLine.isEmpty {
                            MainTasks[mainIndex].deadline = taskDeadLine
                        }
                        if !taskMemo.isEmpty {
                            MainTasks[mainIndex].memo = taskMemo
                        }
                        
                        //追加ボタン押下時にその配列の状態を保存する
                        let encoder = JSONEncoder()
                        if let encodeValue = try? encoder.encode(MainTasks) {
                            UserDefaults.standard.set(encodeValue, forKey: keyString)
                        }
                    }
                })
            }
        }
    }
}

