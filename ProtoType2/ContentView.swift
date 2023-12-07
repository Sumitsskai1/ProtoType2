//
//  ContentView.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import SwiftUI

struct ContentView: View {
    @State var MainTasks: [Task] = [Task(name: "testMainTask1")]
    @State var newMainTaskaName = String("")
    var addTask = String("")
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Input New Main Task Name...", text: $newMainTaskaName)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button("Add") {
                        // TODO namae kaburi taiou ireru
                        MainTasks.append(Task(name:String(format: newMainTaskaName )))
                        if (10 < MainTasks.count) {
                            MainTasks.removeAll()
                        }
                    }
                        .frame(width:40, height: 20)
                }
                .padding(.horizontal)
                List {
                    ForEach(0..<MainTasks.count, id: \.self) { index in
                        NavigationLink {
                            TaskDetail(MainTask: MainTasks[index])
                        } label: {
                            TaskRow(task: MainTasks[index])
                        }
                    }
                    .onDelete(perform: { indexSet in
                        MainTasks.remove(at: indexSet.first!)
                    })
                }
            }
            .navigationBarTitle("Task Management App", displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}
