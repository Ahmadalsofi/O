//
//  SettingViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit
import CoreLocation

enum SettingType {
    case logout
    case phoneNumber
    case location
    case photos
}



class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
                                CLLocationManagerDelegate{
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            SettingTableViewCell.register(on: tableView)
        }
    }
    
    var locationManager: CLLocationManager?
    
    var data: [SettingType] = [.phoneNumber, .location, .photos, .logout]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        
        cell.detailsLbl.isHidden = true
        
        switch data[indexPath.row] {
        case .logout:
            cell.titleLbl.text = "Logout"
        case .phoneNumber:
            cell.titleLbl.text = "Phone"
        case .location:
            cell.detailsLbl.isHidden = false
            cell.titleLbl.text = "Location"
            cell.detailsLbl.text = "Amman"
        case .photos:
            cell.titleLbl.text = "Photos"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch data[indexPath.row] {
        case .logout:
            LoginManager.logout()
        case .phoneNumber:
            break
        case .location:
            break
        case .photos:
            self.performSegue(withIdentifier: "PhotosViewController", sender: nil)

        }
        
    }
    
    
  
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                }
            }
        }
    }
}
