//
//  PostVC.h
//  AbroadInfo
//
//  Created by prakash Maharjan on 11/27/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *questionTxtView;

- (IBAction)PostQuestion:(id)sender;
- (IBAction)tapView:(UITapGestureRecognizer *)sender;
@end
