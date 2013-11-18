//
//  ARDAppDelegate.h
//  App Requests
//
//  Created by App Requests on 4/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ARDAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate> {
    MBProgressHUD *HUD;
    NSTimer *myTimer;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *buttonTitle;
@property (strong, nonatomic) UIAlertView *alert;
@property (assign, nonatomic) BOOL resumingApp;
@property (assign, nonatomic) BOOL startTimer;
@property (assign, nonatomic) BOOL doNotResumeApp;

@property (retain, nonatomic) NSTimer *myTimer;

@end