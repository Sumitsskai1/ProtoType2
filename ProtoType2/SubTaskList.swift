//
//  SubTaskList.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/12.
//
import Foundation
import SwiftUI

struct SubTaskList: View {
    @State var SubTasks: [Task] = []

    var body: some View {
        List(SubTasks){ subtask in
            NavigationLink {
               // SubTaskDetail(SubTask: subtask)
            } label: {
                TaskRow(task: subtask)
            }
        }
    }
}

#Preview {
    SubTaskList()
}

