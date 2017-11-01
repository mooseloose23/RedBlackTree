//
//  Tests.swift
//  RedBlackTree
//
//  Created by Mustafa Rahman on 10/31/17.
//  Copyright © 2017 Moose. All rights reserved.
//

import Foundation

class Tests {
    
    init() {
        let tree: RedBlackSearchTree = RedBlackSearchTree<String, Int>()
        
        tree.put(key: "S", value: 1)
        tree.put(key: "E", value: 2)
        tree.put(key: "A", value: 3)
        tree.put(key: "R", value: 4)
        tree.put(key: "C", value: 5)
        tree.put(key: "H", value: 6)
        tree.put(key: "X", value: 7)
        tree.put(key: "M", value: 8)
        tree.put(key: "P", value: 9)
        tree.put(key: "L", value: 10)
        
        assert(tree.get(key: "A") == 3, "Should be 3")
        assert(tree.get(key: "X") == 7, "Should be 7")
        assert(tree.get(key: "M") == 8, "Should be 8")
        assert(tree.get(key: "L") == 10, "Should be 10")
        
        
        // traverse the tree
        print(tree.traverse())
        
        print("Test passes!")
        
    }
    
}
