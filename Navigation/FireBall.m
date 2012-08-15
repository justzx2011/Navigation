//
//  FireBall.m
//  Navigation
//
//  Created by Mac Pro on 12/12/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "FireBall.h"

@implementation FireBall

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
    pos = CGPointMake(15.0, 7.5);
   // self.view.backgroundColor = [UIColor blackColor];
    fireBall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    fireBall.frame = CGRectMake(0, 0, 32, 32);
   [self.view addSubview:fireBall];
//    [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
   // [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
  //  [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"2.png"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view from its nib.
}
- (void)removeSmoke:(NSString *)animationID finished:(NSNumber *)finished context:(UIImageView *)context {	
	UIImageView *imageView = context;
	[imageView removeFromSuperview];
//    NSLog(@"da%d",[self.view.subviews count]);
}
//
//-(void) onTimer {
//	float x = fireBall.center.x;
//	float y = fireBall.center.y;
//	//fireBall.center = CGPointMake(fireBall.center.x + pos.x, fireBall.center.y + pos.y);
////	
////	if (fireBall.center.x > 320 || fireBall.center.x < 0)
////		pos.x = -pos.x;
////	if (fireBall.center.y > 416 || fireBall.center.y < 0)
////		pos.y = -pos.y;
//	
//	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.png"]];
//	imageView.frame = CGRectMake(x-16, y-16, 32, 32);
//	[self.view addSubview:imageView];
//    [UIView beginAnimations:nil context:nil];
//	[UIView setAnimationDuration:3.0];
//	[UIView setAnimationCurve:UIViewAnimationCurveLinear];//UIViewAnimationCurveEaseOut 修改参数之后没有变化
//	imageView.frame = CGRectMake(x-10, y-10, 12, 12);
//	[imageView setAlpha:0.0];
//	[UIView setAnimationDelegate:self];
////	[UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];//
//	[UIView commitAnimations];	
//	
//	[self.view bringSubviewToFront:fireBall];
//    
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    //NSLog(@"began:x:%f,y:%f",pt.x,pt.y);
    fireBall.frame = CGRectMake(pt.x-32, pt.y-32, 32, 32);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self.view];
 //   NSLog(@"move:x:%f,y:%f",pt.x,pt.y);

    fireBall.frame = CGRectMake(pt.x-32, pt.y-32, 32, 32);
//    [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:NO];
    float x = fireBall.center.x;
	float y = fireBall.center.y;

	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.png"]];
	imageView.frame = CGRectMake(x-16, y-16, 32, 32);
	[self.view addSubview:imageView];
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];//UIViewAnimationCurveEaseOut 修改参数之后没有变化
	imageView.frame = CGRectMake(x-10, y-10, 12, 12);
	[imageView setAlpha:0.0];
	[UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeSmoke)];//
	[UIView commitAnimations];	
	
	[self.view bringSubviewToFront:fireBall];


}
-(void)removeSmoke{
    NSArray *array = [self.view subviews];
    //  NSLog(@"%@:",array);
    for (UIImageView *imageView in array) {
        if (imageView.alpha == 0.0) {
            [imageView removeFromSuperview];
        }
    }
   NSLog(@"xiaocount:%d",[self.view.subviews count]);

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(removeSmoke) userInfo:nil repeats:NO];
  //  CGPoint pt = [[touches anyObject] locationInView:self.view];
 //   NSLog(@"end:x:%f,y:%f",pt.x,pt.y);
//    NSArray *array = [self.view subviews];
//  //  NSLog(@"%@:",array);
//    for (UIImageView *imageView in array) {
//        if (imageView.alpha == 0.0) {
//            [imageView removeFromSuperview];
//        }
//    }
 //   NSLog(@"count:%d",[self.view.subviews count]);
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
- (UIImage *)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics
{
    UIImage *image = [UIImage imageNamed:@"2.png"];
    return image;
}
@end
