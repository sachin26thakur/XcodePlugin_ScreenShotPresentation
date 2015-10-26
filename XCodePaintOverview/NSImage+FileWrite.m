//
//  NSImage+FileWrite.m
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import "NSImage+FileWrite.h"

@implementation NSImage (FileWrite)

- (void) saveAsJpegWithName:(NSString*) fileName
{
    // Cache the reduced image
    NSData *imageData = [self TIFFRepresentation];
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imageData];
    NSDictionary *imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.0] forKey:NSImageCompressionFactor];
    imageData = [imageRep representationUsingType:NSJPEGFileType properties:imageProps];
    [imageData writeToFile:fileName atomically:NO];
}

@end
