import UIKit
import SnapKit

class FriendTableViewCell: UITableViewCell {
    static let reuseId = "FriendTableViewCellReuseId"
    private(set) var viewModel: FriendCellViewModel!
    private var initialCircleView: InitialCircleView!
    private var nameLabel: UILabel!
    private var distanceLabel: UILabel!
    private var markerImageView: UIImageView!
    private var pickerImageView: UIImageView!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    func setup(_ viewModel: FriendCellViewModel) {
        self.viewModel = viewModel
        setupView()
    }

    private func setupView() {
        setupInitialsCircleView()
        setupNameLabel()
        setupMarkerImageView()
        setupPickerImageView()
        setupDistanceLabel()
        applyConstraints()
    }


    private func setupInitialsCircleView() {
        initialCircleView = InitialCircleView(name: viewModel.name, color: Colors.lightPurple, height: 45)
        addSubview(initialCircleView)
    }

    private func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = viewModel.name
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.numberOfLines = 1
        addSubview(nameLabel)
    }

    private func setupMarkerImageView() {
        let filledMarkerImage = UIImage(named: "location-filled")
        let notFilledMarkerImage = UIImage(named: "location-not-filled")
        markerImageView = UIImageView(image: notFilledMarkerImage, highlightedImage: filledMarkerImage)
        markerImageView.isHidden = viewModel.isLocationSharingButtonHidden
        markerImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onMarkerTapped))
        markerImageView.addGestureRecognizer(tapGesture)
        addSubview(markerImageView)
    }

    @objc func onMarkerTapped() {
        viewModel.toggleButton()
        print("Marker button tapped")
        markerImageView.isHighlighted = viewModel.isSelected
    }

    private func setupPickerImageView() {
        let filledPickerImage = UIImage(named: "checked-checkbox")
        let notFilledPickerImage = UIImage(named: "unchecked-checkbox")
        pickerImageView = UIImageView(image: notFilledPickerImage, highlightedImage: filledPickerImage)
        pickerImageView.isHidden = viewModel.isPickerHidden
        pickerImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onPickerTapped))
        pickerImageView.addGestureRecognizer(tapGesture)
        addSubview(pickerImageView)
    }

    @objc func onPickerTapped() {
        viewModel.toggleButton()
        print("Picker button tapped")
        pickerImageView.isHighlighted = viewModel.isSelected
    }

    private func setupDistanceLabel() {
        distanceLabel = UILabel()
        distanceLabel.text = viewModel.distance
        distanceLabel.textColor = .black
        distanceLabel.font = UIFont.systemFont(ofSize: 16)
        distanceLabel.numberOfLines = 1
        distanceLabel.isHidden = viewModel.isDistanceLabelHidden
        addSubview(distanceLabel)
    }

    private func applyConstraints() {
        initialCircleView.snp.makeConstraints {
            make in
            make.left.equalToSuperview().inset(15.sketchWidth)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(45.sketchHeight)
        }

        nameLabel.snp.makeConstraints {
            make in
            make.left.equalTo(initialCircleView.snp.right).inset(-20.sketchWidth)
            make.right.equalToSuperview().inset(20.sketchWidth)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(25.sketchHeight)
        }

        markerImageView.snp.makeConstraints{
            make in
            make.right.equalToSuperview().inset(25.sketchWidth)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30.sketchHeight)
        }

        pickerImageView.snp.makeConstraints{
            make in
            make.right.equalToSuperview().inset(25.sketchWidth)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30.sketchHeight)
        }

        distanceLabel.snp.makeConstraints{
            make in
            make.right.equalToSuperview().inset(25.sketchWidth)
            make.centerY.equalToSuperview()
        }
    }

}