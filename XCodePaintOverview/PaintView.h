

#import <Cocoa/Cocoa.h>

@class Canvas;
@class Brush;

@interface PaintView : NSView {
	// The canvas we will render to the screen
	Canvas		*canvas;
	// The brush that we will pass events to
	Brush		*brush;
}

- (void)resetPaintCanvas;



@end
