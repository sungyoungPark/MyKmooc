//
//  KmoocListViewModel.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//
//
import Foundation


class KmoocListViewModel {
    
    var listUpdate : () -> Void = { }
    
    var classesList : ClassList!
    
    func classesCount() -> Int {
        if let classesList = classesList{
            return classesList.classes.count
        }
        return 0
    }
    
    func listUP() {
        JsonManager.shared.getJson { [weak self] (result) in
            self?.classesList = result
            self?.listUpdate()
            print("fin", result)
        }
    }
    
    func indexClass(indexPath : IndexPath) -> Class? {
//        print(classesList.classes[indexPath.row])
//        print(classesList.classes[indexPath.row]?.class_image.image["raw"])
        return classesList.classes[indexPath.row]
    }
    
}
