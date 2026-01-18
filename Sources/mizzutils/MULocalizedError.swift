import Foundation

public enum MULocalizedError: LocalizedError {
    case withMessage(String)
    case wrapping(Error)

    public var errorDescription: String? {
        switch self {
        case let .withMessage(message):
            message
        case let .wrapping(error):
            error.localizedDescription
        }
    }
}
