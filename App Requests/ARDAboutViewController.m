//
//  ARDAboutViewController.m
//  App Requests
//
//  Created by App Requests on 5/5/13.
//  Copyright (c) 2013 App Requests Development. All rights reserved.
//

#import "ARDAboutViewController.h"
#import "Apsalar.h"
@interface ARDAboutViewController ()

@end

@implementation ARDAboutViewController
@synthesize aboutView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [Apsalar event:@"Selected About"];

    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSData *dataURL =  [NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://turboe.co/AppRequests/in-app/get-about.php" ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
    NSLog(@"%@", serverOutput);
    aboutView.text = serverOutput;
    [self stopIndicator];
	// Do any additional setup after loading the view.
}

- (void)stopIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
