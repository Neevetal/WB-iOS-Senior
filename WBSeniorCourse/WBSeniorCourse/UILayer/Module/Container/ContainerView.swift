//
//  ContainerView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

struct ContainerView: View {
    
    // MARK: - Body
    
    var body: some View {
        Text("WORK IN CONSOLE")
            .onAppear {
                start()
            }
    }
}

// MARK: - Private methods

private extension ContainerView {
    func makeOpaque<T: Container>(container: T) -> some Container {
        return container
    }
    
    func start() {
        var intStack = Stack<Int>()
        intStack.add(1)
        intStack.add(2)
        intStack.add(3)
        print("intStack remove", intStack.remove() ?? 0)

        var stringQueue = Queue<String>()
        stringQueue.add("Ivan")
        stringQueue.add("Marina")
        print("stringQueue remove", stringQueue.remove() ?? "")
        
        // Opaque Type

        let opaqueIntStack = makeOpaque(container: intStack)
        if var stack = opaqueIntStack as? Stack<Int> {
            stack.add(3)
            intStack = stack
        }
        
        let opaqueStringQueue = makeOpaque(container: stringQueue)
        if let queue = opaqueStringQueue as? Queue<String> {
            queue.add("Sasha")
            stringQueue = queue
        }

        // Type Erasure

        let anyIntStack = AnyContainer(intStack)
        anyIntStack.add(4)
        anyIntStack.add(5)
        print("anyIntStack remove", anyIntStack.remove() ?? 0)
        print("anyIntStack remove", anyIntStack.remove() ?? 0)
        print("anyIntStack remove", anyIntStack.remove() ?? 0)
        print("anyIntStack remove", anyIntStack.remove() ?? 0)

        let anyStringQueue = AnyContainer(stringQueue)
        anyStringQueue.add("Igor")
        print("anyStringQueue remove", anyStringQueue.remove() ?? "")
        print("anyStringQueue remove", anyStringQueue.remove() ?? "")
        print("anyStringQueue remove", anyStringQueue.remove() ?? "")
        print("anyStringQueue remove", anyStringQueue.remove() ?? "")
    }
}

// MARK: - Preview

#Preview {
    ContainerView()
}
