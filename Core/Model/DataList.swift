//
//  DataList.swift
//  Skating
//
//  Created by Brant on 3/16/15.
//  Copyright (c) 2015 wusj. All rights reserved.
//

import Foundation

class DataList {
    var isReloading: Bool = false
    var isReachLastPage: Bool = false
    var currentPage: Int = 0
    var totalRecord: Int = 0
    var list: NSMutableArray = NSMutableArray(capacity: 0)
    
    func loadDataFromData(data: NSDictionary) {
        if self.isReloading {
            self.list.removeAllObjects()
            self.currentPage = 1
            self.isReachLastPage = false
        }
        
        if self.list.count == 0 {
            self.currentPage = 1
        } else {
            currentPage++;
        }
        
        
        
    }
    
    func count() -> Int {
        return list.count
    }
    
    func objectAtInde(index: Int) -> AnyObject {
        return list.objectAtIndex(index)
    }
    
    func removeAllObjects() {
        list.removeAllObjects()
    }
    
    func isLastPage() ->Bool {
        if self.list.count >= self.totalRecord {
            return true
        }
        
        return false
    }
}