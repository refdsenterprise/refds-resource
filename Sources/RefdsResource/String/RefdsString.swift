import Foundation

public protocol RefdsStringProtocol {
    var key: String { get }
    var rawValue: String { get }
}

public enum RefdsString: RefdsStringProtocol {
    case lockScreen(LockScreen)
    case storage(Storage)
    
    public var key: String { "" }
    public var rawValue: String {
        switch self {
        case .lockScreen(let lockScreen): return lockScreen.rawValue
        case .storage(let storage): return storage.rawValue
        }
    }
}

public extension String {
    static func refdsString(_ string: RefdsString) -> Self { string.rawValue }
}

// MARK: - Lock Screen
public extension RefdsString {
    enum LockScreen: RefdsStringProtocol {
        case title
        case description
        case buttonTitle
        case requestAuthReason
        case alertAuthError
        
        public var key: String {
            switch self {
            case .title: return "lockScreen.title"
            case .description: return "lockScreen.description"
            case .buttonTitle: return "lockScreen.buttonTitle"
            case .requestAuthReason: return "lockScreen.requestAuthReason"
            case .alertAuthError: return "lockScreen.alertAuthError"
            }
        }
        
        public var rawValue: String {
            NSLocalizedString(key, tableName: "Localizable", bundle: .module, comment: "")
        }
    }
}

// MARK: - Storage
public extension RefdsString {
    enum Storage: String, RefdsStringProtocol {
        case auth = "refds.storage.allow.auth"
        case customAppIcon = "refds.storage.customAppIcon"
        case onboarding = "refds.storage.onboarding"
        
        public var key: String { "" }
    }
}
