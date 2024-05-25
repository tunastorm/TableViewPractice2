//
//  ToDoList.swift
//  TableViewPractice2
//
//  Created by 유철원 on 5/25/24.
//

import UIKit


struct ToDoList {

    private var todoList: [ToDo]

    
    init() {
        if let list = UserDefaultsManager.todoList {
            todoList = list
        } else {
            todoList = [
                ToDo(action: "그립톡 구매하기", isDone: true, bookmark: true),
                ToDo(action: "사이다 구매", isDone: false, bookmark: false),
                ToDo(action: "아이패드 케이스 최저가 알아보기", isDone: false, bookmark: true),
                ToDo(action: "양말", isDone: false, bookmark: true)
            ]
            UserDefaultsManager.todoList = self.todoList
        }
        print(todoList.count)
        print(todoList)
    }

    func getCount() -> Int{
        return todoList.count
    }
    
    func getTodoList() -> [ToDo] {
        return todoList
    }

    func getTodo(at index: Int) -> ToDo {
        return todoList[index]
    }

    mutating func append(action: String, isDone: Bool, bookmark: Bool) {
        let todo = ToDo(action: action, isDone: isDone, bookmark: bookmark)
        self.todoList.append(todo)
        UserDefaultsManager.todoList = self.todoList
    }

    mutating func delete(at index: Int) {
        self.todoList.remove(at: index)
        UserDefaultsManager.todoList = self.todoList
    }

    mutating func update(at index: Int, action: String, isDone: Bool, bookmark: Bool) {
        let todo = ToDo(action: action, isDone: isDone, bookmark: bookmark)
        self.todoList[index] = todo
        UserDefaultsManager.todoList = self.todoList
    }

    mutating func update(at index: Int, action: String) {
        self.todoList[index].action = action
        UserDefaultsManager.todoList = self.todoList
    }

    mutating func updateIsDone(at index: Int) {
        self.todoList[index].isDone.toggle()
        UserDefaultsManager.todoList = self.todoList
    }

    mutating func updateBookmark(at index: Int) {
        self.todoList[index].bookmark.toggle()
        UserDefaultsManager.todoList = self.todoList
    }

}
