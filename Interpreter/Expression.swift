//
//  Expression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal protocol Expression: Loggable {

    func parse(context: Context) -> Bool
    
    func run() -> Bool

}

internal protocol KeywordAcceptable {

    static func isValid(keyword: String) -> Bool

}

internal protocol Loggable {

    var description: String { get }

}
