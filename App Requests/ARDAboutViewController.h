//
//  ARDAboutViewController.h
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDAboutViewController : UIViewController {
    IBOutlet UITextView *aboutView;
}
- (IBAction)closeView:(id)sender;
@property (nonatomic, strong) UITextView *aboutView;
- (void)stopIndicator;
@end
