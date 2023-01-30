//
//  LoopCommandExpression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal class LoopCommandExpression: CommandExpression {

    internal let keyword: String
    internal var count: Int?

    internal init(keyword: String) {
        self.keyword = keyword
    }

    internal func parse(context: Context) -> Bool {
        guard Self.isValid(keyword: self.keyword) else {
            return false
        }

        context.readNextKeyword()
        guard let count = context.currentKeyword else {
            return false
        }
        self.count = Int(count)

        context.readNextKeyword()
        guard context.currentKeyword != nil else {
            return false
        }

        self.expression = CommandListExpression()
        guard let expression else {
            return false
        }
        return expression.parse(context: context)
    }

    internal func run() -> Bool {
        guard let count, let expression else {
            return false
        }

        for _ in (0..<count) {
            guard expression.run() else {
                return false
            }
        }

        return true
    }

    private var expression: CommandListExpression?

}

extension LoopCommandExpression: KeywordAcceptable {

    internal static func isValid(keyword: String) -> Bool {
        
        keyword == "LOOP"
    }

}

extension LoopCommandExpression: Loggable {

    internal var description: String {
        "LOOP(\(self.count ?? 0))" + "{" + (self.expression?.description ?? "") + "}"
    }

}
