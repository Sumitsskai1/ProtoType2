//
//  ContentView.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import SwiftUI

let keyString = "hozon1"

struct ContentView: View {
    @State var MainTasks: [Task] = []
    @State var newMainTaskaName = String("")
    @State var isFirst = true
    var addTask = String("")
    
    init() {
        //初期処理保存しているタスクを読み込む
        if let savedValue = UserDefaults.standard.data(forKey: keyString) {
            let decoder = JSONDecoder()
            if let value = try? decoder.decode([Task].self, from: savedValue) {
                _MainTasks = State(initialValue: value)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    TextField("New Main Task Name...", text: $newMainTaskaName)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    
                    Button(action: {
                        // TODO namae kaburi taiou ireru
                        MainTasks.append(Task(name:String(format: newMainTaskaName )))
                        
                        //追加ボタン押下時にその配列の状態を保存する
                        let encoder = JSONEncoder()
                        if let encodeValue = try? encoder.encode(MainTasks) {
                            UserDefaults.standard.set(encodeValue, forKey: keyString)
                        }
                    }){
                        Image(systemName: "plus.circle")
                            .fontWeight(.light)
                        Text("Add")
                            .fontWeight(.light)
                    }
                    .frame(width:60, height: 20)
                }
                .padding(.horizontal)
                List {
                    ForEach(0..<MainTasks.count, id: \.self) { index in
                        NavigationLink() {
                            TaskDetail(MainTasks: MainTasks, mainIndex: index)
                                .onDisappear() {
                                    if let savedValue = UserDefaults.standard.data(forKey: keyString) {
                                        let decoder = JSONDecoder()
                                        if let value = try? decoder.decode([Task].self, from: savedValue) {
                                            MainTasks = value
                                        }
                                    }
                                }
                        } label: {
                            TaskRow(task: MainTasks[index])
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        MainTasks.remove(at: indexSet.first!)
                        let encoder = JSONEncoder()
                        if let encodeValue = try? encoder.encode(MainTasks) {
                            UserDefaults.standard.set(encodeValue, forKey: keyString)
                        }
                    })
                }
            }
            .navigationBarTitle(Text("Task Management App"), displayMode: .inline)
        }
    }
}


#Preview {
    ContentView()
}
