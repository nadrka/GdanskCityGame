import UIKit
import SnapKit
import SkyFloatingLabelTextField

class LoginView: UIView {
    private var viewModel: LoginViewModel

    private var emailTextField: SkyFloatingLabelTextField!
    private var passwordTextField: SkyFloatingLabelTextField!
    private var loginButton: RoundedButton!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .purple
        setupView()
    }

    private func setupView() {
        setupLoginTextField()
        setupPasswordTextField()
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

    private func setupSignInButton() {
        loginButton = RoundedButton(buttonTitle: "SIGN_IN".localized, color: UIColor.white.withAlphaComponent(0.7), titleColor: .purple)
        loginButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func signInButtonTapped() {
        let login = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        viewModel.validate(email: login, password: password)
    }

    private func addSubviews() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }

    private func applyConstraints() {
        emailTextField.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_topMargin).inset(70.sketchHeight)
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        passwordTextField.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.top.equalTo(emailTextField.snp.bottom).inset(-20.sketchHeight)
            make.width.equalToSuperview().inset(40.sketchWidth)
        }

        loginButton.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.sketchHeight)
            make.width.equalToSuperview().inset(50.sketchWidth)
            make.bottom.equalTo(self.snp.bottomMargin).inset(15.sketchHeight)
        }
    }
}