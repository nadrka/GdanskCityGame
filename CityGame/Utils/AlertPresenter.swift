import UIKit

protocol AlertPresenter {
    func presentConfirmAlert(title: String, message: String, okCompletion: @escaping (() -> ()), cancelCompletion: @escaping (() -> ()))
    func presentInfoAlert(title: String, message: String, completion: @escaping (() -> ()))
}

class DefaultAlertPresenter: AlertPresenter {

    private weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func presentConfirmAlert(title: String, message: String, okCompletion: @escaping (() -> ()), cancelCompletion: @escaping (() -> ())) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "YES".localized, style: .default) { action in
            okCompletion()
        }
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "NO".localized, style: .cancel) { action in
            cancelCompletion()
        }
        alert.addAction(cancelAction)

        rootViewController?.present(alert, animated: true)
    }

    func presentInfoAlert(title: String, message: String, completion: @escaping (() -> ())) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            completion()
        }
        alert.addAction(okAction)
        rootViewController?.present(alert, animated: true)
    }


}