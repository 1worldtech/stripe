//
// Created by Ibby Hadeed on 2019-11-05.
// Copyright (c) 2019 Max Lynch. All rights reserved.
//

import Foundation
import Stripe

extension StripePlugin: STPCustomerEphemeralKeyProvider {
    public func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        completion(self.ephemeralKey! as? [AnyHashable : Any], nil)
    }
}

extension StripePlugin : STPPaymentContextDelegate {
    public func paymentContext(_ paymentContext: STPPaymentContext,
                               didFailToLoadWithError error: Error) {
        NSLog("failed with errors %s", error.localizedDescription)
    }

    public func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
        NSLog("something changed")
    }

    public func paymentContext(_ paymentContext: STPPaymentContext,
                               didCreatePaymentResult paymentResult: STPPaymentResult,
                               completion: @escaping STPPaymentStatusBlock) {
        self.bridge.triggerJSEvent(eventName: "paymentCreate", target: "", data: "")
        completion(STPPaymentStatus.success, nil)
    }

    public func paymentContext(_ paymentContext: STPPaymentContext,
                               didFinishWith status: STPPaymentStatus,
                               error: Error?) {
        switch status {
        case .userCancellation:
            NSLog("")
            
        case .error:
            NSLog("")
            
        case .success:
            NSLog("")
        }
    }
}
