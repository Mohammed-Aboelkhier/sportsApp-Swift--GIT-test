//
//  LeagueDetailsViewController.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 18/06/2022.
//

import UIKit
import Kingfisher

class LeagueDetailsViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var latestResultsCV: UICollectionView!
    
    @IBOutlet weak var TeamsCV: UICollectionView!
    
    
    @IBOutlet weak var upComingEvetsCollectionView: UICollectionView!
    
    var leagueDetailsVM = leagueDetailsViewModel()
    var leagueID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upComingEvetsCollectionView.delegate = self
        upComingEvetsCollectionView.dataSource = self
        latestResultsCV.delegate = self
        latestResultsCV.dataSource = self
        TeamsCV.delegate = self
        TeamsCV.dataSource = self
        leagueDetailsVM.leagueID = self.leagueID
        leagueDetailsVM.getUpComingEvents()
        leagueDetailsVM.filterEvents()
        leagueDetailsVM.getAllTeams()
        leagueDetailsVM.bindingClosure = { [weak self] in
            DispatchQueue.main.async {
                self!.upComingEvetsCollectionView.reloadData()
                self!.latestResultsCV.reloadData()
                self!.TeamsCV.reloadData()
                print ("upcoming event")
            }
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == TeamsCV
        {
            return leagueDetailsVM.arrayOfTeams.count
        }
        return leagueDetailsVM.arrayOfEvents.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == upComingEvetsCollectionView
//        {
//
//        }
        if collectionView == upComingEvetsCollectionView
        {
        var cell = upComingEvetsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! UpComingEventsCollectionViewCell
        
        var temp = leagueDetailsVM.arrayOfEvents[indexPath.row]
        cell.eventName.text = temp.strEvent
        let dateFormatter = DateFormatter()
        cell.eventDate.text = temp.dateEvent
        cell.eventTime.text = temp.strTime
        return cell
        }
       
        else if collectionView == latestResultsCV
        {
            var cell = latestResultsCV.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! LatestResultsCollectionViewCell
            var temp = leagueDetailsVM.arrayOfEvents[indexPath.row]
            cell.homeTeam2.text = temp.strHomeTeam
            cell.awayTeam.text = temp.strAwayTeam
            cell.homeSore.text = String(temp.intHomeScore)
            cell.awayScore.text = String(temp.intAwayScore)
            cell.eventDate.text = temp.dateEvent
            cell.eventTime.text = temp.strTime
            
            
            return cell
        }
        else
        {
         var cell = TeamsCV.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! TeamCollectionViewCell
//            cell.te.kf.setImage(with: URL(string: temp.strSportThumb),options: [.processor(processor)])
            return cell
        }
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

extension LeagueDetailsViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: latestResultsCV.frame.width, height: latestResultsCV.frame.height)
    }
}
