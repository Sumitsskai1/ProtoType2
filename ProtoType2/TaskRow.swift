//
//  TaskRow.swift
//  ProtoTypeApp
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import Foundation
import SwiftUI

struct TaskRow: View {
   var task: Task
    
    var body: some View {
        HStack {
            Text(task.name)
        }
    }
}

