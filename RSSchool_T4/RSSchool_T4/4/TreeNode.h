//
//  TreeNode.h
//  RSSchool_T4
//
//  Created by Ksusha Malchikova on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (nonatomic, weak) TreeNode *left;
@property (nonatomic, weak) TreeNode *right;
 
- (id)init;

@end

NS_ASSUME_NONNULL_END
