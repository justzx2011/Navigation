//
//  RatingView.h
//  Navigation
//
//  Created by Mac Pro on 12/2/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RatingView : UIView
@property (nonatomic, strong) UIImageView *start1;
@property (nonatomic, strong) UIImageView *start2;
@property (nonatomic, strong) UIImageView *start3;
@property (nonatomic, strong) UIImageView *start4;
@property (nonatomic, strong) UIImageView *start5;

-(void)setImageFullSelect:(NSString *)fullSelect UnSelect:(NSString *)unSelect ForRating:(NSInteger)rating;

@end
