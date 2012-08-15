//
//  GifView.m
//  GIFViewer
//
//

#import "GifView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GifView


- (id)initWithFrame:(CGRect)frame filePath:(NSString *)_filePath{
    
    self = [super initWithFrame:frame];
    if (self) {
//        
//		gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
//                                                    forKey:(NSString *)kCGImagePropertyGIFDictionary];
//		gif = CGImageSourceCreateWithURL((__bridge_retained CFURLRef)[NSURL fileURLWithPath:_filePath], (__bridge_retained CFDictionaryRef)gifProperties);
//		count =CGImageSourceGetCount(gif);
//		timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(play) userInfo:nil repeats:YES];
//		[timer fire];

		gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
													 forKey:(NSString *)kCGImagePropertyGIFDictionary];
		gif = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:_filePath], (__bridge CFDictionaryRef)gifProperties); //_retained
		count =CGImageSourceGetCount(gif);
		timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(play) userInfo:nil repeats:YES];
		[timer fire];
    }
    return self;
}
-(void)play
{
	index ++;
	index = index%count;
	CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (__bridge CFDictionaryRef)gifProperties);
	self.layer.contents = (__bridge_transfer id)ref;
//    index ++;
//	index = index%count;
//	CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (__bridge_retained CFDictionaryRef)gifProperties);
//	self.layer.contents = (__bridge_transfer id)ref;
   // [self.layer.contents release];
}
-(void)removeFromSuperview
{
	[timer invalidate];
	timer = nil;
	[super removeFromSuperview];
}


@end
