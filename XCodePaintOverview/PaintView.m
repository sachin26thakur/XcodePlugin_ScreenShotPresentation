


#import "PaintView.h"
#import "Canvas.h"
#import "Brush.h"

@implementation PaintView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Create both the canvas and the brush. Create the canvas
		//	the same size as our initial size. Note that the canvas will not
		//	resize along with us.
		canvas = [[Canvas alloc] initWithSize:frame.size];
		brush = [[Brush alloc] init];
    }
    return self;
}

- (void) dealloc
{
	// Clean up our canvas and brush, since we own them
}

- (void)drawRect:(NSRect)rect {

	// Simply ask the canvas to draw into the current context, given the
	//	rectangle specified. A more sophisticated view might draw a border
	//	around the canvas, or a pasteboard in the case that the view was
	//	bigger than the canvas.
	NSGraphicsContext* context = [NSGraphicsContext currentContext];
	
	[canvas drawRect:rect inContext:context];
}


- (void)resetPaintCanvas{
    canvas = [[Canvas alloc] initWithSize:self.frame.size];
    brush = [[Brush alloc] init];
    [self setNeedsDisplay:YES];
}


- (void)mouseDown:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.
	[brush mouseDown:theEvent inView:self onCanvas:canvas];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.	
	[brush mouseDragged:theEvent inView:self onCanvas:canvas];
}

- (void)mouseUp:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.	
	[brush mouseUp:theEvent inView:self onCanvas:canvas];
}

@end
