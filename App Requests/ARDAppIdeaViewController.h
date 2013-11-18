//
//  ARDAppIdeaViewController.h
//  App Requests
//
//  Created by App Requests on 5/18/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDAppIdeaViewController : UIViewController {
    IBOutlet UILabel *idLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextView *descriptionText;
    IBOutlet UILabel *categoryLabel;
    IBOutlet UILabel *ageLabel;
    IBOutlet UILabel *likesLabel;
    IBOutlet UITextView *twitterLabel;
    IBOutlet UITextView *emailLabel;
    IBOutlet UITextView *phoneLabel;
    IBOutlet UITextView *skypeLabel;
    IBOutlet UITextView *appnetLabel;
    IBOutlet UITextView *iMessageLabel;
    IBOutlet UILabel *otherServiceLabel;
    IBOutlet UITextView *otherHandleLabel;
    IBOutlet UITextView *licenseText;
    IBOutlet UIBarButtonItem *flagButton;
    IBOutlet UIBarButtonItem *dislikeButton;
    IBOutlet UIBarButtonItem *likeButton;
    NSDictionary *ideaInfoMain;
}

@property (strong, nonatomic) NSDictionary *ideaInfoMain;
@property (nonatomic, strong) UILabel *idLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *descriptionText;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *likesLabel;
@property (nonatomic, strong) UITextView *twitterLabel;
@property (nonatomic, strong) UITextView *emailLabel;
@property (nonatomic, strong) UITextView *phoneLable;
@property (nonatomic, strong) UITextView *skypeLabel;
@property (nonatomic, strong) UITextView *appnetLabel;
@property (nonatomic, strong) UITextView *iMessageLabel;
@property (nonatomic, strong) UILabel *otherServiceLabel;
@property (nonatomic, strong) UITextView *otherHandleLabel;
@property (nonatomic, strong) UITextView *licenseText;
@property (nonatomic, strong) NSString *navTitle;
@property (nonatomic, strong) UIBarButtonItem *flagButton;
@property (nonatomic, strong) UIBarButtonItem *dislikeButton;
@property (nonatomic, strong) UIBarButtonItem *likeButton;

- (IBAction)likeButton:(id)sender;

@end
