//
//  JsonManager.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/09.
//

import Foundation

class JsonManager {

    static let shared = JsonManager()

    let decoder = JSONDecoder()
    
    let apiKeyEncoding = "6rS1dQg%2FxU4aClK366WP1SKqIo85APZCMnTYs2bbM6O7H1xz7ZI4Sf1HJvOh6QtNiFBek32uGwAlsuMItLgx4w%3D%3D"
    let apiKeyDecoding =
        "6rS1dQg/xU4aClK366WP1SKqIo85APZCMnTYs2bbM6O7H1xz7ZI4Sf1HJvOh6QtNiFBek32uGwAlsuMItLgx4w=="
    
    let apiURL = "http://apis.data.go.kr/B552881/kmooc/courseList?ServiceKey="
    
    func getJson(pageNum : Int ,completed: @escaping (ClassList) -> Void) {
    
        if let URL = URL(string: apiURL + apiKeyEncoding + "&page=\(pageNum)") {
            URLSession.shared.dataTask(with: URL) { data, response, error in
                if let data = data {
                    do {
                        let object = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                        guard let jsonObject = object else { return }
                        if let res = jsonObject["results"] as? [[String : Any]]{
                            let classes = res.map {
                                self.getClass(data: try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted))
                            }
//                            print("classes", classes)
                            print("success",URL)
                            completed(ClassList(lastPageNum: pageNum, classes: classes))
                        }
                    }
                    catch {
                        print("error",URL)
                    }
                }
            }.resume()
        }
        
    }
    
    func getClass(data : Data?) -> Class? {
        if let data = data {
            return try? decoder.decode(Class.self, from: data)
        }
        else{
            return nil
        }
    }
}
