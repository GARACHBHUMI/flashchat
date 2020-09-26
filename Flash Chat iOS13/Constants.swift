//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by ravi on 10/09/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
struct Constants
{
    static let cellNibName = "MessageCell"
    static let cellName = "ReusableCell"
    
    struct FStore
    {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dataField = "data"
    }
    
}
