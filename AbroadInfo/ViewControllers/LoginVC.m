//
//  LoginVC.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/26/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "LoginVC.h"
#import "SigninVC.h"
#import <Parse/Parse.h>
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cleartextfieldsAfterlogOut) name:@"logoutNotification" object:nil];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (IBAction)tapOnView:(UITapGestureRecognizer *)sender {
    [self hidkeyboard];
}
-(void)hidkeyboard{
    [self.usernametxtfield resignFirstResponder];
    [self.passwordtxtfield resignFirstResponder];
    
}
- (IBAction)loginBtntapped:(id)sender {
    [self hidkeyboard];
    
    if ([[self.usernametxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [[self.passwordtxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 )
    {
        UIAlertView *emptyAlert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Please fill all the fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [emptyAlert show];
    }
    else{
        
        [self Login];
        /*
         if ([Helper validateEmail:self.usernameTxtfield.text])
         {
         [self Login];
         
         }
         else{
         
         UIAlertView *emptyAlert=[[UIAlertView alloc]initWithTitle:@"Error!" message:@"Please enter correct email address." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
         [emptyAlert show];
         }
         */
        
    }
    
}

- (IBAction)signinBtntapped:(id)sender {

    SigninVC *signinVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"signinVC"];
    [self.navigationController presentViewController:signinVC animated:YES completion:nil];
}

-(void)Login{
    
    [PFUser logInWithUsernameInBackground:self.usernametxtfield.text password:self.passwordtxtfield.text block:^(PFUser *user, NSError *error)
     
     {
         if (!error) {
              NSLog(@"user detail:%@",user);
              NSLog(@"objectId:%@",user.objectId);
            
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             UITabBarController *obj=[storyboard instantiateViewControllerWithIdentifier:@"tabbar"];
             self.navigationController.navigationBarHidden=YES;
             [self.navigationController presentViewController:obj animated:YES completion:nil];
             
         }
         else{
            
             UIAlertView *loginErrorAlert=[[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Dissmiss" otherButtonTitles:nil, nil];
             [loginErrorAlert show];
             
         }
         
     }];
}

-(void)cleartextfieldsAfterlogOut{
    self.usernametxtfield.text=@"";
    self.passwordtxtfield.text=@"";
    
}
@end
