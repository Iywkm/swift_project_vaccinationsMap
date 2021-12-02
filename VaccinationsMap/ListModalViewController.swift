import UIKit

// ListModalVCDelegateのprotocolを宣言
protocol ListModalViewControllerDelegate :AnyObject {
    func changeRegion(withAddress: String)
}

let sectionNameList = addresses.map({el in return [el.name]})
let vaccinationFacilityList = addresses.map({el in return el.vaccination.getData()})

class ListModalViewController: UIViewController {
    
    weak var delegate: ListModalViewControllerDelegate? = nil
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIScrollViewを生成、書式設定
        scrollView = UIScrollView(frame: CGRect(x:0, y:10, width: self.view.frame.size.width, height: self.view.frame.size.height-50))
        scrollView.isPagingEnabled = true
        
        // UICollectionViewを生成、書式設定
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        // CVCell classを"Cell"という名前でCVに登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        // CVHeader classを"Header"という名前でCVのheaderとして登録
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // CVをscrollViewに追加
        scrollView.addSubview(collectionView)
        // scrollViewをListModalVCに追加
        self.view.addSubview(scrollView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// UICVDelegateを追加
extension ListModalViewController: UICollectionViewDelegate {
    // セル選択時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.changeRegion(withAddress: addresses[indexPath.section].address)
    }
}

//　UICVDataSourceを追加
extension ListModalViewController: UICollectionViewDataSource {
    // 各section内におけるcellの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vaccinationNameList[0].count
    }
    
    // sectionの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return addresses.count
    }
    
    // cellの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cellを生成
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath as IndexPath) as! CollectionViewCell
        let nameLabel = vaccinationNameList[0][indexPath.item]
        let textLabel = vaccinationFacilityList[indexPath.section][indexPath.item]
        // cellのnameLabelとtextLanelにtextを追加
        cell.setUpContents(textName: nameLabel, text: textLabel)
        return cell
    }
    
    // headerの設定
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // headerを生成
        let collectionViewHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! CollectionViewHeader
        let headerText = sectionNameList[indexPath.section][indexPath.item]
        collectionViewHeader.backgroundColor = .white
        // headerのtitleLabelにtextを追加
        collectionViewHeader.setUpContents(titleText: headerText)
        return collectionViewHeader
    }
}

extension ListModalViewController:  UICollectionViewDelegateFlowLayout {
    // cellのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 60)
    }
    
    // cellの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // headerのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height:50)
    }
}
