//
//  NSImage+FileWrite.h
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (FileWrite)

- (void) saveAsJpegWithName:(NSString*) fileName;
@end
