//
//  ProfileVC.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/26/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "ProfileVC.h"
#import <Parse/Parse.h> // step 4 : import parse as we need parse log out in profile view

@interface ProfileVC ()

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//step 5: When user click log out show conformation, if conformed, log out.

- (IBAction)LogOut:(id)sender {
    
    UIAlertView *logout=[[UIAlertView alloc]initWithTitle:@"Log Out" message:@"Do you want to log out?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [logout show];

}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"logoutNotification"
                                                  object:nil];
  
}

#pragma mark--alertview delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        
        //step 6: parse log out call method to log out current user.
        [PFUser logOut];
        
        if (![PFUser currentUser]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"logoutNotification" object:nil userInfo:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
  
    }
    }
}
@end
