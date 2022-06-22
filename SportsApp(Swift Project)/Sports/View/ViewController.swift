//
//  ViewController.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 14/06/2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource
{
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    var sportArr = [Sport]()
    var sportsViewModel = viewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        sportsCollectionView.delegate = self
//        sportsCollectionView.dataSource = self
        self.sportsViewModel.getData()
        sportsViewModel.bindingClosure =  {[weak self] in
            DispatchQueue.main.async{
            self!.sportArr = self!.sportsViewModel.sportsArray
                print (self!.sportArr)
            self!.sportsCollectionView.reloadData()
            
            }
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
             var temp = sportArr [indexPath.row]
        cell.sportName.text = temp.strSport
        //setting the image
       // let processor = RoundCornerImageProcessor(cornerRadius: 300)
        let processor = ResizingImageProcessor(referenceSize: cell.sportThumb.frame.size) |> RoundCornerImageProcessor(cornerRadius: cell.sportThumb.frame.size.height / 2)
//        let processor = ResizingImageProcessor(referenceSize: cell.sportThumb.frame.size) |> RoundCornerImageProcessor(cornerRadius: cell.sportThumb.frame.size.height / 2)
     cell.sportThumb.clipsToBounds = true
//        let processor = DownsamplingImageProcessor(size: cell.sportThumb.bounds.size)
//                     |> RoundCornerImageProcessor(cornerRadius: 20)
        cell.sportThumb.kf.setImage(with: URL(string: temp.strSportThumb),options: [.processor(processor)])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "LeaguesVC") as! LeaguesViewController
        vc.targetedSport = sportArr[indexPath.row].strSport
        self.present(vc, animated: true)
    }


}

extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sportsCollectionView.frame.width/2, height: sportsCollectionView.frame.width/2)
    }
}

