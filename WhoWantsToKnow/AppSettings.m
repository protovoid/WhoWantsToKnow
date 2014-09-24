//
//  AppSettings.m
//  WhoWantsToKnow
//
//  Created by Chad on 9/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AppSettings.h"

@implementation AppSettings


+ (AppSettings *)sharedInstance {
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppSettings alloc] init];
        
        [sharedInstance registerForNotifications]; // runs once
        // [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToViewAppeared) name:@"viewAppeared" object:nil];
}


- (void)unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"viewAppeared" object:nil];
}

- (void)respondToViewAppeared {
    NSLog(@"View appeared");
}

@end
