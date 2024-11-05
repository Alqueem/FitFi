import UIKit

class HomeTabViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OutfitData.shared.outfitItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutfitCell", for: indexPath) as! OutfitCollectionViewCell
        
        let outfitItem = OutfitData.shared.outfitItems[indexPath.row]
        cell.outfitImageView.image = UIImage(named: outfitItem.imageName)
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Create an instance of OutfitEditableViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let outfitEditableVC = storyboard.instantiateViewController(withIdentifier: "OutfitEditableViewController") as? OutfitEditableViewController {
            
            // Pass the selected outfit item
            outfitEditableVC.outfitItem = OutfitData.shared.outfitItems[indexPath.row]
            
            // Present the view controller
            outfitEditableVC.modalPresentationStyle = .fullScreen // Optional: makes it fullscreen
            present(outfitEditableVC, animated: true, completion: nil)
        }
    }

    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(600))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            return section
        }
        return layout
    }
}
