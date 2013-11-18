//
//  ARDRatingViewController.h
//  App Requests
//
//  Created by App Requests on 5/10/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDSecondViewController.h"

@interface ARDRatingViewController : ARDSecondViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSString *catagoryString;
    NSString *ageRestrictionString;
    IBOutlet UISegmentedControl *ageRestriction;
    IBOutlet UIPickerView *catagoryPicker;
}

@property (retain, nonatomic) UIPickerView *catagoryPicker;
@property (strong, nonatomic) NSArray *catagorys;
@property (strong, nonatomic) NSString *catagoryString;
@property (strong, nonatomic) NSString *ageRestrictionString;
@property (strong, nonatomic) UISegmentedControl *ageRestriction;

- (IBAction)changeRestriction;
- (IBAction)dismissModal:(id)sender;

@end
