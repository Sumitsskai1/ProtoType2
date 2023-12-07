//
//  AddTask.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/15.
//

import SwiftUI

struct AddTask: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .preference(key: TaskPreference.self, value: Task(name: String("add")))
    }
}
