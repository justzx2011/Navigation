//
//  UIProgressHUD.h
//  Navigation
//
//  Created by Mac Pro on 12/2/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIProgressHUD : NSObject
- (void) show: (BOOL) yesOrNo;
- (UIProgressHUD *) initWithWindow: (UIView *) window;

@end
