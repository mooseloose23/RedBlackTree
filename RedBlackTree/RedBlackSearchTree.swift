//
//  RedBlackTree.swift
//  RedBlackTree
//
//  Created by Mustafa Rahman on 10/31/17.
//  Copyright © 2017 Moose. All rights reserved.
//

import Foundation

class RedBlackSearchTree<K: Comparable, T: Comparable> {
    
    private enum Color: Int {
        case RED = 1
        case BLACK = 0
    }

    private var root: Node<K, T>?
    
    private class Node<K: Comparable, T: Comparable> {
        var left: Node?
        var right: Node?
        var key: K
        var value: T
        var N: Int
        var color: Color
        
        init(key: K, value: T, color: Color, N: Int) {
            self.key = key
            self.value = value
            self.color = color
            self.N = N
        }
    }
    
    private func isRed(h: Node<K, T>?) -> Bool {
        if h == nil { return false }
        if h!.color == Color.RED { return true }
        
        return false
    }
    
    private func rotateRight(h: Node<K, T>) -> Node<K, T> {
        let x: Node = h.left!
        h.left = x.right
        x.right = h
        x.color = h.color
        h.color = Color.RED
        return x
    }
    
    private func rotateLeft(h: Node<K, T>) -> Node<K, T> {
        let x: Node = h.right!
        h.right = x.left
        x.left = h
        x.color = h.color
        h.color = Color.RED
        return x
    }
    
    private func flipColors(h: Node<K, T>) {
        h.color = Color.RED
        h.left!.color = Color.BLACK
        h.right!.color = Color.BLACK
    }
    
    // Put value in tree
    func put(key: K, value: T) {
        root = put(h: root, key: key, value: value)
    }
    
    private func put(h: Node<K, T>?, key: K, value: T) -> Node<K, T> {
        guard var h = h else {
            return Node(key: key, value: value, color: Color.RED, N: 1)
        }
        
        if h.key < key { h.right = put(h: h.right, key: key, value: value) }
            
        else if h.key > key { h.left = put(h: h.left, key: key, value: value) }
            
        else { h.value = value }
        
        
        if (isRed(h: h.right) && !isRed(h: h.left)) { h = rotateLeft(h: h)}
        if (isRed(h: h.left) && isRed(h: h.left?.left)) { h = rotateRight(h: h)}
        if (isRed(h: h.left) && isRed(h: h.right)) { flipColors(h: h)}
        
        return h
        
    }

    private func get(h: Node<K, T>?, key: K) -> T? {
        guard let h = h else {
            return nil
        }
        
        if (h.key < key) { return get(h: h.right, key: key)}
        else if (h.key > key) { return get(h: h.left, key: key)}
        else { return h.value }
    }
    
    // Get value from tree
    func get(key: K) -> T? {
        return get(h: root, key: key)
    }
    
    private func traverse(node: Node<K, T>?, vals: inout [K]) {

        if (node == nil) {
            return
        }
        
        // left
        traverse(node: node?.left, vals: &vals)
        // root
        vals.append(node!.key)
        // right
        traverse(node: node?.right, vals: &vals)
    
    }
    
    // In order traversal
    func traverse() -> [K] {
        var vals = [K]()
        traverse(node: root, vals: &vals)
        return vals
    }
    
}
