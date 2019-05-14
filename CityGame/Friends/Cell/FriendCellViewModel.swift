import Foundation

enum FriendCellUsage {
    case friendsToShareLocation
    case friendsSharingLocation
    case friendsPicker
}

protocol FriendCellViewModel {
    var isDistanceLabelHidden: Bool { get }
    var isLocationSharingButtonHidden: Bool { get }
    var isSelected: Bool { get }
    var isPickerHidden: Bool { get }
    var initials: String { get }
    var name: String { get }
    var distance: String { get }
    func toggleButton()
}

class DefaultFriendCellViewModel: FriendCellViewModel {
    private(set) var isSelected: Bool = false
    private(set) var friend: Friend
    private var cellUsage: FriendCellUsage

    init(cellUsage: FriendCellUsage, friend: Friend) {
        self.cellUsage = cellUsage
        self.friend = friend
    }

    var isDistanceLabelHidden: Bool {
        switch cellUsage {
        case .friendsSharingLocation:
            return false
        default:
            return true

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

    var isPickerHidden: Bool {
        switch cellUsage {
        case .friendsPicker:
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

    var name: String {
        return friend.name
    }

    var distance: String {
        return "1.7 km"
    }
}