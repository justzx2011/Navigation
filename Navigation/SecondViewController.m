//
//  SecondViewController.m
//  Navigation
//
//  Created by Mac Pro on 11/3/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "SecondViewController.h"
#import "CALayerTestViewController.h"
#import "AudioToolbox/AudioServices.h"
@implementation SecondViewController
@synthesize textview;
@synthesize webView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //NavigationEntry* GetActiveEntry() const;  
 //   NSLog(@"%@",[self.navigationController])
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    
//    self.textview.inputView = button;
//    NSString *s = @"This is a smiley \ue415 face";
//    self.textview.text = s;
    self.textview.dataDetectorTypes = UIDataDetectorTypeAll;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTextview:nil];
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)gotoCALayerTest:(id)sender {
    CALayerTestViewController *calayerText = [[CALayerTestViewController alloc]initWithNibName:@"CALayerTestViewController" bundle:nil];
    [self.navigationController pushViewController:calayerText animated:YES];
}

- (IBAction)zhendong:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
