import UIKit
import SnapKit
import SkyFloatingLabelTextField

class RegisterView: UIView {

    private var viewModel: RegisterViewModel

    private var emailTextField: SkyFloatingLabelTextField!
    private var passwordTextField: SkyFloatingLabelTextField!
    private var repeatPasswordTextField: SkyFloatingLabelTextField!
    private var nameTextField: SkyFloatingLabelTextField!
    private var signUpButton: RoundedButton!

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
        backgroundColor = Colors.mainPurple
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
        emailTextField = SkyFloatingLabelTextField()
        emailTextField.placeholder = "EMAIL".localized
        emailTextField.title = "EMAIL".localized
        emailTextField.setColor(color: .white)
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
    }

    private func setupPasswordTextField() {
        passwordTextField = SkyFloatingLabelTextField()
        passwordTextField.placeholder = "PASSWORD".localized
        passwordTextField.title = "PASSWORD".localized
        passwordTextField.setColor(color: .white)
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
    }

    private func setupRepeatPasswordTextField() {
        repeatPasswordTextField = SkyFloatingLabelTextField()
        repeatPasswordTextField.placeholder = "REPEAT_PASSWORD".localized
        repeatPasswordTextField.title = "REPEAT_PASSWORD".localized
        repeatPasswordTextField.setColor(color: .white)
        repeatPasswordTextField.autocorrectionType = .no
        repeatPasswordTextField.autocapitalizationType = .none
        repeatPasswordTextField.isSecureTextEntry = true
    }


    private func setupNameTextField() {
        nameTextField = SkyFloatingLabelTextField()
        nameTextField.placeholder = "NAME".localized
        nameTextField.title = "NAME".localized
        nameTextField.setColor(color: .white)
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
    }

    private func setupSignInButton() {
        signUpButton = RoundedButton(buttonTitle: "SIGN_UP".localized, color: UIColor.white.withAlphaComponent(0.7), titleColor: .purple)
        signUpButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func signInButtonTapped() {
        let login = emailTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repeatedPassword = repeatPasswordTextField.text ?? ""
        let registrationDetails = UserRegistrationDetails(email: login, name: name, password: password, repeatedPassword: repeatedPassword)
        viewModel.validate(registrationDetails)
    }

    private func addSubviews() {
        addSubview(emailTextField)
        addSubview(nameTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(signUpButton)
    }

    private func applyConstraints() {
        emailTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_topMargin).inset(50.sketchHeight)
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        nameTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(emailTextField.snp.bottom).inset(-20.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        passwordTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(nameTextField.snp.bottom).inset(-20.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        repeatPasswordTextField.snp.makeConstraints{
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(passwordTextField.snp.bottom).inset(-20.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
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

