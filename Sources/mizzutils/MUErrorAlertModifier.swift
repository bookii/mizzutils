import Foundation
import SwiftUI

public struct MUErrorAlertModifier: ViewModifier {
    private let onDismiss: (() -> Void)?
    @Binding private var error: Error?
    private var localizedError: MULocalizedError? {
        if let localizedError = error as? MULocalizedError {
            localizedError
        } else if let error {
            MULocalizedError.wrapping(error)
        } else {
            nil
        }
    }

    public init(_ error: Binding<Error?>, onDismiss: (() -> Void)? = nil) {
        _error = error
        self.onDismiss = onDismiss
    }

    public func body(content: Content) -> some View {
        content
            .alert(
                isPresented: Binding(
                    get: { localizedError != nil },
                    set: { isPresented in
                        if !isPresented {
                            error = nil
                        }
                    },
                ),
                error: localizedError,
            ) {
                Button("OK") {
                    onDismiss?()
                }
            }
    }
}

public extension View {
    func errorAlert(_ error: Binding<Error?>, onDismiss: (() -> Void)? = nil) -> some View {
        modifier(MUErrorAlertModifier(error, onDismiss: onDismiss))
    }
}

#if DEBUG
    #Preview {
        @Previewable @State var error: Error?
        Button("Present Alert") {
            error = MULocalizedError.withMessage("Sample Error")
        }
        .foregroundStyle(Color.teal)
        .errorAlert($error)
    }
#endif
