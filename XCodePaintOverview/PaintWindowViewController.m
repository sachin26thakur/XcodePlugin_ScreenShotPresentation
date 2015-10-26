//
//  PaintWindowViewController.m
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import "PaintWindowViewController.h"
#import "NSWindow+WindowCapture.h"
#import "NSImage+FileWrite.h"
#import "PaintView.h"



@interface PaintWindowViewController ()
@property (weak) IBOutlet NSImageView *imageView;
@property (nonatomic,strong) NSImage *windowImage;
@property (weak) IBOutlet PaintView *canvas;

@end





@implementation PaintWindowViewController


- (instancetype)initWithWindowNibName:(NSString *)windowNibName andImage:(NSImage*)windowImage{
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
        self.windowImage = windowImage;
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self.window setStyleMask:NSBorderlessWindowMask];
    [self.window makeKeyAndOrderFront:self];
    [self.window orderFront:self];
    [self setCaptureImage:_windowImage];
    [self.window setBackgroundColor:[NSColor redColor]];
}



- (void)setCaptureImage:(NSImage*)image{
    [self.imageView setImage:image];
    _windowImage = image;    
}

- (void)resetPaintOverlay{
    [_canvas resetPaintCanvas];
}


- (void)dealloc{
    NSLog(@"dealloc");
}


@end
