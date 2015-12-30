//
//  PostVC.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 11/27/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "PostVC.h"
#import <Parse/Parse.h>
@interface PostVC ()

@end

@implementation PostVC

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

- (IBAction)PostQuestion:(id)sender {
    
    if ([[self.questionTxtView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length]==0)
    {
        UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please type a question." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [Alert show];
        
    }
    else{
        [self post];
    }
}
-(void)post{
    // Create PFObject for posting question
    //need to handle later..i.e to get user info..
    //use own account info for post feature test for now..
    PFObject *postQuestion = [PFObject objectWithClassName:@"Questions_Post"];
    [postQuestion setObject:self.questionTxtView.text forKey:@"question"];
    [postQuestion setObject:@"USA" forKey:@"tag"];
    [postQuestion setObject:@"0" forKey:@"vote_count"];
    [postQuestion setObject:@"SzhSHkPuIS" forKey:@"user_id"];
    [postQuestion setObject:@"prakashmaharjan20@gmail.com" forKey:@"user_email"];
    [postQuestion setObject:@"prakash" forKey:@"user_name"];
    
    
    /*
     // for image we will use later
     NSData *imageData = UIImageJPEGRepresentation(_recipeImageView.image, 0.8);
     NSString *filename = [NSString stringWithFormat:@"%@.png", _nameTextField.text];
     PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
     [recipe setObject:imageFile forKey:@"imageFile"];
     
     // Show progress
     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     hud.mode = MBProgressHUDModeIndeterminate;
     hud.labelText = @"Uploading";
     [hud show:YES];
     */
    // Upload question to Parse
    [postQuestion saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        //[hud hide:YES];
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the recipe" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            // Notify table view to reload the question from Parse cloud
            [[NSNotificationCenter defaultCenter]postNotificationName:@"refreshQuestionTable" object:nil userInfo:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];
    
}
- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    [self.questionTxtView resignFirstResponder];
}
@end
