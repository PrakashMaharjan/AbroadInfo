//
//  SigninVC.h
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/28/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninVC : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernametxtField;
@property (weak, nonatomic) IBOutlet UITextField *emailtxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordtxtField;

- (IBAction)dismiss:(id)sender;
- (IBAction)registerUser:(id)sender;
@end
