//
//  ImagePickerController.h
//  Navigation
//
//  Created by Mac Pro on 12/1/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"
@interface ImagePickerController : UIViewController<UIImagePickerControllerDelegate>
@property (nonatomic, strong) RatingView *ratingView;
@end
