//
//  SecondViewController.h
//  Navigation
//
//  Created by Mac Pro on 11/3/11.
//  Copyright (c) 2011 Intechno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textview;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)gotoCALayerTest:(id)sender;
- (IBAction)zhendong:(id)sender;

@end
