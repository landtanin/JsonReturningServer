import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get("api", "consent") { req -> Consent in
        let consent = Consent(thirdPartyName: "Monzo app", onBehalfOf: "Monzo", consentType: "accounts")
        return consent
    }
    
}

final class Consent: Encodable {
    var thirdPartyName: String
    var onBehalfOf: String
    var consentType: String
    
    init(thirdPartyName: String,
         onBehalfOf: String,
         consentType: String) {
        self.thirdPartyName = thirdPartyName
        self.onBehalfOf = onBehalfOf
        self.consentType = consentType
    }
}

// a wrap around Swift Codable
extension Consent: Content {}
