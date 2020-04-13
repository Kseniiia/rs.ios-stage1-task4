#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    int mult = 0;
    
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        if ([array[i] isKindOfClass:[NSNumber class]]) {
            [newArray addObject:array[i]];
        }
    }
    
    NSInteger count = [newArray count];
    if (count > 0) {
        if (numberOfItems < count) {
            NSArray *newArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
                return (abs([b intValue]) - abs([a intValue]));
            }];
            
            mult = 1;
            for (int i = 0; i < numberOfItems; i++) {
                mult = mult * [[newArray objectAtIndex:i] intValue];
            }
            
            if (mult < 0) {
                int lastNegative = 0;
                int lastPositive = 0;
                
                for (NSInteger i = numberOfItems - 1; i >= 0; i--) {
                    int value = [[newArray objectAtIndex:i] intValue];
                    if (value < 0 && lastNegative == 0) {
                        lastNegative = value;
                    }
                    if (value > 0 && lastPositive == 0) {
                        lastPositive = value;
                    }
                    if (lastNegative != 0 && lastPositive != 0) {
                        break;
                    }
                }
                
                int nextNegative = 0;
                int nextPositive = 0;
                
                for (NSInteger i = numberOfItems; i < count; i++) {
                    int value = [[newArray objectAtIndex:i] intValue];
                    if (value < 0 && nextNegative == 0) {
                        nextNegative = value;
                    }
                    if (value > 0 && nextPositive == 0) {
                        nextPositive = value;
                    }
                    if (nextNegative != 0 && nextPositive != 0) {
                        break;
                    }
                }
                
                int mult1 = mult;
                if (lastPositive != 0 && nextNegative != 0) {
                    mult1 = (mult1 / lastPositive) * nextNegative;
                }
                
                int mult2 = mult;
                if (lastNegative != 0 && nextPositive != 0) {
                    mult2 = (mult2 / lastNegative) * nextPositive;
                }
                
                mult = MAX(mult1, mult2);
            }
        } else {
            mult = 1;
            for (int i = 0; i < count; i++) {
                mult = mult * [[newArray objectAtIndex:i] intValue];
            }
        }
    }
    
    return mult;
}
@end
