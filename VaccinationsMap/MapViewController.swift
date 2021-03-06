import UIKit
import MapKit
import CoreLocation
import FloatingPanel
import SwiftUI

let vaccinationNameList = [["ロタ", "ヒブ", "小児肺炎", "B型肝炎", "4種混合", "MR", "水痘", "日本脳炎", "2種混合", "子宮頸がん", "インフル", "BCG"]]

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
// 営業日struct
struct WorkingDay {
    var amMon: String
    var pmMon: String
    var amTue: String
    var pmTue: String
    var amWed: String
    var pmWed: String
    var amThi: String
    var pmThi: String
    var amFri: String
    var pmFri: String
    var amSat: String
    var pmSat: String
    var amSun: String
    var pmSun: String
    
    func getData() -> Array<Array<String>>{
        return [["", "月", "火", "水", "木", "金", "土", "日"], ["AM", self.amMon, self.amTue, self.amWed, self.amThi, self.amFri, self.amSat, self.amSun], ["PM", self.pmMon, self.pmTue, self.pmWed, self.pmThi, self.pmFri, self.pmSat, self.pmSun]]
    }
}


// 病院Address struct
struct Address {
    var name: String
    var phone: String
    var area: String
    var address: String
    var url: String
    var vaccination:Vaccination
    var workday: WorkingDay
}

