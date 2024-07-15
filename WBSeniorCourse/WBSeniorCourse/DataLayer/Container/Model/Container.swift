//
//  Container.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

protocol Container {
    associatedtype Item

    mutating func add(_ item: Item)
    mutating func remove() -> Item?
}
