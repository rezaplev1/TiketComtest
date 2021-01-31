//
//  Helper.swift
//  TiketComtest
//
//  Created by reza pahlevi on 30/01/21.
//

import Foundation
import Alamofire

public class Helper {
    
    //MARK : CHECKING IS CONNECTING TO NETWORK
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
