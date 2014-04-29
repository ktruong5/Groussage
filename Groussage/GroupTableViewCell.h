//
//  GroupTableViewCell.h
//  Groussage
//
//  Created by KT on 4/27/14.
//  Copyright (c) 2014 Groussage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *groupImage;
@property (strong, nonatomic) IBOutlet UILabel *groupName;

@property (strong, nonatomic) IBOutlet UILabel *groupDesc;


@end
