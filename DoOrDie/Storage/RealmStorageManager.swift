//
//  RealmStorageManager.swift
//  DoOrDie
//
//  Created by m223 on 05.08.2023.
//

import UIKit
import RealmSwift

class RealmStorageManager {
    
    
    static var shared = RealmStorageManager()
    
    func addTaskToRealm(title: String, date: String, category: String, team: String, description: String, isDone: Bool) {
        do {
            let realm = try Realm()
            try realm.write {
                let newTask = TaskModel()
                newTask.title = title
                newTask.date = date
                newTask.categories = category
                newTask.team = team
                newTask.descriptionTask = description
                newTask.isDone = isDone
                
                realm.add(newTask)
                
            }
        } catch {
            print("Error adding task: \(error.localizedDescription)")
        }
        
    }
    
    func deleteTaskFromRealm(_ task: TaskModel) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(task)
            }

        } catch {
            print("Error deleting task: \(error.localizedDescription)")
        }
    }
    
    
    
}
