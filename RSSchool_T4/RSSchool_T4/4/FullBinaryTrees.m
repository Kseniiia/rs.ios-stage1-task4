#import "FullBinaryTrees.h"
#import "TreeNode.h"

@implementation FullBinaryTrees

- (NSMutableArray *)generateTrees:(NSInteger)n {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if (n == 1) {
        TreeNode *node = [[TreeNode alloc] init];
        [result addObject:node];
        return result;
    }
    
    for (int i = 1; i < n - 1; i += 2) {
        NSMutableArray *leftSubTrees = [self generateTrees:i];
        NSMutableArray *rightSubTrees = [self generateTrees:n - 1 - i];
        for (int j = 0; j < [leftSubTrees count]; j++) {
            for (int k = 0; k < [rightSubTrees count]; k++) {
                TreeNode *node = [[TreeNode alloc] init];
                node.left = leftSubTrees[j];
                node.right = rightSubTrees[k];
                [result addObject:node];
            }
        }
    }
    
    return result;
}

- (NSMutableArray *)arrayForTree:(TreeNode *)root {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSInteger i = 0;
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:root];
    [result addObject:@"0"];
    while ([queue count] != 0) {
        i++;
        TreeNode *node = [queue firstObject];
        [queue removeObjectAtIndex:0];
        if (node.left) {
            [queue addObject:node.left];
            [result addObject:@"0"];
        } else {
            [result addObject:@"null"];
        }
        if (node.right) {
            [queue addObject:node.right];
            [result addObject:@"0"];
        } else {
            [result addObject:@"null"];
        }
    }
    
    while ([[result lastObject] isEqualToString:@"null"]) {
        [result removeLastObject];
    }
    
    return result;
}

- (NSString *)stringForArray:(NSArray *)array {
    NSMutableString *string = [[NSMutableString alloc] init];
    
    [string appendString:@"["];
    [string appendString:[array componentsJoinedByString:@","]];
    [string appendString:@"]"];
    
    return string;
}

- (NSString *)stringForNodeCount:(NSInteger)count {
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    
    if (count % 2 != 0) {
        NSMutableArray *trees = [self generateTrees:count];
        for (int i = 0; i < [trees count]; i++) {
            NSMutableArray *array = [self arrayForTree:trees[i]];
            
            [strings addObject:[self stringForArray:array]];
        }
    }
    
    return [self stringForArray:strings];
}

@end
