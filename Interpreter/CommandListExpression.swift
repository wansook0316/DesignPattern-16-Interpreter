//
//  CommandListExpression.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal class CommandListExpression: Expression {

    internal func parse(context: Context) -> Bool {
        var result: Bool = true

        while true {
            guard let keyword = context.currentKeyword else {
                result = false
                break
            }

            guard keyword != "END" else {
                context.readNextKeyword()
                break
            }

            guard let command = self.determineCommand(with: keyword),
                  command.parse(context: context) else {
                result = false
                break
            }

            self.commands.append(command)
        }

        return result
    }

    internal func run() -> Bool {
        for command in self.commands {
            guard command.run() else {
                return false
            }
        }

        return true
    }

    // 원래는 다른 방식으로 하는게 좋은데 그냥 대충 함
    private func determineCommand(with keyword: String) -> CommandExpression? {
        let command: CommandExpression?

        if LoopCommandExpression.isValid(keyword: keyword) {
            command = LoopCommandExpression(keyword: keyword)
        } else if ActionCommandExpression.isValid(keyword: keyword) {
            command = ActionCommandExpression(keyword: keyword)
        } else {
            command = nil
        }

        return command
    }

    private var commands = [CommandExpression]()

}

extension CommandListExpression: Loggable {

    internal var description: String {
        self.commands.map { $0.description }.joined(separator: " ")
    }

}
