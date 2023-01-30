//
//  main.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal func main() {

    let script = "BEGIN FRONT LOOP 2 BACK RIGHT END BACK LOOP 4 BACK FRONT LEFT END LEFT END"

    let context = Context(script: script)
    let expression = BeginExpression()

    if expression.parse(context: context) {
        print(expression.description)
    }

}

main()
