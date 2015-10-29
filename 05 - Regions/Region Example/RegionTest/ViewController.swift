import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myMap: MKMapView!

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 1000, identifier: "bournemouth")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        
        let boscomePier = CLLocationCoordinate2D(latitude: 50.719914, longitude: -1.843552)
        let boscombePierRegion = CLCircularRegion(center: boscomePier, radius: 1000, identifier: "boscombe")
        locationManager.startMonitoringForRegion(boscombePierRegion)
        
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        myImage.image = UIImage(named: region.identifier)
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        myImage.image = nil
    }
    
}







