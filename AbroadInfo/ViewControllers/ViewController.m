//
//  ViewController.m
//  AbroadInfo
//
//  Created by prakash Maharjan on 10/25/15.
//  Copyright © 2015 Game Studios. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <ParseUI.h>
#import "QuestionsCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh:) name:@"refreshQuestionTable" object:nil];
    [self loadQuestionsList];
    self.refreshControl=[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(refreshtableView) forControlEvents:UIControlEventValueChanged];
    [self.questionstblVC addSubview:self.refreshControl];
    
}

- (void)refresh:(NSNotification*)notification
{
    [self refreshtableView];
}

-(void)loadQuestionsList{
    
    [self.loadingIndicator startAnimating];
    [self.loadingIndicator setHidden:NO];

    PFQuery *query = [PFQuery queryWithClassName:@"Questions_Post"];
    [query orderByDescending:@"createdAt"];
    //[query orderByAscending:@"score"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         NSLog(@"Data:%@",objects);
         if (!error) {
             //[self.dataArray addObjectsFromArray:objects];
             self.questionsArray=[[NSMutableArray alloc]initWithArray:objects];
             NSLog(@"data array:%@",self.questionsArray);
             [self.questionstblVC reloadData];
             if ([self.loadingIndicator isAnimating]) {
                 [self.loadingIndicator stopAnimating];
                 [self.loadingIndicator setHidden:YES];
             }
             if ([self.refreshControl isRefreshing]) {
                 [self.refreshControl endRefreshing];
             }
         }
         else{
             if ([self.refreshControl isRefreshing]) {
                 [self.refreshControl endRefreshing];
             }
             if ([self.loadingIndicator isAnimating]) {
                 [self.loadingIndicator stopAnimating];
                 [self.loadingIndicator setHidden:YES];
             }
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error!" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Dissmiss" otherButtonTitles:nil, nil];
             [alert show];
         }
         
     }];
    
}


-(void)refreshtableView{
    [self loadQuestionsList];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 -(void)viewDidAppear:(BOOL)animated{
 
 if (![PFUser currentUser]) { // No user logged in
 // Create the log in view controller
 PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
 [logInViewController setDelegate:self]; // Set ourselves as the delegate
 
 // Create the sign up view controller
 PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
 [signUpViewController setDelegate:self]; // Set ourselves as the delegate
 
 // Assign our sign up controller to be displayed from the login controller
 [logInViewController setSignUpController:signUpViewController];
 
 // Present the log in view controller
 [self presentViewController:logInViewController animated:YES completion:NULL];
 }
 
 }
 */
//step 3
//copy the require table view delegates code..
#pragma Mark - UITableView Delegates

//step 8
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  160.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //step 6 : returning the no. of rows i.e the array count
    return self.questionsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *questionsTableIdentifier = @"questionsTableCell";
    
    
    self.questionsCell = (QuestionsCell *)[self.questionstblVC dequeueReusableCellWithIdentifier:questionsTableIdentifier];
    
    self.questionsCell.questionLbl.text=[NSString stringWithFormat:@"%@",[[self.questionsArray objectAtIndex:indexPath.row] objectForKey:@"question"]];
    self.questionsCell.voteCountLbl.text=[NSString stringWithFormat:@"Votes: %@",[[self.questionsArray objectAtIndex:indexPath.row] objectForKey:@"vote_count"]];
    
    return self.questionsCell;
}

@end
