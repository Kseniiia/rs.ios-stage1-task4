//
//  TreeNode.m
//  RSSchool_T4
//
//  Created by Ksusha Malchikova on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (id)init {
    self = [super init];
    if (self) {
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end
