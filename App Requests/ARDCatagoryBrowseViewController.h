//
//  ARDCatagoryBrowseViewController.h
//  App Requests
//
//  Created by App Requests on 5/11/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ARDCatagoryBrowseViewController : UITableViewController {
    IBOutlet UILabel *textLabel;
    IBOutlet UITableView *catagorysTable;
    NSMutableArray *selectedCatagorys;
    NSDictionary *results;
    NSString *catagory1;
    NSString *catagory2;
    NSString *catagory3;
}

@property (strong, nonatomic) NSArray *catagorys;
@property (strong, nonatomic) NSMutableArray *selectedCatagorys;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UITableView *catagorysTable;
@property (strong, nonatomic) NSDictionary *results;
@property (strong, nonatomic) NSString *catagory1;
@property (strong, nonatomic) NSString *catagory2;
@property (strong, nonatomic) NSString *catagory3;

@end
