import UIKit

// CollectionViewCellの設定
class CollectionViewCell: UICollectionViewCell {
    
    // cellNameLabelの生成、書式設定
    private let cellNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        label.font = .systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.darkGray
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    // cellTextViewの生成、書式設定
    private let cellTextLabel: UILabel = {
        let textView = UILabel()
        textView.frame = CGRect(x: 0, y: 30, width: 50, height: 30)
        textView.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 1))
        textView.textColor = UIColor.darkGray
        textView.backgroundColor = .white
        textView.textAlignment = .center
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // cellのsetup
    private func setup() {
        // cellにcellNameLabelとcellTextViewを追加
        addSubview(cellTextLabel)
        addSubview(cellNameLabel)
    }
    
    // cellNameLabelとcellTextViewのtextを設定
    func setUpContents(textName: String, text: String) {
        cellNameLabel.text = textName
        cellTextLabel.text = text
    }
}
