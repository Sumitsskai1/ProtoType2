//
//  MainTask.swift
//  ProtoType2
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import Foundation
import SwiftUI

struct MainTask : Hashable, Codable, Identifiable {
    var id = UUID()

    var name: String
    // リストの入れ子にするときのあたらしく何かの属性をつける必要がある
    //var taskList: TaskList
}
