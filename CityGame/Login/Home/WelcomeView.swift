import UIKit
import SnapKit
import SkyFloatingLabelTextField

class WelcomeView: UIView {

    private var viewModel: WelcomeViewModel

    private var appLogo: UIImageView = {
        let image = UIImage(named: "town-logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.text = "CITY_GAME".localized
        return label
    }()

    private var signInButton: RoundedButton!
    private var signUpButton: RoundedButton!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    func setupLayout() {
        backgroundColor = Colors.mainPurple
    }

    private func setupView() {
        setupSignInButton()
        setupSignUpButton()
        addSubviews()
        applyConstraints()
    }

    private func setupSignInButton() {
        signInButton = RoundedButton(buttonTitle: "SIGN_IN".localized, color: .clear, frameColor: .white)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func signInButtonTapped() {
        viewModel.onSignInButtonTapped?()
    }

    private func setupSignUpButton() {
        signUpButton = RoundedButton(buttonTitle: "SIGN_UP".localized, color: .clear, frameColor: .white)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    @objc func signUpButtonTapped() {
        viewModel.onSignUpButtonTapped?()
    }

    private func addSubviews() {
        addSubview(appLogo)
        addSubview(appNameLabel)
        addSubview(signInButton)
        addSubview(signUpButton)
    }

    private func applyConstraints() {
        appLogo.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(appNameLabel.snp.top).offset(-25.sketchHeight)
            make.width.height.equalTo(120.sketchHeight)
        }
        appNameLabel.snp.makeConstraints {
            make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        signInButton.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).offset(-25.sketchHeight)
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
        }

        signUpButton.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(self.snp.bottomMargin).inset(15.sketchHeight)
        }
    }
}

