//
//  Task.swift
//  ProtoTypeApp
//
//  Created by SuMiTS&S 開発第一部 on 2023/12/07.
//

import Foundation
import SwiftUI

struct Task : Hashable, Codable, Identifiable {
    var id = UUID()

    var parentTask:     String = ""
    var name:           String = ""
    var deadline:       Date = Date()
    var memo:           String = ""
    var childrenTask:   [Task] = []
}

