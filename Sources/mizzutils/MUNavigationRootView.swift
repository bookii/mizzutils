import SwiftUI

public struct MUNavigationRootView<Content: View>: View {
    @State private var path = NavigationPath()
    private let content: (Binding<NavigationPath>) -> Content

    public init(@ViewBuilder content: @escaping (Binding<NavigationPath>) -> Content) {
        self.content = content
    }

    public var body: some View {
        NavigationStack(path: $path) {
            content($path)
        }
    }
}
