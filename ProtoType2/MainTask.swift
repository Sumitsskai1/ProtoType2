//
//  MainTask.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import Foundation
import SwiftUI

class MainTask : Identifiable {
    var id = UUID()
    var keyString = "hozon1"
    var List: [Task] = []
    
    init () {
        if let savedValue = UserDefaults.standard.data(forKey: "hozon1") {
            let decoder = JSONDecoder()
            if let value = try? decoder.decode([Task].self, from: savedValue) {
                for task in value {
                    List.append(task)
                }
            }
        }
    }
    
    func AppendTask(task :Task) {
        List.append(task)
    }
    
    func RemoveTask(index :Int) {
        List.remove(at: index)
    }
    
    func getTask(index :Int) -> Task {
        return List[index]
    }
    
    func getArray() -> [Task] {
        return List
    }
    
    func loadTask() {
        if let savedValue = UserDefaults.standard.data(forKey: keyString) {
            let decoder = JSONDecoder()
            if let value = try? decoder.decode([Task].self, from: savedValue) {
                List = value
            }
        }
    }
    
    func saveTask() {
        let encoder = JSONEncoder()
        if let encodedValue = try? encoder.encode(List) {
            UserDefaults.standard.set(encodedValue, forKey: keyString)
        }
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: keyString)
    }
    // リストの入れ子にするときのあたらしく何かの属性をつける必要がある
    //var taskList: TaskList
}
