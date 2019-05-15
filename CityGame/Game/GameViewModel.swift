import Foundation

class GameViewModel {
    var games = ["First Game", "Second Game", "Third Game"]
    var onGameChosen: (() -> ())? = nil

    func fetchGames() {
        //todo: fetch games from Firebase
    }
}