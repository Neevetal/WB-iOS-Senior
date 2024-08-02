//
//  MCView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import SwiftUI

struct MCView: View {
    
    // MARK: - Property Wrappers
    
    @EnvironmentObject private var mcUtilit: MCUtilit
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            statusLabel
            messageLabel
            Spacer()
            connectButton
            disconnectButton
            sendMessageButton
        }
        .padding()
        .onAppear {
            mcUtilit.start()
        }
        .onDisappear{
            mcUtilit.stop()
        }
    }
}

// MARK: - UI Properties

private extension MCView {
    @ViewBuilder
    private var statusLabel: some View {
        Text(mcUtilit.statusText)
            .foregroundColor(AppColor.Text.red.color)
            .font(.montserratFont(size: 14, weight: .regular))
            .padding(.top, 40)
    }
    
    @ViewBuilder
    private var messageLabel: some View {
        Text(mcUtilit.messageText)
            .foregroundColor(Color.black)
            .font(.montserratFont(size: 16, weight: .medium))
            .padding(.top, 16)
    }
    
    @ViewBuilder
    private var connectButton: some View {
        Button(AppString.MultipeerConnectivity.connect) {
            mcUtilit.connect()
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(12)
    }
    
    @ViewBuilder
    private var disconnectButton: some View {
        Button(AppString.MultipeerConnectivity.disconnect) {
            mcUtilit.disconnect()
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(12)
    }
    
    @ViewBuilder
    private var sendMessageButton: some View {
        Button(AppString.MultipeerConnectivity.sendMessage) {
            mcUtilit.send(message: "Hello from \(UIDevice.current.name)")
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(12)
        .padding(.bottom, 24)
    }
}

// MARK: - Preview

#Preview {
    MCView()
}
