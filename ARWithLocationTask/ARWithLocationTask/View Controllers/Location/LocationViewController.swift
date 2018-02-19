//
//  LocationViewController.swift
//  ARWithLocationTask
//
//  Created by admin on 18/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import UIKit
import GooglePlacePicker

class LocationViewController: UIViewController{
   
    // MARK: - Outlets
    
    @IBOutlet weak var locationTableView: UITableView!
    @IBOutlet weak var addPlace: UIBarButtonItem!
    
    // MARK: - Vars
    var scaleRelativeToDistance = false
    var locations =  CoreConfig.sharedInstance.collections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Added Places"
        locationTableView.rowHeight = UITableViewAutomaticDimension
        locationTableView.estimatedRowHeight = 44
        locationTableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        locationTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Actions
    @IBAction func addUserSelectedLocation(_ sender: Any) {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate = self
        
        placePicker.modalPresentationStyle = .popover
        present(placePicker, animated: true, completion: nil)
    }
    
    @IBAction func placesWithARView(_ sender: Any) {
        let vc = SurroundingARViewController()
        vc.scale = scaleRelativeToDistance
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func scaleForDistance(_ sender: UISwitch) {
        scaleRelativeToDistance = sender.isOn
    }
    
}

// MARK: - GMSPlace Picker Delegate
extension LocationViewController : GMSPlacePickerViewControllerDelegate {
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didFailWithError error: Error) {
        
       print(error.localizedDescription)
    }
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        
        viewController.dismiss(animated: true, completion: nil)
        let latitude: String = "\(place.coordinate.latitude)"
        let longitude: String = "\(place.coordinate.longitude)"

        let userCollection = LocationCollection(locationName:place.name, lat: latitude, long: longitude)
        locations.append(userCollection)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: locations)
        UserDefaults.standard.set(encodedData, forKey: "userLocationData")
        
        
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - TableView Delegate & DataSource
extension LocationViewController:UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLocation") as! LocationTableViewCell
        let product = locations[indexPath.row]
        cell.setProductData(product:product)
        return cell
    }

    
}


