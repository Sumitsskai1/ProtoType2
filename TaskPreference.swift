//
//  TaskPreference.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2024/01/15.
//

import SwiftUI

struct TaskPreference: PreferenceKey {
    
    typealias Value = Task
    
    static var defaultValue: Task = Task()
    
    static func reduce(value: inout Task, nextValue: () -> Task) {
        value = nextValue()
    }
}
