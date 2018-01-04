//
//  BaseViewController.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/15/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTCoreService;

@interface BaseViewController : UIViewController

@property (nonatomic, strong) LTCoreService *coreSerVervice;

@end
