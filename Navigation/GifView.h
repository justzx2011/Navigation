//
//  GifView.h
//  GIFViewer
//
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GifView : UIButton {
	CGImageSourceRef gif;
	NSDictionary *gifProperties;
	size_t index;
	size_t count;
	NSTimer *timer;
}
- (id)initWithFrame:(CGRect)frame filePath:(NSString *)_filePath;
@end
