import UIKit
import SnapKit

class TaskView: UIView {
    private var viewModel: TaskViewModel

    private var details: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#555555")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.text = "Neptun powstał w 1991 roku. Bla bla bla. Bla bla blaBla bla blaBla bla blaBla bla bla.Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla Bla bla blaBla bla bla".localized
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var monumentImageView = UIImageView()

    private var takePhotoButton: RoundedButton!
    private var completeTaskButton: RoundedButton!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        applyConstraints()
    }

    private func setupView() {
        setupTakePhotoButton()
        setupCompleteTaskButton()
        setupMonumentImageView()
        addSubview(details)
        addSubview(monumentImageView)
        addSubview(takePhotoButton)
        addSubview(completeTaskButton)
    }

    private func setupMonumentImageView() {
        monumentImageView.backgroundColor = .lightGray

    }

    private func setupTakePhotoButton() {
        takePhotoButton = RoundedButton(buttonTitle: "TAKE_PHOTO".localized, color: Colors.mainPurple.withAlphaComponent(0.7), titleColor: .white)
        takePhotoButton.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
    }

    @objc private func takePhotoButtonTapped() {
        viewModel.onTakePhotoButtonTapped?()
    }

    private func setupCompleteTaskButton() {
        completeTaskButton = RoundedButton(buttonTitle: "COMPLETE_TASK".localized, color: Colors.mainPurple.withAlphaComponent(0.7), titleColor: .white)
        completeTaskButton.addTarget(self, action: #selector(completeTaskButtonTapped), for: .touchUpInside)
    }

    @objc private func completeTaskButtonTapped() {
        viewModel.validate()
    }


    private func applyConstraints() {
        details.snp.makeConstraints {
            make in
            make.top.equalTo(self.snp_topMargin).inset(15.sketchHeight)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        monumentImageView.snp.makeConstraints({
            make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(300.sketchHeight)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(takePhotoButton.snp.top).inset(-25.sketchHeight)
        })

        takePhotoButton.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(completeTaskButton.snp.top).inset(-15.sketchHeight)
        }

        completeTaskButton.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(self.snp.bottomMargin).inset(15.sketchHeight)
        }
    }


    func updateMonumentImage(_ image: UIImage) {
        monumentImageView.image = image
        viewModel.photoAdded = true
    }
}