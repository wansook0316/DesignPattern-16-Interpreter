//
//  BeginExpression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal class BeginExpression: Expression {

    internal func parse(context: Context) -> Bool {
        guard let keyword = context.currentKeyword,
              Self.isValid(keyword: keyword) else {
            return false
        }

        self.expression = CommandListExpression()

        context.readNextKeyword()
        guard let expression else {
            return false
        }

        return expression.parse(context: context);
    }

    internal func run() -> Bool {
        guard let expression else {
            return false
        }
        return expression.run()
    }

    private var expression: CommandListExpression?

}

extension BeginExpression: KeywordAcceptable {

    internal static func isValid(keyword: String) -> Bool {
        keyword == "BEGIN"
    }

}

extension BeginExpression: Loggable {

    internal var description: String {
        "BEGIN " + "[" + (self.expression?.description ?? "") + "]"
    }

}
