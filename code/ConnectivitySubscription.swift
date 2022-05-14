//
//  ConnectivitySubscription.swift
//  Connectivity
//
//  Created by Ross Butler on 05/05/2020.
//

#if canImport(OpenCombine)

import Connectivity
import Foundation
import OpenCombine

class ConnectivitySubscription<S: Subscriber>: Subscription where S.Input == Connectivity, S.Failure == Never {
    private let connectivity: Connectivity
    private var subscriber: S?

    init(configuration: ConnectivityConfiguration, subscriber: S) {
        connectivity = Connectivity(configuration: configuration)
        self.subscriber = subscriber
        startNotifier(with: subscriber)
    }

    func cancel() {
        stopNotifier()
    }

    func request(_: Subscribers.Demand) {}

    private func startNotifier(with subscriber: S) {
        let connectivityChanged: (Connectivity) -> Void = { connectivity in
            _ = subscriber.receive(connectivity)
        }
        connectivity.whenConnected = connectivityChanged
        connectivity.whenDisconnected = connectivityChanged
        connectivity.startNotifier()
    }

    private func stopNotifier() {
        connectivity.stopNotifier()
        subscriber = nil
    }
}

#endif
