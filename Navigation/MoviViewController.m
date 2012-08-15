//
//  MoviViewController.m
//  Navigation
//
//  Created by Mac Pro on 12/2/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "MoviViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MoviViewController

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
#define ANIMATION_DURATION (10.0)  //动画的速度

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	contentView.image = [UIImage imageNamed:@"bat.jpg"];
	contentView.userInteractionEnabled = YES;
	self.view = contentView;
    
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithTitle:@"Do It" 
                                               style:UIBarButtonItemStylePlain 
                                               target:self 
                                               action:@selector(doit)];
    // Do any additional setup after loading the view from its nib.
}
- (void) doit
{
	// create the reflection layer
    CALayer *reflectionLayer = [CALayer layer];
   // reflectionLayer.backgroundColor = [UIColor redColor].CGColor;
    reflectionLayer.contents = [self.view layer].contents; // share the contents image with the screen layer
    reflectionLayer.opacity = 0.4;
    reflectionLayer.frame = CGRectOffset([self.view layer].frame,0.5, 416.0f + 0.5); // NSHeight(displayBounds)
    reflectionLayer.transform = CATransform3DMakeScale(1.0, -1.0, 1.0); // flip the y-axis  阴影部分的长，宽的比例
    reflectionLayer.sublayerTransform = reflectionLayer.transform;//注释之后，没有变化
    [[self.view layer] addSublayer:reflectionLayer];
	
	// create a shadow layer which lies on top of the reflection layer
    CALayer *shadowLayer = [CALayer layer];
   // shadowLayer.backgroundColor = [UIColor redColor].CGColor;
    shadowLayer.frame = reflectionLayer.bounds;
    shadowLayer.delegate = self;
    [shadowLayer setNeedsDisplay]; 
    [reflectionLayer addSublayer:shadowLayer];//注释之后，没有变化
	
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:ANIMATION_DURATION] forKey:kCATransactionAnimationDuration];
	
    // scale it down  向后退去的轨迹
    CABasicAnimation *shrinkAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//transform.scale
    shrinkAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    shrinkAnimation.toValue = [NSNumber numberWithFloat:0.0];
	[[self.view layer] addAnimation:shrinkAnimation forKey:@"shrinkAnimation"];//shrinkAnimation
	
	// fade it out 改变透明度
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];//opacity
    // NSLog(@"CABasicAnimation *fadeAnimation:%@",fadeAnimation);
    fadeAnimation.toValue = [NSNumber numberWithFloat:0.0];
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [[self.view layer] addAnimation:fadeAnimation forKey:@"fadeAnimation"];//fadeAnimation
	
	// make it jump a couple of times 上下跳的轨迹
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];//position 更改之后 轨迹消失
    //  NSLog(@"CAKeyframeAnimation *positionAnimation :%@",positionAnimation);
    CGMutablePathRef positionPath = CGPathCreateMutable();
    CGPathMoveToPoint(positionPath, NULL, [self.view layer].position.x, [self.view layer].position.y);
    CGPathAddQuadCurveToPoint(positionPath, NULL, [self.view layer].position.x, - [self.view layer].position.y, [self.view layer].position.x, [self.view layer].position.y);
    CGPathAddQuadCurveToPoint(positionPath, NULL, [self.view layer].position.x, - [self.view layer].position.y * 1.5, [self.view layer].position.x, [self.view layer].position.y);
    CGPathAddQuadCurveToPoint(positionPath, NULL, [self.view layer].position.x, - [self.view layer].position.y * 2.0, [self.view layer].position.x, [self.view layer].position.y);
    positionAnimation.path = positionPath;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [[self.view layer] addAnimation:positionAnimation forKey:@"positionAnimation"];
	[CATransaction commit];//注释之后没有变化
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

@end
