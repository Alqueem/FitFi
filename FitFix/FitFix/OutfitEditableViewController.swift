import UIKit

class OutfitEditableViewController: UIViewController {
    var outfitItem: OutfitItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example usage of outfitItem
        if let outfitItem = outfitItem {
            // Set up UI with the outfitItem's properties, e.g., display image
            // outfitImageView.image = UIImage(named: outfitItem.imageName)
        }
    }
}
