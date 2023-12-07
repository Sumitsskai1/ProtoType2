//
//  SubTaskDetail.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/12.
//

import SwiftUI

struct SubTaskDetail: View {
    var SubTask: Task
    
    var body: some View {
        VStack{
            HStack {
                Text("Main Task Name")
                Spacer()
            }
            Text(" " + SubTask.parentTask)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("Task Name")
                Spacer()
            }
            Text(" " + SubTask.name)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Dead Line")
                Spacer()
            }

            Text(" " + SubTask.deadline)
                .frame(width: 250, height: 30, alignment: .leading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Memo")
                Spacer()
            }
            
            Text(" " + SubTask.memo)
                .frame(width: 250, height: 100, alignment: .topLeading)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle(SubTask.name)
        .padding()
        
        Spacer()
    }
}

#Preview {
    SubTaskDetail(SubTask: Task(parentTask: "ParentTaskPreview", name: "SubTaskDetailPreview"))
}

