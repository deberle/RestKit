//
//  RKSearchWordEntity.m
//  RestKit
//
//  Created by Blake Watters on 7/27/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RKSearchWordEntity.h"

NSString * const RKSearchWordEntityName = @"RKSearchWord";
NSString * const RKSearchWordTokenAttributeName = @"word";
NSString * const RKSearchWordOriginalWordAttributeName = @"originalWord";
NSString * const RKSearchWordRelationCountAttributeName = @"relationCount";

NSString * const RKSearchWordsRelationshipName = @"searchWords";

@implementation RKSearchWordEntity

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setName:RKSearchWordEntityName];
        [self setManagedObjectClassName:RKSearchWordEntityName];
        NSAttributeDescription *tokenAttribute = [[NSAttributeDescription alloc] init];
        [tokenAttribute setName:RKSearchWordTokenAttributeName];
        [tokenAttribute setIndexed:YES];
        [tokenAttribute setAttributeType:NSStringAttributeType];
        NSAttributeDescription *originalWordAttribute = [[NSAttributeDescription alloc] init];
        [originalWordAttribute setName:RKSearchWordOriginalWordAttributeName];
        [originalWordAttribute setIndexed:YES];
        [originalWordAttribute setAttributeType:NSStringAttributeType];
        NSAttributeDescription *relationshipCountAttribute = [[NSAttributeDescription alloc] init];
        [relationshipCountAttribute setName:RKSearchWordRelationCountAttributeName];
        [relationshipCountAttribute setIndexed:YES];
        [relationshipCountAttribute setAttributeType:NSInteger32AttributeType];

        [self setProperties:@[tokenAttribute, originalWordAttribute, relationshipCountAttribute]];
    }

    return self;
}



@end
