//
//  RatingView.m
//  Navigation
//
//  Created by Mac Pro on 12/2/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView
@synthesize start1,start2,start3,start4,start5;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        start1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        start2 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 30, 30)];
        start3 = [[UIImageView alloc]initWithFrame:CGRectMake(60, 0, 30, 30)];
        start4 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 0, 30, 30)];
        start5 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 0, 30, 30)];
        [self addSubview:start1];
        [self addSubview:start2];
        [self addSubview:start3];
        [self addSubview:start4];
        [self addSubview:start5];

    }
    return self;
}
-(void)setImageFullSelect:(NSString *)fullSelect UnSelect:(NSString *)unSelect ForRating:(NSInteger)rating{
    switch (rating) {
        case 0:
            start1.image = [UIImage imageNamed:unSelect];
            start2.image = [UIImage imageNamed:unSelect];
            start3.image = [UIImage imageNamed:unSelect];
            start4.image = [UIImage imageNamed:unSelect];
            start5.image = [UIImage imageNamed:unSelect];
            break;
        case 1:
            start1.image = [UIImage imageNamed:fullSelect];
            start2.image = [UIImage imageNamed:unSelect];
            start3.image = [UIImage imageNamed:unSelect];
            start4.image = [UIImage imageNamed:unSelect];
            start5.image = [UIImage imageNamed:unSelect];
            break;
        case 2:
            start1.image = [UIImage imageNamed:fullSelect];
            start2.image = [UIImage imageNamed:fullSelect];
            start3.image = [UIImage imageNamed:unSelect];
            start4.image = [UIImage imageNamed:unSelect];
            start5.image = [UIImage imageNamed:unSelect];
            break;
        case 3:
            start1.image = [UIImage imageNamed:fullSelect];
            start2.image = [UIImage imageNamed:fullSelect];
            start3.image = [UIImage imageNamed:fullSelect];
            start4.image = [UIImage imageNamed:unSelect];
            start5.image = [UIImage imageNamed:unSelect];
            break;
        case 4:
            start1.image = [UIImage imageNamed:fullSelect];
            start2.image = [UIImage imageNamed:fullSelect];
            start3.image = [UIImage imageNamed:fullSelect];
            start4.image = [UIImage imageNamed:fullSelect];
            start5.image = [UIImage imageNamed:unSelect];
            break;
        case 5:
            start1.image = [UIImage imageNamed:fullSelect];
            start2.image = [UIImage imageNamed:fullSelect];
            start3.image = [UIImage imageNamed:fullSelect];
            start4.image = [UIImage imageNamed:fullSelect];
            start5.image = [UIImage imageNamed:fullSelect];
            break;
            
        default:
            break;
    }
}

-(void) touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event
{
	[self touchesMoved:touches withEvent:event];
}

-(void) touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
   // NSLog(@"x:%f  y:%f",pt.x,pt.y);
	int newRating = (int) (pt.x / 30) + 1;
	if (newRating < 1 || newRating > 5)
		return;
	
	//if (newRating != lastRating)
		[self setImageFullSelect:@"2.png" UnSelect:@"0.png" ForRating:newRating];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[self touchesMoved:touches withEvent:event];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
