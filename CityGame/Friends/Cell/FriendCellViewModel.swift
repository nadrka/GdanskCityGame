import Foundation

enum FriendCellUsage {
    case friendsToShareLocation
    case friendsSharingLocation
}

class FriendCellViewModel {
    private(set) var isSelected: Bool = false
    private var cellUsage: FriendCellUsage

    init (cellUsage: FriendCellUsage) {
        self.cellUsage = cellUsage
    }

    var isDistanceLabelHidden: Bool {
        switch cellUsage {
        case .friendsToShareLocation:
            return true
        case .friendsSharingLocation:
            return false
        }
    }

    var isLocationSharingButtonHidden: Bool {
        switch cellUsage {
        case .friendsToShareLocation:
            return false
        case .friendsSharingLocation:
            return true
        }
    }

    func toggleButton() {
        isSelected = !isSelected
    }
}