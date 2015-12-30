//
//  AppDelegate.h
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/25/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate,UINavigationControllerDelegate>



@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong) IBOutlet UINavigationController *nav;
@property(nonatomic,strong) IBOutlet UITabBarController *tabbar;


@end

