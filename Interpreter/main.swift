//
//  main.swift
//  Interpreter
//
//  Created by Choiwansik on 2023/01/30.
//

import Foundation

internal func main() {

    let script = "BEGIN FRONT LOOP 2 BACK RIGHT END BACK END"

    let context = Context(script: script)

    while true {
        guard let keyword = context.currentKeyword else {
            break
        }

        print(keyword)

        context.readNextKeyword()
    }

}

main()
