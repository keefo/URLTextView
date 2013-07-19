//
//  AppDelegate.h
//  UrlTextView
//
//  Created by Xu Lian on 2013-07-19.
//  Copyright (c) 2013 Beyondcow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSDataDetector *dataDetector;
}
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *textView;

@end
