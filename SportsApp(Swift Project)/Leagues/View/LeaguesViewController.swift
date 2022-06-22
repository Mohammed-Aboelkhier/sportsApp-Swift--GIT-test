//
//  LeaguesViewController.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 15/06/2022.
//

import UIKit
import Kingfisher

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var LeaguesTableView: UITableView!
    var detailsViewModel = LeaguesViewModel()
    var targetedSport = "" 
    override func viewDidLoad() {
        super.viewDidLoad()
        LeaguesTableView.delegate = self
        LeaguesTableView.dataSource = self
        // Do any additional setup after loading the view.
        detailsViewModel.callNetworkService()
        
        detailsViewModel.LeaguesBindingClosure = { [weak self] in
           // DispatchQueue.main.async {
                self!.detailsViewModel.filterResults(sport: self!.targetedSport)
                self!.LeaguesTableView.reloadData()
          //  }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsViewModel.arrayOfFilteredLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = LeaguesTableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesTableViewCell
        var temp = detailsViewModel.arrayOfFilteredLeagues[indexPath.row]
        cell.LeagueName.text = temp.strLeague
        cell.youtubeURL = temp.strYoutube
        //setting the image
        let processor = ResizingImageProcessor(referenceSize: cell.leagueBadge.frame.size) |> RoundCornerImageProcessor(cornerRadius: cell.leagueBadge.frame.size.width / 2)
        //cell.leagueBadge.clipsToBounds = true
        cell.leagueBadge.kf.setImage(with: URL(string: temp.strBadge),options: [.processor(processor)])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let vc = storyboard!.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsViewController
        vc.leagueID = detailsViewModel.arrayOfFilteredLeagues[indexPath.row].idLeague
            self.present(vc, animated: true)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
