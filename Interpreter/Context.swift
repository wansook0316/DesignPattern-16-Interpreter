//
//  Context.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal class Context {

    private(set) var currentKeyword: String?

    internal init(script: String) {
        self.tokenizer = Tokenizer(script: script)
        self.readNextKeyword()
    }

    internal func readNextKeyword() {
        self.currentKeyword = self.tokenizer.nextToken
    }

    private let tokenizer: Tokenizer

}

internal class Tokenizer {

    internal init(script: String) {
        self.tokens = script.components(separatedBy: .whitespaces)
    }

    internal var nextToken: String? {
        guard self.tokens.isEmpty == false else {
            return nil
        }

        return self.tokens.removeFirst()
    }

    private var tokens: [String]

}
