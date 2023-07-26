//
//  TaskModel.swift
//  DoOrDie
//
//  Created by m223 on 23.07.2023.
//

import UIKit
import RealmSwift

enum Categories {

    case homework
    case work
    case another
}

class TaskModel: Object {

    @objc dynamic var title = ""
    @objc dynamic var date = ""
    @objc dynamic var categories = ""
    @objc dynamic var team = ""
    @objc dynamic var descriptionTask = ""
    @objc dynamic var isDone = false

}
