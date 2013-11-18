//
//  ARDAccountViewController.h
//  App Requests
//
//  Created by App Requests on 5/4/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDAccountViewController : UIViewController {
    IBOutlet UILabel *userLabel;
}
@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) NSString *usernameString;

- (IBAction)signOut:(id)sender;

@end
