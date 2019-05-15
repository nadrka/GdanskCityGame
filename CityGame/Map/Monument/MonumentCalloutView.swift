import UIKit
import SnapKit

class MonumentCalloutView: UIView {

    var onTaskButtonTapped: (()->())? = nil
    var onDetailsButtonTapped: (()->())? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.text = "Kupa".localized
        return label
    }()

    private var details: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#555555")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.text = "Bardzo fajna kupa. Powstała w 2015 roku. asdsasa  asdasada asdasdad asdas asdasasa adasdaa asdas asdasad adasdaasa asdasdsa asdas".localized
        label.numberOfLines = 6
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var taskView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.textColor = Colors.lightPurple
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.text = "TASK".localized
        let imageView = UIImageView(image: UIImage(named: "task"))
        view.addSubview(imageView)
        view.addSubview(label)
        imageView.snp.makeConstraints{
            make in
            make.left.centerY.equalToSuperview()
            make.height.width.equalTo(28.sketchHeight)
        }
        label.snp.makeConstraints{
            make in
            make.right.centerY.equalToSuperview()
            make.left.equalTo(imageView.snp.right).inset(-5.sketchWidth)
        }
        return view
    }()

    private var detailsView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.textColor = Colors.lightPurple
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.text = "DETAILS".localized
        let imageView = UIImageView(image: UIImage(named: "details"))
        view.addSubview(imageView)
        view.addSubview(label)
        imageView.snp.makeConstraints{
            make in
            make.left.centerY.equalToSuperview()
            make.height.width.equalTo(27.sketchHeight)
        }
        label.snp.makeConstraints{
            make in
            make.right.centerY.equalToSuperview()
            make.left.equalTo(imageView.snp.right).inset(-5.sketchWidth)
        }
        return view
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
    }

    private func setupView() {
        addSubviews()
        addGestureForDetailsView()
        self.isUserInteractionEnabled = true
        addGestureForTaskView()
        applyConstraints()
    }


    private func addGestureForDetailsView() {
        detailsView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDetailsViewTapped))
        detailsView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func onDetailsViewTapped() {
        onDetailsButtonTapped?()
    }

    private func addGestureForTaskView() {
        taskView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTaskViewTapped))
        taskView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func onTaskViewTapped() {
        onTaskButtonTapped?()
    }

    private func addSubviews() {
        addSubview(name)
        addSubview(details)
        addSubview(taskView)
        addSubview(detailsView)
    }

    private func applyConstraints() {
        self.snp.makeConstraints {
            make in
            make.width.equalTo(220.sketchWidth)
        }
        name.snp.makeConstraints{
            make in
            make.top.equalToSuperview().inset(5.sketchHeight)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        details.snp.makeConstraints{
            make in
            make.top.equalTo(name.snp.bottom).inset(-5.sketchHeight)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.bottom.equalTo(taskView.snp.top).inset(-5.sketchHeight)
        }

        taskView.snp.makeConstraints{
            make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(5.sketchWidth)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalTo(30.sketchHeight)
        }

        detailsView.snp.makeConstraints{
            make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(5.sketchWidth)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(30.sketchHeight)
        }
    }
}