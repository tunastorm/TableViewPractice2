//
//  SectionList.swift
//  TableViewPractice2
//
//  Created by 유철원 on 5/24/24.
//

import UIKit



struct SectionList {
    private var sectionList: [Section]
    
    init() {
        if let list = UserDefaultsManager.sectionList {
            self.sectionList = list
        } else {
            sectionList = [
               Section(header: " ", footer: " ", rowSize: 1),
               Section(header: " ", footer: " ", rowSize: 4)
            ]
            UserDefaultsManager.sectionList = self.sectionList
        }
        print(sectionList.count)
        print(sectionList)
    }
    
    func getSectionList() -> [Section] {
        return self.sectionList
    }
    
    func getSection(at index: Int) -> Section {
        return self.sectionList[index]
    }
    
    mutating func setSectionList(todoSize: Int) {
        self.sectionList[1].rowSize = todoSize
        UserDefaultsManager.sectionList = self.sectionList
    }
}
