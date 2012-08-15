//
//  CALayerTestViewController.m
//  Navigation
//
//  Created by Mac Pro on 12/1/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "CALayerTestViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CALayerTestViewController
//@synthesize MyDrawColoredPattern;
static inline double radians (double degrees) { return degrees * M_PI/180; }
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
    //add the layer
    self.view.layer.backgroundColor = [UIColor yellowColor].CGColor;
    self.view.layer.cornerRadius = 20.0;
    self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);

    sublayer =[CALayer layer];
    sublayer.backgroundColor =[UIColor blueColor].CGColor;
    sublayer.shadowOffset = CGSizeMake(0, 3);
    sublayer.shadowRadius =5.0;
    sublayer.shadowColor =[UIColor blackColor].CGColor;
    sublayer.shadowOpacity =0.8;
    sublayer.frame = CGRectMake(30, 30, 128, 192);
    sublayer.borderColor =[UIColor blackColor].CGColor;
    sublayer.borderWidth =2.0;
    sublayer.cornerRadius =10.0;
    [self.view.layer addSublayer:sublayer];
    
    imageLayer =[CALayer layer];
    imageLayer.frame = sublayer.bounds;
    imageLayer.cornerRadius =10.0;
    imageLayer.contents =(id)[UIImage imageNamed:@"butterfly.jpg"].CGImage;
    imageLayer.masksToBounds =YES;
    [sublayer addSublayer:imageLayer];
    // Do any additional setup after loading the view from its nib.
    //add a jpg dym
    UIImage *myImage1 = [UIImage imageNamed:@"antelope.jpg"];
    UIImage *myImage2 = [UIImage imageNamed:@"bat.jpg"];
    UIImage *myImage3 = [UIImage imageNamed:@"bear.jpg"];
    UIImage *myImage4 = [UIImage imageNamed:@"bee.jpg"];
    UIImage *myImage5 = [UIImage imageNamed:@"butterfly.jpg"];
    UIImage *myImage6 = [UIImage imageNamed:@"camel.jpg"];
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 250, 100, 100)];
    myImageView.animationImages = [NSArray arrayWithObjects:myImage1,myImage2,myImage3,myImage4,myImage5,myImage6, nil];
    myImageView.animationDuration = 8;//指定动画循环的间隔时间
   // myImageView.animationRepeatCount = 2; //指定动画循环的次数  循环结束后 图片消失
    [myImageView startAnimating];//开启动画
  // [myImageView stopAnimating];//关闭动画  可根据具体情况选择何时开始和何时结束动画
    [self.view addSubview:myImageView];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject]; 
    CGPoint point = [touch locationInView:self.view];
    [imageLayer setPosition:point];
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    [trackPath moveToPoint:point];
  //  [trackPath moveToPoint:P(160, 25)];
    [trackPath addCurveToPoint:point controlPoint1:point controlPoint2:point];
//    imageLayer = UIImageView_WordA.layer;                       
    imageLayer.bounds = CGRectMake(0, 0, 200, 100);      
    [imageLayer setPosition:point];
   // imageLayer.position = P(160, 25);
    [sublayer addSublayer:imageLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = trackPath.CGPath;
    //animation.rotationMode = kCAAnimationRotateAutoReverse;
    animation.repeatCount = HUGE_VALF;
    animation.duration = 10.0;
    [imageLayer addAnimation:animation forKey:@"move"];

//    float x = imageLayer.frame.origin.x;
//    float y = imageLayer.frame.origin.y;
//    float imageX = sublayerImage.frame.origin.x;
//    float imageY = sublayerImage.frame.origin.y;
    float pointX = point.x;
    float pointY = point.y;
    //    float newX = pointX + imageLayer.frame.origin.x;
    //    float newY = pointY + imageLayer.frame.origin.y;
    //    if (newX < 0 ) {
    //        newX = 0;
    //    }else if(newX > 320){
    //        newX = 320;
    //    }
    //    if (newY < 0 ) {
    //        newY = 0;
    //    }else if(newY > 416){
    //        newY = 416;
    //    }
    //    imageLayer.position = CGPointMake(newX, newY);
    // NSLog(@"x:%f y:%f",x,y);
    // NSLog(@"imagex:%f   imagey:%f",imageX,imageY);
    if (pointX > sublayer.position.x - sublayer.frame.size.width / 2 && pointX < sublayer.position.x +sublayer.frame.size.width / 2 && pointY > sublayer.position.y - sublayer.frame.size.height / 2 && pointY < sublayer.position.y +sublayer.frame.size.height / 2) {
        //  NSLog(@"movetocerectloacation");
        // imageLayer.position = sublayer.position;
         imageLayer.frame = CGRectMake(0, 0, sublayer.frame.size.width, sublayer.frame.size.height);
        //imageLayer.frame = sublayer.bounds;
        imageLayer.masksToBounds =YES;
        
        // NSLog(@"sublayerimage:%f",sublayerImage.position.x);
        // NSLog(@"iamgelayer:%f",imageLayer.position.x);
    }
    //    if (x>imageX && x<imageX + sublayerImage.frame.size.width && y < imageY + sublayerImage.frame.size.height && y> imageY) {
    //    }

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject]; 
    CGPoint point = [touch locationInView:self.view];
    float pointX = point.x;
    float pointY = point.y;
    if (pointX > sublayer.position.x - sublayer.frame.size.width / 2 && pointX < sublayer.position.x +sublayer.frame.size.width / 2 && pointY > sublayer.position.y - sublayer.frame.size.height / 2 && pointY < sublayer.position.y +sublayer.frame.size.height / 2) {
        imageLayer.frame = CGRectMake(0, 0, sublayer.frame.size.width, sublayer.frame.size.height);
        imageLayer.masksToBounds =YES;
    }

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
