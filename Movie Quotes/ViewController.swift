//  ViewController.swift
//  Movie Quotes

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let movieNames = ["Hannibal","The Mentalist","Batman","The Avengers","Interstellar","Inception","Frozen","Doctor Strange","Sherlock Holmes"]
        
    let movieImages = ["https://static3.srcdn.com/wordpress/wp-content/uploads/2018/10/Mads-Mikkelsen-As-Hannibal-Eating-Dinner.jpg",
         "https://static.wikia.nocookie.net/cbs/images/2/20/The_Mentalist_poster.jpg",
         "https://cdn.mos.cms.futurecdn.net/2NBcYamXxLpvA77ciPfKZW-1200-80.jpg",
         "https://content.osn.com/bob/745x419/MV002815_LC_STB093429429.jpg",
         "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/25cdf7c5b245e70240a6c6e783af07eac16c861d7744844be817cff2b8d4bade._RI_V_TTW_.jpg",
         "https://media.elcinema.com/uploads/_315x420_2028a02da250c809cc4493409e19f7f80e2f37f9045ef28cf033448f56968505.jpg",
         "https://cdn.europosters.eu/image/750/posters/frozen-2-magic-i83468.jpg",
         "https://sm.ign.com/t/ign_mear/screenshot/default/doctor-strange-1_tkb2.1280.jpg",
         "https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_.jpg"
    ]


    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 190)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

////////////////////////////////////UICollectionView///////////////////////////////
    extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movieNames.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
            
            cell.nameLabel.text = movieNames[indexPath.row]
            cell.imageView.kf.setImage(with: URL(string: movieImages[indexPath.row]))
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            //let size = collectionView.frame.size.width / 2
            return CGSize(width: size, height: size)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let selectedCell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
            selectedCell.contentView.backgroundColor = .systemCyan

            let QuizVC = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
            QuizVC.movieName = movieNames[indexPath.row]

            navigationController?.pushViewController(QuizVC, animated: true)
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
                selectedCell.contentView.backgroundColor = UIColor.black
            }
        }

//        func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//            let cellToDeselect:UICollectionViewCell = collectionView.cellForItem(at: indexPath as IndexPath)!
//            cellToDeselect.contentView.backgroundColor = .black
//        }
//////////////////////////////////////////
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//            let numberOfSets = CGFloat(self.movieNames.count)
//
//            let width = (collectionView.frame.size.width - (numberOfSets * view.frame.size.width / 15))/numberOfSets
//
//            let height = collectionView.frame.size.height / 2
//
//            return CGSize(width: width, height: height)
//        }
        //////////////////////////////////////////
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 120, height: 150)
//        }
//////////////////////////////////////////
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//
//            let cellWidthPadding = collectionView.frame.size.width / 30
//            let cellHeightPadding = collectionView.frame.size.height / 4
//            return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
//        }
}
