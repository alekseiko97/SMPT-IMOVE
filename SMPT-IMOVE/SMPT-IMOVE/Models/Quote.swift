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
//An array with quotes, and a random number generator, made globally in the Quote class.
var Quotes = [Quote(quote: "I can accept failure, everyone fails at something. But I can’t accept not trying again. - Michael Jordan"),
              Quote(quote:"You are never a loser until you quit trying"),
              Quote(quote:"It never gets easier, you just get better."),
              Quote(quote:"Success isn’t given. It’s earned. On the track, on the field, in the gym. With blood, sweat, and the occasional tear."),
              Quote(quote:"Winners never quit and quitters never win. - Vince Lombardi"),
              Quote(quote:"Most people give up just when they’re about to achieve success. They quit on the one yard line. They give up at the last minute of the game one foot from a winning touchdown.– Ross Perot"),
              Quote(quote:"No matter how slow you go, you are still lapping everybody on the couch."),
              Quote(quote:"You can’t always be the best, but you can do your best."),
              Quote(quote:"Failure is only the opportunity to begin again. Only this time, more wisely."),
              Quote(quote:"I don’t count my sit-ups; I only start counting when it starts hurting because they’re the only ones that count - Mohammed Ali"),
              Quote(quote:"Don’t think you should’ve started a long time ago. Be glad you’re doing it now."),
              Quote(quote:"A ship in the harbor is safe. But that’s not what ships are for."),
              Quote(quote:"We all must suffer one of two things: the pain of discipline or the pain of regret."),
              Quote(quote:"Stop being afraid of what could go wrong, and start being excited about what could go right.")]

let randomNumber = Int(arc4random_uniform(14))

