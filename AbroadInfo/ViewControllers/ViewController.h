//
//  ViewController.h
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/25/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI.h>

@class QuestionsCell;
@interface ViewController : UIViewController<PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *questionstblVC;
@property(nonatomic,strong) NSMutableArray *questionsArray;
@property (weak, nonatomic) IBOutlet QuestionsCell *questionsCell;
@property(nonatomic,strong) IBOutlet UIRefreshControl *refreshControl;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end

