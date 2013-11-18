//
//  ARDResultsReturnedViewController.h
//  App Requests
//
//  Created by App Requests on 5/12/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDResultsReturnedViewController : UITableViewController {
    NSDictionary *dictResults;
    NSString *sortBy;
    NSString *titleString;

}

@property (strong, nonatomic) NSDictionary *dictResults;
@property (strong, nonatomic) NSString *sortBy;
@property (strong, nonatomic) NSString *titleString;

@end
