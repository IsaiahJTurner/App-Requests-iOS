//
//  ARDLoginViewController.h
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDLoginViewController : UIViewController {
    IBOutlet UITextField *emailField;
    IBOutlet UITextField *passwordField;
    IBOutlet UIButton *accountLoginButton;
}

@property (nonatomic, retain) UITextField *emailField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UIButton *accountLoginButton;
@property (nonatomic) BOOL valid;

-(IBAction) accountLogin: (id) sender;
- (IBAction)cancelLogin:(id)sender;


@end
