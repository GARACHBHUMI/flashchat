

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var char = 0.0
        let array = "⚡️FlashChat"
        for letter in array
        {
            Timer.scheduledTimer(withTimeInterval: (0.1 * char), repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            char += 1
            
        }
       
    }
    

}
