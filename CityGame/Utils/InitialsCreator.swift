import Foundation

class InitialCreator {

    static func getInitials(from name: String) -> String {
        if name == "" || name.trimmingCharacters(in: .whitespacesAndNewlines).count <= 0 {
            return ""
        }
        let initials = name.components(separatedBy: " ").reduce("") {
            ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)"
        }
        return initials
    }
}