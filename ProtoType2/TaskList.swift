//
//  TaskList.swift
//  ProtoTypeApp
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import Foundation
import SwiftUI

struct TaskList: View {
    @State var MainTaskList: [Task] = []
    
    var body: some View {
        
        List(MainTaskList){ task in
            NavigationLink {
                //TaskDetail(MainTask: task)
            } label: {
                TaskRow(task: task)
            }
                
        }
    }
}
