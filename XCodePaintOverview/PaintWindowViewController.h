//
//  PaintWindowViewController.h
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PaintWindowViewController : NSWindowController

- (instancetype)initWithWindowNibName:(NSString *)windowNibName andImage:(NSImage*)windowImage;
- (void)setCaptureImage:(NSImage*)image;
- (void)resetPaintOverlay;

@end
