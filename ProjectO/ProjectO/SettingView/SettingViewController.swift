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
    case profile
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
    
    var data: [SettingType] = [.profile, .location, .photos, .logout]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        

        self.title = "Setting"
        
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
        case .profile:
            cell.titleLbl.text = "Profile"
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
        case .profile:
            self.performSegue(withIdentifier: "profile", sender: nil)
        case .location:
            break
        case .photos:
            let vc = UIStoryboard.init(name: "PhotosSB", bundle: Bundle.main).instantiateInitialViewController() as? PhotosViewController
            self.navigationController?.pushViewController(vc!, animated: true)
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
