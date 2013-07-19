//
//  AppDelegate.m
//  UrlTextView
//
//  Created by Xu Lian on 2013-07-19.
//  Copyright (c) 2013 Beyondcow. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSError *error = NULL;
    dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    if (error) {
        dataDetector=nil;
    }
    [_textView setString:@"Welcome to http://maccocoa.com\nFounded by Beyondcow.com"];
    [_textView didChangeText];
}

-(void)textDidChange:(NSNotification *)notification {
    if (notification.object==_textView) {
        if (dataDetector) {
            NSString *string = [_textView.textStorage string];
            NSArray *matches = [dataDetector matchesInString:string options:0 range:NSMakeRange(0, [string length])];
            [_textView.textStorage beginEditing];
            [_textView.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [string length])];
            [_textView.textStorage removeAttribute:NSLinkAttributeName range:NSMakeRange(0, [string length])];
            for (NSTextCheckingResult *match in matches) {
                NSRange matchRange = [match range];
                if ([match resultType] == NSTextCheckingTypeLink) {
                    NSURL *url = [match URL];
                    [_textView.textStorage addAttributes:@{NSLinkAttributeName:url.absoluteString} range:matchRange];
                }
            }
            [_textView.textStorage endEditing];
        }
    }
}

@end
