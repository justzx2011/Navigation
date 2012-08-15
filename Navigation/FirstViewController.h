//
//  FirstViewController.h
//  Navigation
//
//  Created by Mac Pro on 10/25/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <MediaPlayer/MPMoviePlayerController.h>


@interface FirstViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
}
- (IBAction)gotoSecondView:(id)sender;
- (IBAction)gotoPicView:(id)sender;
- (IBAction)gotoMoviViewController:(id)sender;
- (IBAction)gotoFireBall:(id)sender;
- (IBAction)gotoPlantFlowers:(id)sender;
@property (nonatomic,retain) MPMoviePlayerController *moviePlayer;
@end
