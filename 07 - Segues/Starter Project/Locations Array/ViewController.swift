
import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController {

    var locations = [CLLocationCoordinate2D]()
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var locationsLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySlider.enabled = false
        selectButton.enabled = false
    }
    
    @IBAction func loadLocations(sender: AnyObject) {
        mySlider.value = 0
        mySlider.enabled = false
        
        locations.removeAll()
        
        Alamofire.request(.GET, "http://kylegoslan.co.uk/locations.json").response { request, response, data, error in
            
            if let data = data {
                let json = JSON(data: data)

                for location in json {
                    let newLocation = CLLocationCoordinate2D(latitude: location.1["lat"].doubleValue, longitude: location.1["long"].doubleValue)
                    self.locations.append(newLocation)
                }
                
                self.updateView()
            }
        }
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        let wholeNumber = Int(mySlider.value)
        mySlider.value = Float(wholeNumber)
    }
    
    func updateView() {
        
        locationsLabel.text = "\(locations.count) locations found."
        
        mySlider.minimumValue = 0
        mySlider.maximumValue = Float(locations.count)
        mySlider.enabled = true
        selectButton.enabled = true
    }
    

}

