//
//  ShoppingTableViewDatas.swift
//  TableViewPractice2
//
//  Created by 유철원 on 5/24/24.
//

import UIKit


struct Section: Codable {
    var header: String
    var footer: String
    var rowSize: Int
}

struct ToDo: Codable{
    var action: String
    var isDone: Bool
    var bookmark: Bool
}


struct UserDefaultsManager {
    @UserDefaultWrapper(key: "todoList", defaultValue: nil)
    static var todoList: [ToDo]?
    
    @UserDefaultWrapper(key: "sectionList", defaultValue: nil)
    static var sectionList: [Section]?
}


@propertyWrapper
struct UserDefaultWrapper<T: Codable> {
    private let key: String
    private let defaultValue: T?

    init(key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T? {
        get {
              if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
                  let decoder = JSONDecoder()
                  if let lodedObejct = try? decoder.decode(T.self, from: savedData) {
                      return lodedObejct
                  }
              }
              return defaultValue
          }
          set {
              let encoder = JSONEncoder()
              if let encoded = try? encoder.encode(newValue) {
                  UserDefaults.standard.setValue(encoded, forKey: key)
              }
          }
    }
    
}


