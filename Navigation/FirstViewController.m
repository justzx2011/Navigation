//
//  FirstViewController.m
//  Navigation
//
//  Created by Mac Pro on 10/25/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "FirstViewController.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import "SecondViewController.h"
#import "PicView.h"
#import "MoviViewController.h"
#import "FireBall.h"
#import "PlantFlowers.h"
@implementation FirstViewController
@synthesize moviePlayer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"moviPlayer";
        UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:@"播放" style:UIBarButtonItemStyleBordered target:self action:@selector(moviPlayer)];
        self.navigationItem.rightBarButtonItem = button;

    }
    return self;
}
-(void)moviPlayer{
   // NSLog(@"wefwfsfewfewfewfew");
//    NSBundle *bundle = [NSBundle mainBundle];
//    MPMoviePlayerController *_moviePlayer = [[MPMoviePlayerController alloc] init];
//    self.moviePlayer = _moviePlayer;
//    [moviePlayer setControlStyle:MPMovieFinishReasonUserExited];
//    [moviePlayer setShouldAutoplay:YES];
//    
//    moviePlayer.view.frame = CGRectMake(0, 0, 320, 440);
//    NSString *moviePath = [bundle pathForResource:@"Beijing Zoo" ofType:@"mp4"];
//    NSURL *mMovieURL = [NSURL fileURLWithPath:moviePath];
//    [moviePlayer setContentURL:mMovieURL];
//    [moviePlayer play];
//    [[NSNotificationCenter defaultCenter] addObserver:self 
//                                             selector:@selector(moviePlayBackDidFinish:) 
//                                                 name:MPMoviePlayerPlaybackDidFinishNotification 
//                                               object:moviePlayer];
//    [[NSNotificationCenter defaultCenter] addObserver:self 
//                                             selector:@selector(moviePlayBackDidChange:) 
//                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification 
//                                               object:moviePlayer];
//    [self.view addSubview:moviePlayer.view];


    NSString *loc=[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Beijing Zoo"] ofType:@"mp4"];
  //  NSLog(@"loc:%@",loc);
    NSURL *url=[NSURL fileURLWithPath:loc];
  //  NSLog(@"url:%@",url);
    MPMoviePlayerController *_moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:url];
    moviePlayer = _moviePlayer;
    moviePlayer.view.frame=CGRectMake(0, 0, 320, 480);
   // moviePlayer.controlStyle=MPMovieControlStyleFullscreen;
    [moviePlayer setControlStyle:MPMovieFinishReasonUserExited];
    moviePlayer.shouldAutoplay = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(moviePlayBackDidFinish:) 
                                                 name:MPMoviePlayerPlaybackDidFinishNotification 
                                               object:moviePlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(moviePlayBackDidChange:) 
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification 
                                               object:moviePlayer];
    [self.view addSubview:moviePlayer.view];
//    moviePlayer.movieControlMode=MPMovieControlModeHidden;
    self.navigationController.navigationBarHidden = YES;
    [moviePlayer play];    
 
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification{
   // NSLog(@"didFinish");
    [self.moviePlayer.view removeFromSuperview];
    self.navigationController.navigationBarHidden = NO;
    
}
- (void) moviePlayBackDidChange:(NSNotification*)notification{
    if (self.moviePlayer.playbackState == MPMoviePlaybackStatePaused) {
      //  NSLog(@"stop");
    }
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)gotoSecondView:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];

    SecondViewController *secondView = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (IBAction)gotoPicView:(id)sender {
    PicView *picView = [[PicView alloc]initWithNibName:@"PicView" bundle:nil];
    [self.navigationController pushViewController:picView animated:YES];

    [UIView beginAnimations:nil context:NULL];  
    [UIView setAnimationDuration: 1];  
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.navigationController.view cache:YES];  
 //   [[self navigationController] pushViewController:objMapView animated:NO];  
    [UIView commitAnimations];  

}

- (IBAction)gotoMoviViewController:(id)sender {
    MoviViewController *movi = [[MoviViewController alloc]initWithNibName:@"MoviViewController" bundle:nil];
    [self.navigationController pushViewController:movi animated:YES];
}

- (IBAction)gotoFireBall:(id)sender {
    FireBall *fireBall = [[FireBall alloc]initWithNibName:@"FireBall" bundle:nil];
    [self.navigationController pushViewController:fireBall animated:YES];
}

- (IBAction)gotoPlantFlowers:(id)sender {
    PlantFlowers *plantFlowers = [[PlantFlowers alloc]initWithNibName:@"PlantFlowers" bundle:nil];
    [self.navigationController pushViewController:plantFlowers animated:YES];
}
@end
