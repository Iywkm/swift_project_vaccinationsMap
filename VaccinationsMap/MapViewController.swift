import UIKit
import MapKit
import CoreLocation
import FloatingPanel

let vaccinationNameList = [["Rota", "Hib", "PP", "HBV", "DPT_IPV", "MR", "VZV", "JE", "DT", "HPV", "flu", "BCG"]]

// 予防接種struct
struct Vaccination {
    var Rota: String
    var Hib: String
    var PP: String
    var HBV: String
    var DPT_IPV: String
    var MR: String
    var VZV: String
    var JE: String
    var DT: String
    var HPV: String
    var flu: String
    var BCG: String
    
    func getData() -> Array<String>{
        return [self.Rota, self.Hib, self.PP, self.HBV, self.DPT_IPV, self.MR, self.VZV, self.JE, self.DT, self.HPV, self.flu, self.BCG]
    }
}

// 病院Address struct
struct Address {
    var name: String
    var phone: String
    var area: String
    var address: String
    var vaccination:Vaccination
}

// address collection
var addresses = [
    Address(name: "磯部クリニック", phone: "0545383910", area: "須津", address: "富士市川尻193", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "○", flu: "A", BCG: "")),
    Address(name: "遠藤クリニック", phone: "0545340048", area: "須津", address: "富士市神谷527-1", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "○", flu: "A", BCG: "")),
    Address(name: "高木内科循環器医院", phone: "0545342755", area:"須津", address: "富士市中里934-40", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "○", VZV: "", JE: "2", DT: "○", HPV: "", flu: "C", BCG: "")),
    Address(name: "吉見整形外科", phone: "0545391139", area: "須津", address: "富士市増川444-12", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "D", BCG: "")),
    Address(name: "小林医院", phone: "0545330660", area: "元吉原", address: "富士市今井1-1-21", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "D", BCG: "")),
    Address(name: "幸治小児科医院", phone: "0545713643", area: "鷹岡", address: "富士市鷹岡本町4", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "", flu: "A", BCG: "")),
    Address(name: "戸田整形外科", phone: "0545732200", area: "鷹岡", address: "富士市入山瀬710-1", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "C",  BCG: "")),
    Address(name: "なかじま眼科", phone: "0545720011", area: "鷹岡", address: "富士市入山瀬955-5", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "D", BCG: "")),
    Address(name: "平野医院", phone: "0545716611", area: "鷹岡", address: "富士市厚原64", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "C", BCG: "")),
    Address(name: "キタザトクリニック", phone: "0545725000", area: "丘", address: "富士市厚原1941-3", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "C", BCG: "")),
    Address(name: "せきクリニック", phone: "0545732332", area: "丘", address: "富士市伝法656-1", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "2", DT: "○", HPV: "○", flu: "C", BCG: "")),
    Address(name: "つちや耳鼻咽喉科医院", phone: "0545308003", area: "丘", address: "富士市厚原589-3", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "B", BCG: "")),
    Address(name: "望月医院", phone: "0545713392", area: "丘", address: "富士市厚原755-4", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "", flu: "A", BCG: "")),
    Address(name: "山崎医院", phone: "0545713315", area: "丘", address: "富士市厚原675-3", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "○", flu: "C", BCG: "")),
    Address(name: "フィランセ", phone: "0545648990", area: "富士駅北", address: "富士市本市場432-1", vaccination: Vaccination(Rota: "", Hib: "", PP: "", HBV: "", DPT_IPV: "", MR: "", VZV: "", JE: "", DT: "", HPV: "", flu: "", BCG: "○"))
]

// MapVC
class MapViewController: UIViewController {
    
    // addressesのpinを追加する関数
    func addPin() {
        for i in 0..<addresses.count {
            CLGeocoder().geocodeAddressString(addresses[i].address) { placemarks, error in
                if let coordinate = placemarks?.first?.location?.coordinate {
                    let pin = MKPointAnnotation()
                    pin.title = addresses[i].name
                    pin.coordinate = coordinate
                    self.mapView.addAnnotation(pin)
                }
            }
        }
    }
    
    // fpcの型を宣言
    var fpc: FloatingPanelController!
    
    // locationManagerの型を宣言
    var locationManager: CLLocationManager!
    
    let ListModalVC = ListModalViewController()
    
    // mapを生成
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        // 自動サイズ補正をoff
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // viewDidLoadをoverride
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // mapViewの配置を指定
        view.addSubview(mapView)
        [mapView.topAnchor.constraint(equalTo: view.topAnchor),
         mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),]
            .forEach{ $0.isActive = true }
        
        // 現在位置取得を可否をrequest
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // pinをmap上に作成
        addPin()
        
        fpc = FloatingPanelController()
        fpc.delegate = self
        fpc.set(contentViewController: ListModalVC)
        fpc.addPanel(toParent: self)
        //        fpc.track(scrollView: ListModalVC.scrollView)
        fpc.surfaceView.cornerRadius = 15.0
        
        ListModalVC.delegate = self
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    // pinをタップしたときのevent
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            let coordinate = annotation.coordinate
            let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.region = region
            let DetailVC = DetailViewController(sectionName: annotation.title!!)
            fpc.set(contentViewController: DetailVC)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        fpc.set(contentViewController: ListModalVC)
    }
    
    
}

// CLLocationManagerDelegateを追加
extension MapViewController: CLLocationManagerDelegate {
    
    // defaultの表示領域を宣言し、現在地取得の許可を確認
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // defaultは富士市役所を拡大して表示する
        let center = CLLocationCoordinate2D(latitude: 35.161298, longitude: 138.676289)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.region = region
        
        switch status {
            // 許可されていない場合
        case.notDetermined:
            debugPrint("notDetermined")
            // 許可を求める
            manager.requestWhenInUseAuthorization()
            // 拒否されている場合
        case.restricted, .denied:
            debugPrint("restricted or denied")
            // 何もしない
            break
            // 許可されている場合
        case.authorizedAlways, .authorizedWhenInUse:
            debugPrint("authorised")
            // 現在地を取得する
            manager.startUpdatingLocation()
            break
        default:
            break
        }
    }
    // locationsが変更された場合の表示領域変更処理
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            // 現在地を拡大して表示する
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.region = region
            mapView.userTrackingMode = .follow
        }
    }
}

//　FloatingPanelControllerを追加
extension MapViewController: FloatingPanelControllerDelegate {
    
    // floatingPanelのcustomLayoutを設定する
    private func flaotingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return CustomFloatingPanelLayout()
    }
}

// floatingPanelのLayout class
class CustomFloatingPanelLayout: FloatingPanelLayout {
    
    // 初期位置の設定
    var initialPosition: FloatingPanelPosition {
        return .tip
    }
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .full:
            return 16.0
        case .half:
            return 216.0
        case .tip:
            return 44.0
        default: return nil
        }
    }
    
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.full, .half, .tip]
    }
}

// ListModalVCDelegateを追加
extension MapViewController: ListModalViewControllerDelegate {
    // 選択したtableの病院のpinを地図の中心になるように表示を変更
    func changeRegion(withAddress: String) {
        CLGeocoder().geocodeAddressString(withAddress) { placemarks, error in
            if let coordinate = placemarks?.first?.location?.coordinate {
                let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.region = region
            }
        }
    }
}
