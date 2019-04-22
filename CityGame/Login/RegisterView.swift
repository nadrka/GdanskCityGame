import UIKit
import SnapKit
import SkyFloatingLabelTextField

class RegisterView: UIView {

    private var viewModel: RegisterViewModel

    private var loginTextField: SkyFloatingLabelTextField!
    private var passwordTextField: SkyFloatingLabelTextField!
    private var repeatPasswordTextField: SkyFloatingLabelTextField!
    private var nameTextField: SkyFloatingLabelTextField!
    private var signInButton: RoundedButton!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupLayout()
        setupView()
    }

    private func setupLayout() {
        backgroundColor = .white
    }

    private func setupView() {
        setupLoginTextField()
        setupPasswordTextField()
        setupRepeatPasswordTextField()
        setupNameTextField()
        setupSignInButton()
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

    private func setupRepeatPasswordTextField() {
        repeatPasswordTextField = SkyFloatingLabelTextField()
        repeatPasswordTextField.placeholder = "REPEAT_PASSWORD".localized
        repeatPasswordTextField.title = "REPEAT_PASSWORD".localized
        repeatPasswordTextField.autocorrectionType = .no
        repeatPasswordTextField.autocapitalizationType = .none
        repeatPasswordTextField.isSecureTextEntry = true
    }

    private func setupNameTextField() {
        nameTextField = SkyFloatingLabelTextField()
        nameTextField.placeholder = "NAME".localized
        nameTextField.title = "ENTER_YOUR_NAME".localized
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
    }

    private func setupSignInButton() {
        signInButton = RoundedButton(buttonTitle: "SIGN_IN".localized, color: Colors.mainBlue)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func signInButtonTapped() {
        let login = loginTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repeatedPassword = repeatPasswordTextField.text ?? ""
        let registrationDetails = UserRegistrationDetails(login: login, name: name, password: password, repeatedPassword: repeatedPassword)
        viewModel.validate(registrationDetails)
    }

    private func addSubviews() {
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(nameTextField)
        addSubview(signInButton)
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

        repeatPasswordTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(passwordTextField.snp.bottom).inset(-25.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        nameTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(repeatPasswordTextField.snp.bottom).inset(-25.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        signInButton.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(self.snp.bottomMargin).inset(15.sketchHeight)
        }
    }
}

