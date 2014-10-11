//
//  TCSMembersListViewController.m
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import "TCSMembersListViewController.h"

#import "TCSMember.h"
#import "TCSMemberDetailViewController.h"
#import "TCSNetworkingService.h"

@interface TCSMembersListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *members;

@end

@implementation TCSMembersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TCSNetworkingService *sharedService = [TCSNetworkingService sharedNetworkingService];
    self.members = [[NSMutableArray alloc] init];
    [sharedService getMembersWithSuccess:^(id responseObject) {
        NSDictionary *results = responseObject;
        NSArray *students = [results objectForKey:@"students"];
        for (NSDictionary *student in students) {
            TCSMember *member = [[TCSMember alloc] initWithName:[student objectForKey:@"name"]
                                                           role:[student objectForKey:@"role"]
                                                          email:[student objectForKey:@"email"]
                                                           year:[[student objectForKey:@"year"] integerValue]
                                                          image:[NSURL URLWithString:[student objectForKey:@"image"]]
                                                    isUndergrad:[[student objectForKey:@"is_undergrad"] boolValue]];
            [self.members addObject:member];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                        message:[NSString stringWithFormat:@"Problem found: %@", error.localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.members count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"memberCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    TCSMember *member = [self.members objectAtIndex:indexPath.row];
    [cell.textLabel setText:member.memberName];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TCSMemberDetailViewController *detailViewController = segue.destinationViewController;
    TCSMember *member = [self.members objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    [detailViewController setMemberName:member.memberName];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

@end
