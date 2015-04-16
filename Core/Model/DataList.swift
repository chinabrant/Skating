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
    var list = [AnyObject]()
    
    func loadData(data: [AnyObject]) {
        if self.isReloading {
            list.removeAll(keepCapacity: false)
            self.currentPage = 0
            self.isReachLastPage = false
        }
        
        if self.list.count == 0 {
            self.currentPage = 0
        } else {
            currentPage++;
        }
        
        self.list += data

        if data.count < 10 {
            self.isReachLastPage = true
        }
    }
    
    func count() -> Int {
        return list.count
    }
    
    func objectAtInde(index: Int) -> AnyObject {
        return list[index]
    }
    
    func removeAllObjects() {
        list.removeAll(keepCapacity: false)
    }
    
    func isLastPage() ->Bool {
        if self.list.count >= self.totalRecord {
            return true
        }
        
        return false
    }
}