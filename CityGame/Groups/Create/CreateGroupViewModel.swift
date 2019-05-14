import Foundation

class CreateGroupViewModel {
    var friends = [Friend(name: "Gustaw Ohler", phoneNumbers: []), Friend(name: "Łukasz Pawlicki", phoneNumbers: [])]
    var onCreateGroupButtonTapped: (() -> ())? = nil
    var cellViewModels: [DefaultFriendCellViewModel] = []

    func getNumberOfFriends() -> Int {
        return friends.count
    }

    func getFriend(for index: Int) -> Friend {
        return friends[index]
    }

    func onCreateGroupTapped() {
        //let chosenFriends = cellViewModels.filter
        print("Create group button tapped!")
        onCreateGroupButtonTapped?()
    }
}