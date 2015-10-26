//
//  NSWindow+WindowCapture.m
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import "NSWindow+WindowCapture.h"

@implementation NSWindow (WindowCapture)
- (NSImage *)windowImage
{
    NSImage * image = [[NSImage alloc] initWithCGImage:[self windowImageShot] size:[self frame].size];
    NSLog(@"frame %@",NSStringFromRect([self frame]));
    [image setCacheMode:NSImageCacheNever];
    return image;
}


- (CGImageRef)windowImageShot
{
    CGWindowID windowID = (CGWindowID)[self windowNumber];
    CGWindowImageOption imageOptions = kCGWindowImageBoundsIgnoreFraming;
    CGWindowListOption singleWindowListOptions = kCGWindowListOptionIncludingWindow;
    CGRect imageBounds = CGRectNull;
    
    CGImageRef windowImage = CGWindowListCreateImage(imageBounds, singleWindowListOptions, windowID, imageOptions);
    
    return (CGImageRef)windowImage;
}

@end
