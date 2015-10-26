//
//  XCodePaintOverview.h
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import <AppKit/AppKit.h>

@class XCodePaintOverview;

static XCodePaintOverview *sharedPlugin;

@interface XCodePaintOverview : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end