//
//  AppDelegate.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/12/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTCoreService;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) LTCoreService *coreService;

@end

