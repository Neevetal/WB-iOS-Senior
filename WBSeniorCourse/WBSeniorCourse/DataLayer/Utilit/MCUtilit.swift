//
//  MCUtilit.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import SwiftUI
import MultipeerConnectivity

final class MCUtilit: NSObject {
    
    // MARK: - Constants
    
    private let serviceType = "wb_mc_utilit"
    
    // MARK: - Property Wrappers
    
    private var statusText = ""
    private var outputText = ""
    
    // MARK: - Properties
    
    private var multipeerSession: MCSession?
    private let peerID = MCPeerID(displayName: UIDevice.current.name)
    private var browser: MCNearbyServiceBrowser?
    private var advertiser: MCNearbyServiceAdvertiser?
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
}

// MARK: - Private methods

private extension MCUtilit {
    func startAdvertiser() {
        advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        advertiser?.delegate = self
        advertiser?.startAdvertisingPeer()
    }
    
    func startBrowser() {
        browser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        browser?.delegate = self
        browser?.startBrowsingForPeers()
    }
    
    func stop() {
        if let advertiser {
            advertiser.stopAdvertisingPeer()
        }
        
        if let browser {
            browser.stopBrowsingForPeers()
        }
        
        multipeerSession?.disconnect()
    }
}

// MARK: - Public methods

extension MCUtilit {
    func start() {
        multipeerSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        multipeerSession?.delegate = self
        startBrowser()
    }
    
    func connect() {
        stop()
        startAdvertiser()
    }
    
    func disconnect() {
        multipeerSession?.connectedPeers.forEach {
            multipeerSession?.cancelConnectPeer($0)
        }
        
        stop()
        startBrowser()
    }
    
    func send(message: String) {
        guard
            let connectedPeers = multipeerSession?.connectedPeers,
            let messageData = try? encoder.encode(message)
        else {
            return
        }
        
        do {
            try multipeerSession?.send(messageData, toPeers: connectedPeers, with: .reliable)
        } catch {}
    }
}

// MARK: - MCSessionDelegate

extension MCUtilit: MCSessionDelegate {
    func session(
        _ session: MCSession,
        peer peerID: MCPeerID,
        didChange state: MCSessionState
    ) {
        switch state {
        case .notConnected:
            DispatchQueue.main.async {
                self.statusText = "Not connected"
            }
        case .connecting:
            DispatchQueue.main.async {
                self.statusText = "Connecting..."
            }
        case .connected:
            DispatchQueue.main.async {
                self.statusText = "Connected"
            }
        @unknown default:
            DispatchQueue.main.async {
                self.statusText = "Error"
            }
        }
    }
    
    func session(
        _ session: MCSession,
        didReceive data: Data,
        fromPeer peerID: MCPeerID
    ) {
        guard let message = try? decoder.decode(String.self, from: data)
        else {
            return
        }
        
        DispatchQueue.main.async {
            self.outputText = message
        }
    }
    
    func session(
        _ session: MCSession,
        didReceive stream: InputStream,
        withName streamName: String,
        fromPeer peerID: MCPeerID
    ) {}
    
    func session(
        _ session: MCSession,
        didStartReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        with progress: Progress
    ) {}
    
    func session(
        _ session: MCSession,
        didFinishReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        at localURL: URL?,
        withError error: (any Error)?
    ) {}
}

// MARK: - MCNearbyServiceAdvertiserDelegate

extension MCUtilit: MCNearbyServiceAdvertiserDelegate {
    func advertiser(
        _ advertiser: MCNearbyServiceAdvertiser, 
        didReceiveInvitationFromPeer peerID: MCPeerID,
        withContext context: Data?,
        invitationHandler: @escaping (Bool, MCSession?) -> Void
    ) {
        invitationHandler(true, multipeerSession)
    }
}

// MARK: - MCNearbyServiceBrowserDelegate

extension MCUtilit: MCNearbyServiceBrowserDelegate {
    func browser(
        _ browser: MCNearbyServiceBrowser,
        foundPeer peerID: MCPeerID,
        withDiscoveryInfo info: [String : String]?
    ) {
        guard let multipeerSession else { return }
        browser.invitePeer(peerID, to: multipeerSession, withContext: nil, timeout: 10)
    }
    
    func browser(
        _ browser: MCNearbyServiceBrowser,
        lostPeer peerID: MCPeerID
    ) {}
}
