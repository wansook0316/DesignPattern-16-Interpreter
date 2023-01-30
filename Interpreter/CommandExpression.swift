//
//  CommandExpression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal protocol CommandExpression: Expression, KeywordAcceptable {

    var keyword: String { get }
        
}
