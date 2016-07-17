//
//  AppDelegate.h
//  bills
//
//  Created by Rodrigo Esquivel on 14-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *welcomeViewController;
@property (nonatomic, strong) UINavigationController* navController;

@end

