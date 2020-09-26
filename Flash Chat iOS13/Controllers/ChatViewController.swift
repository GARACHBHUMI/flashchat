

import UIKit
import Firebase
class ChatViewController: UIViewController {
    
    let db =  Firestore.firestore()
    
    var messages:[Message] = [Message(sender:"abc@gmail.com",body:"hi"),
     Message(sender:"1@2.com",body:"hello")]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FlashChat"
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.register(UINib(nibName:Constants.cellNibName , bundle: nil), forCellReuseIdentifier: "ResusableCell")
        
    }
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    if let messageBody = messageTextfield.text,
        let messageSender = Auth.auth().currentUser?.email
       {
        db.collection(Constants.FStore.collectionName).addDocument(data: [Constants.FStore.senderField:messageSender,
       Constants.FStore.bodyField:messageBody]) { (error) in
                    if let e = error
                    {
                        print("there might be an error in saving data \(e)")
                    }
                    else
                    {
                      print("successfully saved")
                    }
            }
        }
        
        
    }
    

}
extension ChatViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier:Constants.cellName , for: indexPath) 
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
    
    
}
