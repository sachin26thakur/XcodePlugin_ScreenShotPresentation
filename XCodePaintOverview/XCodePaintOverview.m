//
//  XCodePaintOverview.m
//  XCodePaintOverview
//
//  Created by Sachin on 21/10/15.
//  Copyright © 2015 Sachin. All rights reserved.
//

#import "XCodePaintOverview.h"
#import "PaintWindowViewController.h"
#import "NSWindow+WindowCapture.h"
@interface XCodePaintOverview()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@property (nonatomic,strong) PaintWindowViewController *paintWindowController;
@end

@implementation XCodePaintOverview

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    

    
    // Create menu items, initialize UI, etc.
    // Sample Menu Item:
    NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (menuItem) {
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *actionMenuItem1 = [[NSMenuItem alloc] initWithTitle:@"Start Paint" action:@selector(doStartPainting) keyEquivalent:@"8"];
        [actionMenuItem1 setKeyEquivalentModifierMask:NSCommandKeyMask | NSShiftKeyMask];
        [actionMenuItem1 setTarget:self];
        [[menuItem submenu] addItem:actionMenuItem1];
        
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *actionMenuItem2 = [[NSMenuItem alloc] initWithTitle:@"Stop Paint" action:@selector(doStopPainting) keyEquivalent:@"9"];
        [actionMenuItem2 setKeyEquivalentModifierMask:NSCommandKeyMask | NSShiftKeyMask];
        [actionMenuItem2 setTarget:self];
        [[menuItem submenu] addItem:actionMenuItem2];
        
    }
}

// Sample Action, for menu item:
- (void)doStartPainting{
    
    NSWindowController *windowController = [self workspaceForWindow:[[NSApplication sharedApplication] keyWindow]];
    
    //Prepare nsimage
    NSImage *image = [windowController.window windowImage];
    
    
    

    //show window
    if (!self.paintWindowController) {
        self.paintWindowController = [[PaintWindowViewController alloc] initWithWindowNibName:@"PaintWindowViewController" andImage:image];
        [self.paintWindowController.window setStyleMask:NSBorderlessWindowMask];
    }else{
        [self.paintWindowController resetPaintOverlay];
        [self.paintWindowController setCaptureImage:image];
    }
    [self.paintWindowController.window makeKeyAndOrderFront:self];
    [self.paintWindowController.window setOrderedIndex:0];
    
    
    
    
    [self.paintWindowController.window setFrame:windowController.window.frame display:YES];
     [self.paintWindowController.window setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces];
    [self.paintWindowController.window orderFront:self];
    [self.paintWindowController.window setLevel:NSFloatingWindowLevel];
//    [self.paintWindowController.window orderFront:nil];
    [windowController showWindow:self.paintWindowController];
    
}


- (void)doStopPainting{
    if (self.paintWindowController == nil) {
        return;
    }
    [self.paintWindowController close];
}



- (id)workspaceForWindow:(NSWindow*)window
{
    NSArray *workspaceWindowControllers = [NSClassFromString(@"IDEWorkspaceWindowController") valueForKey:@"workspaceWindowControllers"];
    
    for (id controller in workspaceWindowControllers) {
        if ([[controller valueForKey:@"window"] isEqual:window]) {
            NSLog(@"controller == %@",controller);
            return controller;
        }
    }
    return nil;
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
