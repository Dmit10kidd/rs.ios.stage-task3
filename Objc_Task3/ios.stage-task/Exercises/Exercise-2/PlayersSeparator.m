#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
        
    if ([ratingArray count] < 3) {
        return 0;
    }
    
    NSMutableArray *firstBuffer;
    NSMutableArray *secondBuffer;
    NSMutableSet *toReturnSet = [NSMutableSet new];
    
    for (int i = 0; i < ratingArray.count - 2; i++) {
        
        firstBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        secondBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        
        for (int j = i+1; j < ratingArray.count; j++) {
            if (firstBuffer.count > 1) {
                [secondBuffer removeLastObject];
            }
            
            if (firstBuffer.count > 1) {
                [secondBuffer removeLastObject];
            }
            
            if ([ratingArray[j] intValue] > [[firstBuffer lastObject] intValue]) {
                [firstBuffer addObject:[ratingArray objectAtIndex:j]];
            } else if ([[ratingArray objectAtIndex:j] intValue] < [[secondBuffer lastObject] intValue]) {
                [secondBuffer addObject:[ratingArray objectAtIndex:j]];
            }
            
            for (int k = j+1; k < ratingArray.count; k++) {
                if ([ratingArray[k] intValue] > [[firstBuffer lastObject] intValue]) {
                    [firstBuffer addObject:[ratingArray objectAtIndex:k]];
                } else if ([[ratingArray objectAtIndex:k] intValue] < [[secondBuffer lastObject] intValue]) {
                    [secondBuffer addObject:[ratingArray objectAtIndex:k]];
                }
                
                if (firstBuffer.count > 2) {
                    [toReturnSet addObject: [[firstBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [firstBuffer removeLastObject];
                }
                
                if (secondBuffer.count > 2) {
                    [toReturnSet addObject: [[secondBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [secondBuffer removeLastObject];
                }
                
            }
            
        }
    }
    return toReturnSet.count;
}


@end
