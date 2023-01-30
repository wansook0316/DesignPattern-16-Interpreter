//
//  ActionCommandExpression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal class ActionCommandExpression: CommandExpression {

    internal let keyword: String

    internal init(keyword: String) {
        self.keyword = keyword
    }

    internal func parse(context: Context) -> Bool {
        guard Self.isValid(keyword: self.keyword) else {
            return false
        }

        context.readNextKeyword()

        guard context.currentKeyword != nil else {
            return false
        }

        return true
    }

    internal func run() -> Bool {
        print("cmd: \(self.keyword)")

        return true
    }

}

extension ActionCommandExpression: KeywordAcceptable {

    internal static func isValid(keyword: String) -> Bool {
        ["FRONT", "BACK", "LEFT", "RIGHT"].contains(keyword)
    }

}

extension ActionCommandExpression: Loggable {

    internal var description: String {
        self.keyword
    }

}