// address collection
var addresses = [
    Address(name: "磯部クリニック", phone: "0545383910", area: "須津", address: "富士市川尻193", url: "http://www.fuji.shizuoka.med.or.jp/iryou/?p=563", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "○", flu: "A", BCG: "✖︎"), workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "遠藤クリニック", phone: "0545340048", area: "須津", address: "富士市神谷527-1", url: "https://www.endo-cl.jp/", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "○", flu: "A", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "高木内科循環器医院", phone: "0545342755", area:"須津", address: "富士市中里934-40", url: "https://website2.infomity.net/8120365/", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "○", VZV: "✖︎", JE: "2", DT: "○", HPV: "✖︎", flu: "C", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "吉見整形外科", phone: "0545391139", area: "須津", address: "富士市増川444-12", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=174", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "D", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "小林医院", phone: "0545330660", area: "元吉原", address: "富士市今井1-1-21", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=615", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "D", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "幸治小児科医院", phone: "0545713643", area: "鷹岡", address: "富士市鷹岡本町4", url: "https://koji-clinic.com/", vaccination: Vaccination(Rota: "○", Hib: "○", PP: "○", HBV: "○", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "✖︎", flu: "A", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "○", amSun: "", pmSun: "")),
    Address(name: "戸田整形外科", phone: "0545732200", area: "鷹岡", address: "富士市入山瀬710-1", url: "http://website2.infomity.net/8120000196/medical/", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "C",  BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "なかじま眼科", phone: "0545720011", area: "鷹岡", address: "富士市入山瀬955-5", url: "https://nakajima-ganka.jp/", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "D", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "平野医院", phone: "0545716611", area: "鷹岡", address: "富士市厚原64", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=710", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "C", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "キタザトクリニック", phone: "0545725000", area: "丘", address: "富士市厚原1941-3", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=603", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "C", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "せきクリニック", phone: "0545732332", area: "丘", address: "富士市伝法656-1", url: "http://www.fuji.shizuoka.med.or.jp/iryou/?p=649", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "2", DT: "○", HPV: "○", flu: "C", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "つちや耳鼻咽喉科医院", phone: "0545308003", area: "丘", address: "富士市厚原589-3", url: "https://www.tsuchiyaent.com/", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "B", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "望月医院", phone: "0545713392", area: "丘", address: "富士市厚原755-4", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=270", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "○", MR: "○", VZV: "○", JE: "○", DT: "○", HPV: "✖︎", flu: "A", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "山崎医院", phone: "0545713315", area: "丘", address: "富士市厚原675-3", url: "https://www.fuji.shizuoka.med.or.jp/iryou/?p=215", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "○", flu: "C", BCG: "✖︎"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "", amFri: "○", pmFri: "○", amSat: "○", pmSat: "", amSun: "", pmSun: "")),
    Address(name: "フィランセ", phone: "0545648990", area: "富士駅北", address: "富士市本市場432-1", url: "https://www.city.fuji.shizuoka.jp/machi/c1005/fmervo000000b39w.html", vaccination: Vaccination(Rota: "✖︎", Hib: "✖︎", PP: "✖︎", HBV: "✖︎", DPT_IPV: "✖︎", MR: "✖︎", VZV: "✖︎", JE: "✖︎", DT: "✖︎", HPV: "✖︎", flu: "✖︎", BCG: "○"),workday: WorkingDay(amMon: "○", pmMon: "○", amTue: "○", pmTue: "○", amWed: "○", pmWed: "○", amThi: "○", pmThi: "○", amFri: "○", pmFri: "○", amSat: "○", pmSat: "○", amSun: "○", pmSun: "○"))
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
    
    
    @objc func fujibuttonTapped(_ sender: Any) {
        let url = URL(string: "https://www.city.fuji.shizuoka.jp/kenkou/c0107/fmervo0000001149.html")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
    }
    
    @objc func zoomInTapped(_ sender: Any) {
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta / 2, longitudeDelta: mapView.region.span.longitudeDelta / 2)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        self.mapView.region = region
    }
    
    @objc func zoomOutTapped(_ sender: Any) {
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta * 2, longitudeDelta: mapView.region.span.longitudeDelta * 2)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        self.mapView.region = region
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
        map.mapType = .standard
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
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // pinをmap上に作成
        addPin()
        
        fpc = FloatingPanelController()
        fpc.delegate = self
        fpc.set(contentViewController: ListModalVC)
        fpc.addPanel(toParent: self)
        //        fpc.track(scrollView: ListModalVC.scrollView)
        fpc.surfaceView.cornerRadius = 15.0
        fpc.surfaceView.backgroundColor = .white
        
        ListModalVC.delegate = self
        
        let fujibutton = UIButton()
        fujibutton.frame = CGRect(x: 10, y: 50, width: 30, height: 30)
        fujibutton.setImage(UIImage(named: "fuji"), for: .normal)
        fujibutton.addTarget(self, action: #selector(MapViewController.fujibuttonTapped(_:)), for: .touchUpInside)
        
        let zoomIn = UIButton()
        zoomIn.frame = CGRect(x: 10, y: 100, width: 30, height: 30)
        zoomIn.setTitle("➕", for: .normal)
        zoomIn.backgroundColor = .lightGray
        zoomIn.layer.cornerRadius = 15
        zoomIn.addTarget(self, action: #selector(MapViewController.zoomInTapped(_:)), for: .touchUpInside)
        
        let zoomOut = UIButton()
        zoomOut.frame = CGRect(x: 10, y: 140, width: 30, height: 30)
        zoomOut.setTitle("➖", for: .normal)
        zoomOut.backgroundColor = .lightGray
        zoomOut.layer.cornerRadius = 15
        zoomOut.addTarget(self, action: #selector(MapViewController.zoomOutTapped(_:)), for: .touchUpInside)
        
        mapView.addSubview(fujibutton)
        mapView.addSubview(zoomIn)
        mapView.addSubview(zoomOut)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pinView = MKPinAnnotationView()
        pinView.annotation = annotation
        if annotation.title != "My Location" {
            pinView.image = UIImage(named: "marker")
            pinView.canShowCallout = true
            return pinView
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setTitle("経路", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        for view in views {
            view.rightCalloutAccessoryView = button
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.mapView.removeOverlays(mapView.overlays)
        let myLocation = mapView.userLocation.coordinate
        let destination = view.annotation?.coordinate
        let myPlacemark = MKPlacemark(coordinate: myLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destination!)
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: myPlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResponse = response else {
                if let error = error {
                    debugPrint("calculation error of directions")
                }
                return
            }
            // ルートを追加
            let route = directionResponse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            // 表示のregionを指定
//            let rect = route.polyline.boundingMapRect
//            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemBlue
        renderer.lineWidth = 4.0
        return renderer
    }
    
    // pinをタップしたときのevent
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
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
