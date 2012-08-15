//
//  PicView.h
//  Navigation
//
//  Created by Mac Pro on 12/1/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PicView : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
}
@property (nonatomic,strong) UIView *picView;
//- (void)drawRect:(CGRect)rect;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImagePickerController *myImagePicker;
- (IBAction)gotoImagePickerController:(id)sender;
- (IBAction)openPhotos:(id)sender;
- (float)scaleImage:(UIImage *)image;
- (IBAction)takePic:(id)sender;

@end
