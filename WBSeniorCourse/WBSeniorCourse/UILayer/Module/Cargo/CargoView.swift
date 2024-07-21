//
//  CargoView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 17.07.2024.
//

import SwiftUI

struct CargoView: View {
    
    // MARK: - Property Wrappers
    
    @State private var cargos: [Cargo?]
    @State private var safeCargoInfo: String = ""
    
    // MARK: - Initialization and deinitialization
    
    init(cargos: [Cargo?]) {
        self.cargos = cargos
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 12) {
            totalVolumeView
            safeCargoInfoView
        }
        .padding(.vertical, 36)
    }
}

// MARK: - UI Properties

private extension CargoView {
    @ViewBuilder
    private var totalVolumeView: some View {
        Text("Суммарный обьем")
            .font(.title)
            .foregroundColor(.black)
        Text("\(getTotalVolume())м^3")
            .font(.body)
            .foregroundColor(.black)
    }
    
    private var safeCargoInfoView: some View {
        VStack(spacing: 12) {
            Button(action: {
                let safeCargo = getRandomCargo()
                if let safeCargo {
                    safeCargoInfo = safeCargo.info
                } else {
                    safeCargoInfo = "Информация отсутствует"
                }
            }) {
                Text("Показать информацию безопасно")
                    .foregroundColor(.blue)
            }
            
            Text(safeCargoInfo)
                .font(.body)
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, 36)
    }
}

// MARK: - Private methods

private extension CargoView {
    func getTotalVolume() -> Int {
        guard
            !cargos.isEmpty,
            let firstCargo = cargos[safe: 0],
            let firstCargo,
            let doubleCargo = cargos[safe: 1],
            let doubleCargo
        else {
            return 0
        }
        
        return firstCargo +++ doubleCargo
    }
    
    func getRandomCargo() -> Cargo? {
        let index = Int.random(in: 0 ... (cargos.count - 1))
        guard let randomCargo = cargos[safe: index] else {
            return nil
        }
        
        return randomCargo
    }
}

// MARK: - Stubable

extension CargoView: Stubable {
    static func stub() -> any View {
        return CargoView(cargos: [])
    }
}

// MARK: - Preview

#Preview {
    CargoView.stub()
}
