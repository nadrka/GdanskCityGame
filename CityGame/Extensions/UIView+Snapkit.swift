import SnapKit

extension UIView {
    func fillParent() {
        snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }

}