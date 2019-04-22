import UIKit
import SnapKit
import SkyFloatingLabelTextField

class WelcomeView: UIView {

    private var viewModel: WelcomeViewModel

    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "CITY_GAME".localized
        return label
    }()

    private var loginTextField: SkyFloatingLabelTextField!
    private var passwordTextField: SkyFloatingLabelTextField!
    private var signInButton: RoundedButton!
    private var signUpButton: RoundedButton!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupLayout()
        setupGestureRecognizer()
        setupView()
    }

    private func setupLayout() {
        backgroundColor = .white
    }

    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewTapped))
        addGestureRecognizer(tapGesture)
    }

    @objc private func onViewTapped() {
        endEditing(true)
    }

    private func setupView() {
        setupLoginTextField()
        setupPasswordTextField()
        setupSignInButton()
        setupSignUpButton()
        addSubviews()
        applyConstraints()
    }

    private func setupLoginTextField() {
        loginTextField = SkyFloatingLabelTextField()
        loginTextField.placeholder = "LOGIN".localized
        loginTextField.title = "YOUR_LOGIN".localized
        loginTextField.autocorrectionType = .no
        loginTextField.autocapitalizationType = .none
    }

    private func setupPasswordTextField() {
        passwordTextField = SkyFloatingLabelTextField()
        passwordTextField.placeholder = "PASSWORD".localized
        passwordTextField.title = "YOUR_PASSWORD".localized
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
    }

    private func setupSignInButton() {
        signInButton = RoundedButton(buttonTitle: "SIGN_IN".localized, color: Colors.mainBlue)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func signInButtonTapped() {
        viewModel.validate()
    }

    private func setupSignUpButton() {
        signUpButton = RoundedButton(buttonTitle: "SIGN_UP".localized, color: Colors.mainBlue)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    @objc func signUpButtonTapped() {
        viewModel.onSignUpButtonTapped?()
    }

    private func addSubviews() {
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(signUpButton)
    }

    private func applyConstraints() {

        loginTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(-100.sketchHeight)
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        passwordTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(loginTextField.snp.bottom).inset(-25.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        signInButton.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).inset(-35.sketchHeight)
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
        }

        signUpButton.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(self.snp.bottomMargin).inset(15.sketchHeight)
        }
    }
}

