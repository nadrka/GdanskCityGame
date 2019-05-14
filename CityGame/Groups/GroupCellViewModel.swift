import Foundation

class GroupCellViewModel: FriendCellViewModel {
    private var cellUsage: FriendCellUsage
    private var group: Group
    private(set) var isSelected: Bool = false

    init(cellUsage: FriendCellUsage, group: Group) {
        self.cellUsage = cellUsage
        self.group = group
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
        case .friendsSharingLocation:
            return true
        default:
            return false
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

    var initials: String {
        let name = group.name
        let initials = InitialCreator.getInitials(from: name)
        return initials
    }

    var name: String {
        return group.name
    }

    var distance: String {
        return "1.7 km"
    }


    func toggleButton() {
        isSelected = !isSelected
    }


}