import UIKit

class DetailViewController: UIViewController {
    
    let sectionName: String
    let vaccinationFacility: [[String]]
    let tableLabel = ["住所", "電話番号"]
    let tableText: [String]
    
    init(sectionName: String) {
        self.sectionName = sectionName
        self.vaccinationFacility = [ vaccinationFacilityList[ sectionNameList.firstIndex(of: [sectionName])!]]
        self.tableText = [addresses[sectionNameList.firstIndex(of: [sectionName])!].address, addresses[sectionNameList.firstIndex(of: [sectionName])!].phone]
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UICollectionViewを生成、書式設定
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        // CVCell classを"Cell"という名前でCVに登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        // CVHeader classを"Header"という名前でCVのheaderとして登録
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let tableVeiw = UITableView(frame: CGRect(x: 0, y: 180, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tableVeiw.backgroundColor = .white
        tableVeiw.allowsSelection = false
        tableVeiw.dataSource = self
        
        // CVをDetailVCに追加
        self.view.addSubview(collectionView)
        collectionView.addSubview(tableVeiw)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//　UICVDataSourceを追加
extension DetailViewController: UICollectionViewDataSource {
    // 各section内におけるcellの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vaccinationNameList[section].count
    }
    
    // sectionの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // cellの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cellを生成
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath as IndexPath) as! CollectionViewCell
        let nameLabel = vaccinationNameList[indexPath.section][indexPath.item]
        let textLabel = vaccinationFacility[indexPath.section][indexPath.item]
        // cellのnameLabelとtextLanelにtextを追加
        cell.setUpContents(textName: nameLabel, text: textLabel)
        return cell
    }
    
    // headerの設定
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // headerを生成
        let collectionViewHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! CollectionViewHeader
        let headerText = sectionName
        // headerのtitleLabelにtextを追加
        collectionViewHeader.setUpContents(titleText: headerText)
        return collectionViewHeader
    }
    
}

extension DetailViewController:  UICollectionViewDelegateFlowLayout {
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

extension DetailViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 2
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.text = tableLabel[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        cell.textLabel?.textColor = UIColor.darkGray
        cell.detailTextLabel?.text = tableText[indexPath.row]
        cell.detailTextLabel?.font = .systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        cell.detailTextLabel?.textColor = UIColor.darkGray
        cell.backgroundColor = .white
        
        return cell
    }
}
