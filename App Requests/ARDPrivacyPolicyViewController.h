//
//  ARDPrivacyPolicyViewController.h
//  App Requests
//
//  Created by App Requests on 8/17/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDPrivacyPolicyViewController : UIViewController {
    IBOutlet UIWebView *webView;
}
@property (retain, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)dismisscontroller:(id)sender;
@end
