//
//  NSWindow+WindowCapture.h
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWindow (WindowCapture)
- (NSImage *)windowImage;
- (CGImageRef)windowImageShot;
@end
