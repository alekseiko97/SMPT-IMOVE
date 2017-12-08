//
//  Quote.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit
class Quote: CustomStringConvertible {
    
    var quote: String
    init(quote:String){
        self.quote = quote
    }
    
    var description: String {
        return "\(quote)"
    }
}
