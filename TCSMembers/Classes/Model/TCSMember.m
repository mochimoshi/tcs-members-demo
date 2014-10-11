//
//  TCSMember.m
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import "TCSMember.h"

@implementation TCSMember

- (instancetype) initWithName:(NSString *)name role:(NSString *)role email:(NSString *)email year:(NSInteger)year image:(NSURL *)image isUndergrad:(BOOL)isUndergrad
{
    self = [super init];
    if(self) {
        self.memberName = name;
        self.memberRole = role;
        self.memberEmail = email;
        self.memberYear = year;
        self.memberImage = image;
        self.isUndergrad = isUndergrad;
    }
    return self;
}

@end
