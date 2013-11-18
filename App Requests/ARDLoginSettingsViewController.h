//
//  ARDLoginSettingsViewController.h
//  App Requests
//
//  Created by App Requests on 6/9/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDLoginSettingsViewController : UIViewController {
    IBOutlet UITextField *usernameField;
    IBOutlet UITextField *passwordField;
    
}

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic) BOOL valid;

@end
