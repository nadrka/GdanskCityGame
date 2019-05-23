import UIKit

class TaskViewController: UIViewController, UINavigationControllerDelegate {
    private var mainView: TaskView!
    private var viewModel: TaskViewModel
    fileprivate var imagePicker: UIImagePickerController!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
        bindViewModel()
        title = "Neptun"
    }


    private func setupView() {
        mainView = TaskView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }

    private func bindViewModel() {
        viewModel.onTakePhotoButtonTapped = {
            self.selectImageFrom()
        }
    }

    func selectImageFrom() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

}

extension TaskViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        mainView.updateMonumentImage(selectedImage)
        dismiss(animated: true, completion: nil)
    }

}
