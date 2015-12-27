//
//  AppDelegate.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/25/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse enableLocalDatastore];
    
    
    //step 1:
    // Initialize Parse.
    [Parse setApplicationId:@"6LuHFMhoYmSddw9bOwiXhwJE5vIr8YsxrfUskqLi"
                  clientKey:@"pa7RQ62Wve2naBp2ZsbGqEDAik3aHYYyo7OFd7Qf"];
    
    // [Optional] Track statistics around application opens.
   // [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
 
    
    // if user is logged in, load tab bar else load login in view
    if ([PFUser currentUser]){

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.tabbar=[storyboard instantiateViewControllerWithIdentifier:@"tabbar"];
        self.window.rootViewController=self.tabbar;
        
    }else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.nav=[storyboard instantiateViewControllerWithIdentifier:@"nabbar"];
        self.window.rootViewController=self.nav;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
