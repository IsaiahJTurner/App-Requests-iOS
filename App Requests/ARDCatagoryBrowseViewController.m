//
//  ARDCatagoryBrowseViewController.m
//  App Requests
//
//  Created by App Requests on 5/11/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDCatagoryBrowseViewController.h"
#import "ARDResultsReturnedViewController.h"
#import "Apsalar.h"

@interface ARDCatagoryBrowseViewController ()

@end

@implementation ARDCatagoryBrowseViewController
@synthesize selectedCatagorys;
@synthesize catagorys;
@synthesize catagorysTable;
@synthesize textLabel;
@synthesize results;
@synthesize catagory1;
@synthesize catagory2;
@synthesize catagory3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [Apsalar event:@"Browsing by Category"];

    //[notice show];
    catagory1=@"";
    catagory2=@"";
    catagory3=@"";
    selectedCatagorys = [[NSMutableArray alloc] init];
    catagorys = [[NSArray alloc] initWithObjects:@"Games",@"Education",@"Newsstand",@"Books",@"Buisness",@"Catalogs",@"Entertainment",@"Finance",@"Food & Drink",@"Health & Fitness",@"Lifestyle",@"Medical",@"Music",@"Navigation",@"News",@"Photo & Video",@"Productivity",@"Reverence",@"Social Networking",@"Sports",@"Travel",@"Utilitys",@"Weather",@"Other", nil];
	// Do any additional setup after loading the view.
  //  self.navigationItem.title = @"Select Catagorys";
//self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePicking:)];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1px.png"]];
    bgView.frame = self.view.frame;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = bgView;
    [bgView release];
    [super viewDidLoad];
    self.navigationController.title = @"Select Category";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [catagorys count];
}
- (IBAction)donePicking:(id)sender {
   
    NSString *prePost =[NSString stringWithFormat:@"catagory1=%@&catagory2=%@&catagory3=%@", catagory1, catagory2, catagory3];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/by-catagory.php?";
    NSString *finalURLString = [hostStr stringByAppendingString:post];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];
   //NSString *resultsString = [NSString stringWithContentsOfURL:finalURL];

    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@%@", hostStr,prePost);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"date";
    vc.titleString = @"Browse by Category";
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModal:)];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navC animated:YES completion:nil];
   // [vc release];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    NSString *cellValue = [catagorys objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
};


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [Apsalar event:@"User Selected Category"];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    catagory1 = [self.catagorys objectAtIndex:indexPath.row];

    NSString *prePost =[NSString stringWithFormat:@"catagory1=%@&catagory2=%@&catagory3=%@", catagory1, catagory2, catagory3];
    NSString *post = [prePost stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *hostStr = @"http://turboe.co/AppRequests/in-app/submissions/by-catagory.php?";
    NSString *finalURLString = [hostStr stringByAppendingString:post];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];
    //NSString *resultsString = [NSString stringWithContentsOfURL:finalURL];
    
    NSString *returnResults = [[NSString alloc]initWithContentsOfURL:finalURL encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",returnResults);
    NSData *jsData = [returnResults dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    
    NSDictionary *dictResults = [NSJSONSerialization JSONObjectWithData:jsData options:NSJSONReadingMutableContainers error:NULL];
    
    NSLog(@"%@%@", hostStr,prePost);
    NSLog(@"%@", dictResults);
    
    //Now we will switch to the results view controller
    ARDResultsReturnedViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    vc.dictResults = dictResults;
    vc.sortBy = @"date";
    vc.titleString = @"Browse by Category";
   // vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModal:)];
    //UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController pushViewController:vc animated:YES];
    // [vc release];

    /*
    if ([selectedCatagorys count] < 3) {
    UITableViewCell *tableViewCell = [tableView cellForRowAtIndexPath:indexPath];
        if (tableViewCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        
         tableViewCell.accessoryType = UITableViewCellAccessoryNone;
        [selectedCatagorys removeObject:[self.catagorys objectAtIndex:indexPath.row]];
            if ([selectedCatagorys count] == 0){
                catagory1 = @"";
            }
            else if ([selectedCatagorys count] == 1){
                catagory2 = @"";
            }
            else if ([selectedCatagorys count] == 2){
                catagory3 = @"";
            }
            
        
        } else {
            tableViewCell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self.selectedCatagorys  addObject:[self.catagorys objectAtIndex:indexPath.row]];
            if ([selectedCatagorys count] == 1){
                catagory1 = [self.catagorys objectAtIndex:indexPath.row];
            }
            else if ([selectedCatagorys count] == 2){
                catagory2 = [self.catagorys objectAtIndex:indexPath.row];
            }
            else if ([selectedCatagorys count] == 3){
                catagory3 = [self.catagorys objectAtIndex:indexPath.row];
            }
            
        }
        
    NSUInteger catagoryCount = [selectedCatagorys count];
    NSLog(@"%lu catagorys selected", (unsigned long) catagoryCount);
}*/
    
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
