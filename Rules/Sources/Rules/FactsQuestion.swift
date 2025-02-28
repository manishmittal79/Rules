//
//  FactsQuestion.swift
//  Rules
//  License: MIT, included below
//

public extension Facts {

    /// This is basically a `String`, but it's more type-safe.
    struct Question: Hashable {
        public var identifier: String

        public init(identifier: String) {
            self.identifier = identifier
        }
    }
}

public extension Facts.Question {
    static let mock = Facts.Question(identifier: "mock")
}

extension Facts.Question: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.identifier = try container.decode(String.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(identifier)
    }
}

extension Facts.Question: ExpressibleByStringLiteral {

    public typealias StringLiteralType = String

    public init(stringLiteral: String) {
        self.identifier = stringLiteral
    }
}

extension Facts.Question: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { return identifier }
    public var debugDescription: String { return identifier }
}

//  Created by Jim Roepcke on 2018-10-18.
//  Copyright © 2018- Jim Roepcke.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//
