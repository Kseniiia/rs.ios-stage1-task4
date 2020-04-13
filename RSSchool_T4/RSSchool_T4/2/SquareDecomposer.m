#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSMutableArray <NSNumber*>*)decompose:(long)k :(long)r {
    if (r == 0) {
        return [@[[NSNumber numberWithLong:k]] mutableCopy];
    }
    
    for (long i = k - 1; i > 0; i--) {
        long m = r - i * i;
        if (m >= 0) {
            NSMutableArray *array = [self decompose:i :m];
            if (array != nil) {
                [array addObject:[NSNumber numberWithLong:k]];
                return array;
            }
        }
    }
    
    return nil;
}

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    long n = [number longValue];
    
    NSMutableArray *array = [self decompose:n :n * n];
    [array removeLastObject];
    
    return array;
}
@end
