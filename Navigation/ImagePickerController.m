//
//  ImagePickerController.m
//  Navigation
//
//  Created by Mac Pro on 12/1/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "ImagePickerController.h"
#import "UIProgressHUD.h"
@implementation ImagePickerController
@synthesize ratingView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) killHUD: (id) aHUD
{
	[aHUD show:NO];
}
- (void) presentSheet
{
    //	id HUD = [[UIProgressHUD alloc] initWithWindow:[self.view superview]];
	id HUD = [[UIProgressHUD alloc] initWithWindow:self.view];	
    [HUD setText:@"Downloading File. Please wait."];
    [HUD show:YES];
	
    [self performSelector:@selector(killHUD:) withObject:HUD afterDelay:5.0];
}

- (void)viewDidLoad
{
   // self.frame = CGRectMake(0, 0, 150, 30);
    ratingView =[[RatingView alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    [self.view addSubview:ratingView];
    [ratingView setImageFullSelect:@"2.png" UnSelect:@"0.png" ForRating:3];
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    clearButton.frame = CGRectMake(0, 30, 50, 30);
    [clearButton setTitle:@"clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearStars) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:clearButton];
    
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
											   initWithTitle:@"Do It" 
											   style:UIBarButtonItemStylePlain 
											   target:self 
                                              action:@selector(presentSheet)];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)clearStars{
    [ratingView setImageFullSelect:@"2.png" UnSelect:@"0.png" ForRating:0];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.ratingView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
