//
//  PlantFlowers.m
//  Navigation
//
//  Created by Mac Pro on 12/12/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "PlantFlowers.h"
#import "GifView.h"
@implementation PlantFlowers

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
    // Do any additional setup after loading the view from its nib.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self.view];

    GifView *flower = [[GifView alloc] initWithFrame:CGRectMake(pt.x, pt.y, 40, 40) filePath:[[NSBundle mainBundle] pathForResource:@"flower16" ofType:@"gif"]];
    [self.view addSubview:flower];
    [self.view bringSubviewToFront:flower];
//    UIImage *myImage1 = [UIImage imageNamed:@"antelope.jpg"];
//    UIImage *myImage2 = [UIImage imageNamed:@"bat.jpg"];
//    UIImage *myImage3 = [UIImage imageNamed:@"bear.jpg"];
//    UIImage *myImage4 = [UIImage imageNamed:@"bee.jpg"];
//    UIImage *myImage5 = [UIImage imageNamed:@"butterfly.jpg"];
//    UIImage *myImage6 = [UIImage imageNamed:@"camel.jpg"];
//    myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(pt.x, pt.y, 50, 50)];
//    myImageView.animationImages = [NSArray arrayWithObjects:myImage1,myImage2,myImage3,myImage4,myImage5,myImage6, nil];
//    myImageView.animationDuration = 8;//指定动画循环的间隔时间
//  //  myImageView.animationRepeatCount = 1; //指定动画循环的次数  循环结束后 图片消失
//    [myImageView startAnimating];//开启动画
//    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(stopImage) userInfo:nil repeats:NO];
// //    [myImageView stopAnimating];//关闭动画  可根据具体情况选择何时开始和何时结束动画
//    [self.view addSubview:myImageView];
//    myImageView.image = myImage6;

}
-(void)stopImage
{
    [myImageView stopAnimating];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
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
