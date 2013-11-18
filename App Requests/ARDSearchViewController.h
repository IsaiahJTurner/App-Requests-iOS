//
//  ARDSearchViewController.h
//  App Requests
//
//  Created by App Requests on 6/7/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDSearchViewController : UITableViewController <UISearchBarDelegate, UITableViewDelegate> {
    NSArray *searchResults;
    NSString *sortBy;
    UISearchBar *searchBar;
}

@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSString *sortBy;
@property (retain, nonatomic) UISearchBar *searchBar;

@end
