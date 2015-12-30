//
//  LoginVC.h
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/26/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernametxtfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordtxtfield;


- (IBAction)tapOnView:(UITapGestureRecognizer *)sender;
- (IBAction)loginBtntapped:(id)sender;
- (IBAction)signinBtntapped:(id)sender;

@end
