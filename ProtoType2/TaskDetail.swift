//
//  TaskDetail.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/12.
//

import SwiftUI

struct TaskDetail: View {    
    var MainTask: Task
    @State var newSubTaskName = String("")
    @State var SubTasks: [Task] = [Task(parentTask: "testSubTaskParent", name: "testSubTask1")]

    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("DeadLine")
                    Text("1900/1/1")
                        .frame(width: 250, height: 30, alignment: .leading)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                Text("Memo")
                HStack {
                    Spacer()
                    TextField("New Sub Task Name...", text: $newSubTaskName)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button("Add") {
                        // TODO namae kaburi taiou ireru
                        SubTasks.append(Task(parentTask:    String(format: MainTask.name),
                                             name:          String(format: newSubTaskName )))
                    }
                    .frame(width:50, height: 20)
                }
                List {
                    ForEach(0..<SubTasks.count, id: \.self) { index in
                        NavigationLink {
                            SubTaskDetail(SubTask: SubTasks[index])
                        } label: {
                            TaskRow(task: SubTasks[index])
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        SubTasks.remove(at: indexSet.first!)
                    })
                }
                .navigationBarTitle(MainTask.name, displayMode: .inline)
            }
        }
    }
}

