//
//  ConnectCheckUtil.swift
//  PlayVideoCleanArchitecture
//
//  Created by A Tang Ky on 10/18/22.
//

import Foundation
import Network

class ConnectCheckUtil {
    static let shared = ConnectCheckUtil()

        let monitor = NWPathMonitor()
        private var status: NWPath.Status = .requiresConnection
        var isReachable: Bool { status == .satisfied }
        var isReachableOnCellular: Bool = true

        func startMonitoring() {
            monitor.pathUpdateHandler = { [weak self] path in
                self?.status = path.status
                self?.isReachableOnCellular = path.isExpensive

                if path.status == .satisfied {
                    print("We're connected!")
                    // post connected notification
                } else {
                    print("No connection.")
                    // post disconnected notification
                }
                print(path.isExpensive)
            }

            let queue = DispatchQueue(label: "NetworkMonitor")
            monitor.start(queue: queue)
        }

        func stopMonitoring() {
            monitor.cancel()
        }
}
