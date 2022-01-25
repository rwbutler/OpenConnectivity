//
//  ConnectivityPublisher.swift
//  Connectivity
//
//  Created by Ross Butler on 05/05/2020.
//

#if canImport(OpenCombine)

import Connectivity
import Foundation
import OpenCombine

public struct ConnectivityPublisher: Publisher {
    public typealias Output = Connectivity
    public typealias Failure = Never

    public init() {}

    public func receive<S: Subscriber>(subscriber: S)
        where ConnectivityPublisher.Failure == S.Failure, ConnectivityPublisher.Output == S.Input {
        let subscription = ConnectivitySubscription(subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}

#endif
