//
//  SwiftAsyncOperation.swift
//
//  Created by Wenzhong Zhang on 2019-07-02.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import Foundation



open class SwiftAsyncOperation: Operation {
    open override var isAsynchronous: Bool { true }
    open override var isExecuting: Bool {
        get { _executing }
        set {
            if isExecuting == newValue {
                return
            }
            _executing = newValue
        }
    }
    open override var isFinished: Bool {
        get { _finished }
        set {
            if isFinished == newValue {
                return
            }
            _finished = newValue
        }
    }
    open override var isReady: Bool {
        get { _ready }
        set {
            if isReady == newValue {
                return
            }
            _ready = newValue
        }
    }
    open var namePrefix: String? {
        Bundle.main.bundleIdentifier
    }
    private var _executing = false {
        willSet {
            willChangeValue(for: \.isExecuting)
        }
        didSet {
            didChangeValue(for: \.isExecuting)
        }
    }
    private var _finished = false {
        willSet {
            willChangeValue(for: \.isFinished)
        }
        didSet {
            didChangeValue(for: \.isFinished)
        }
    }
    private var _ready = false {
        willSet {
            willChangeValue(for: \.isReady)
        }
        didSet {
            didChangeValue(for: \.isReady)
        }
    }
    private var nameSuffix: String {
        .init(describing: type(of: self))
    }
    public override init() {
        super.init()
        _executing = super.isExecuting
        _finished = super.isFinished
        _ready = super.isReady
        let suffix = nameSuffix
        guard let prefix = namePrefix else {
            name = suffix
            return
        }
        name = [prefix, suffix].joined(separator: ".")
    }
    open override func cancel() {
        super.cancel()
        finish()
    }
    open override func start() {
        if isCancelled {
            finish()
            return
        }
        isReady = false
        main()
    }
    open override func main() {
        isExecuting = true
    }
    open func finish() {
        isExecuting = false
        isFinished = true
    }
}
