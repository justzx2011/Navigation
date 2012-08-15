//
//  PicView.m
//  Navigation
//
//  Created by Mac Pro on 12/1/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "PicView.h"
#import "ImagePickerController.h"
@implementation PicView
@synthesize picView;
@synthesize myImagePicker;
@synthesize imageView;
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
    imageView = [[UIImageView alloc]init];
  //  [self drawRect:[[UIScreen mainScreen]bounds]];
//    picView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
//    [self.view addSubview:picView];
  //  [self.view drawRect:CGRectMake(0, 0, 320, 460)];
    //add a jpg dym

    // Do any additional setup after loading the view from its nib.
}
//- (void)drawRect:(CGRect)rect{
//    NSLog(@"drawrect");
//    UIImage *myImage1 = [UIImage imageNamed:@"antelope.jpg"];
//    UIImage *myImage2 = [UIImage imageNamed:@"bat.jpg"];
//    UIImage *myImage3 = [UIImage imageNamed:@"bear.jpg"];
//  //  UIImage *myImage4 = [UIImage imageNamed:@"bee.jpg"];
//  //  UIImage *myImage5 = [UIImage imageNamed:@"butterfly.jpg"];
//    [myImage1 drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeNormal alpha:0.5];
//    [myImage2 drawInRect:CGRectMake(10, 10, 140, 210)];
//    [myImage3 drawInRect:CGRectMake(170, 240, 140, 210)];// blendMode:kCGBlendModeNormal alpha:0.5];
//   // [myImage4 drawInRect:CGRectMake(300, 400, 20, 60)];
//
//}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)gotoImagePickerController:(id)sender {
    ImagePickerController *imagePicker = [[ImagePickerController alloc]initWithNibName:@"ImagePickerController" bundle:nil];
    [self.navigationController pushViewController:imagePicker animated:YES];

}

- (IBAction)openPhotos:(id)sender {
    myImagePicker = [[UIImagePickerController alloc]init];
    myImagePicker.delegate = self;
    //[myImagePicker setDelegate:self];
    myImagePicker.allowsEditing = NO;
    [self presentModalViewController:myImagePicker animated:YES];
    //ipad code
//    UIPopoverController *popover = [[UIPopoverController alloc]initWithContentViewController:myImagePicker];
//    [popover presentPopoverFromRect:CGRectMake(0, 0, 320, 480) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissModalViewControllerAnimated:YES];
    UIImage *image= [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    imageView .image = image;
    float percentage = [self scaleImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width *percentage, image.size.height*percentage);
    [self.view addSubview:imageView];
    
}
- (float)scaleImage:(UIImage *)image{
    float toSize = 1.0;
    if (image.size.width *toSize > 320) {
        toSize = 320 / image.size.width;
    }
    if (image.size.height *toSize > 460) {
        toSize = 460 / image.size.height;
    }
    return toSize;
}

- (IBAction)takePic:(id)sender {
    UIImagePickerController *myImagePicer = [[UIImagePickerController alloc]init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        myImagePicer.sourceType = UIImagePickerControllerSourceTypeCamera;
        myImagePicer.delegate = self;
        myImagePicer.allowsEditing = YES;
        [self presentModalViewController:myImagePicer animated:YES];//show the camera
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Camera not supported!" delegate:self cancelButtonTitle:@"Ok！" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
