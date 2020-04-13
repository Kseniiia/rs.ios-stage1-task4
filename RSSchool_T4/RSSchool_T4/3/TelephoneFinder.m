#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSUInteger len = [number length];
    if (len == 0 || [number characterAtIndex:0] == '-') {
        return nil;
    }
    
    NSArray *array = @[
        @[@"8"],
        @[@"2", @"4"],
        @[@"1", @"3", @"5"],
        @[@"2", @"6"],
        @[@"1", @"5", @"7"],
        @[@"2", @"4", @"6", @"8"],
        @[@"3", @"5", @"9"],
        @[@"4", @"8"],
        @[@"0", @"5", @"7", @"9"],
        @[@"6", @"8"]
    ];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < len; i++) {
        int j = [number characterAtIndex:i] - '0';
        for (int k = 0; k < [array[j] count]; k++) {
            NSString *neighbour = [number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:array[j][k]];
            
            [result addObject:neighbour];
        }
    }
    
    return result;
}
@end
