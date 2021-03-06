//
//  FCProtocol.swift
//  grammarAnalyser
//
//  Created by caishilin on 2018/6/15.
//  Copyright © 2018 蔡士林. All rights reserved.
//

import Foundation

protocol Executor {
    static func execute(context: CodeContext, params: [Token]) -> CommandResult
}

protocol Command {
    static var keyWord: String {get}
    static var alias: String {get}
    static var executor: Executor.Type {get}
    static var options: [Command.Type] {get}
    static func execute(context: CodeContext, params: [Token]) -> CommandResult
}

struct Code {
    var state: CodeSate
    var scope: Scope
    var value: String
    var executeOffset: Int = 0
    var row: Int {
        get {
            return scope.row
        }
        set {
            scope.row = row
        }
    }
    
    init(state: CodeSate, scope: Scope, value: String, executeOffset: Int = 0) {
        self.state = state
        self.scope = scope
        self.value = value
        self.executeOffset = executeOffset
    }
}

struct CodeContext {
    var commandCode: Code
    var codes: [Code]
}

