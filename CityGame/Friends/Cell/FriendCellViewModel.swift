import Foundation

enum FriendCellUsage {
    case friendsToShareLocation
    case friendsSharingLocation
    case friendsPicker
}

class FriendCellViewModel {
    private(set) var isSelected: Bool = false
    private(set) var friend: Friend
    private var cellUsage: FriendCellUsage

    init(cellUsage: FriendCellUsage, friend: Friend) {
        self.cellUsage = cellUsage
        self.friend = friend
    }

    var isDistanceLabelHidden: Bool {
        switch cellUsage {
        case .friendsToShareLocation:
            return true
        default:
            return false
        }
    }

    var isLocationSharingButtonHidden: Bool {
        switch cellUsage {
        case .friendsToShareLocation:
            return false
        default:
            return true
        }
    }

    func toggleButton() {
        isSelected = !isSelected
    }

    var initials: String {
        let name = friend.name
        let initials = InitialCreator.getInitials(from: name)
        return initials
    }

    var friendName: String {
        return friend.name
    }
}