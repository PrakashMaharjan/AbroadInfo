//
//  SigninVC.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/28/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "SigninVC.h"
#import <Parse/Parse.h>
@interface SigninVC ()

@end

@implementation SigninVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerUser:(id)sender {

    PFUser *newUser = [PFUser user];
    newUser.username = self.usernametxtField.text;
    newUser.password = self.passwordtxtField.text;
    newUser.email =self.emailtxtField.text;
    //newUser setObject:<#(nonnull id)#> forKey:<#(nonnull NSString *)#>
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (error) {
            UIAlertView *signUpErrorAlert=[[UIAlertView alloc]initWithTitle:@"Error!" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Dissmiss" otherButtonTitles:nil, nil];
            [signUpErrorAlert show];
        }
        else{
            UIAlertView *signUpSuccessAlert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Congratulation! You have been registered. Sign in to continue." delegate:nil cancelButtonTitle:@"Sign In" otherButtonTitles:nil, nil];
            [signUpSuccessAlert show];
            [self dismissViewControllerAnimated:YES completion:nil];
            self.usernametxtField.text=@"";
            self.passwordtxtField.text=@"";
            self.emailtxtField.text=@"";
        }
        
    }];
    
}
@end
