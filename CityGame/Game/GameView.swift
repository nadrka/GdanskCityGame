import UIKit
import SnapKit

class GameView: UIView, UICollectionViewDelegateFlowLayout {
    private var viewModel: GameViewModel
    private var games = ["first", "second", "third"]
    let collectionLayout: UICollectionViewFlowLayout!
    let collectionView: UICollectionView!
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 15.0, left: 30.0, bottom: 15.0, right: 30.0)

    private var chooseGameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightPurple
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 23)
        label.text = "CHOOSE_CITY_GAME".localized
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    var onGameChosen: (() -> ())? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        self.collectionLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        applyConstraints()
    }

    private func setupView() {
        addSubview(collectionView)
        addSubview(chooseGameLabel)
        addCollectionViewFlowLayout()
        addCollectionView()
    }

    private func addCollectionViewFlowLayout() {
        collectionLayout.scrollDirection = .vertical
        collectionLayout.minimumLineSpacing = 30
        collectionLayout.minimumInteritemSpacing = 10
    }

    private func addCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reusableID)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
    }


    private func applyConstraints() {

        chooseGameLabel.snp.makeConstraints{
            make in
            make.top.equalTo(self.snp_topMargin).inset(15.sketchHeight)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }

        collectionView.snp.makeConstraints{
            make in
            make.top.equalTo(chooseGameLabel.snp.bottom).inset(-10)
            make.bottom.left.right.equalToSuperview()
        }
    }
}


extension GameView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GameCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.reusableID, for: indexPath) as! GameCollectionViewCell
        let row = indexPath.row
        let game = games[row]
        cell.updateCell(gameName: game, gameNumber: row)
        cell.layer.cornerRadius = 8
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem + 5)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Game cell tapped!")
        viewModel.onGameChosen?()
    }
}