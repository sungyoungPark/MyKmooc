//
//  ClassList.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//

import Foundation


struct ClassList : Codable {
    
    var classes : [Class?]


    init( classes : [Class?]) {
        
        self.classes = classes
        
        
    }

}
