//
//  RKSearchWord.m
//  RestKit
//
//  Created by Jeff Arena on 3/31/11.
//  Copyright (c) 2009-2012 RestKit. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "RKSearchWord.h"
#import "RKLog.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent RKlcl_cRestKitCoreData

@implementation RKSearchWord

@dynamic word;
@dynamic originalWord;
@dynamic relationCount;


- (void)recalculateRelationCount {
    NSInteger count = 0;
    for (NSString *relationshipName in [[self.entity relationshipsByName] allKeys]) {
        id relatitonShipValue = [self valueForKey:relationshipName];
        count += [relatitonShipValue count];
    }
    self.relationCount = @(count);
}

+ (void) load {
    @autoreleasepool {
        [[NSNotificationCenter defaultCenter] addObserver: (id)[self class]
                                                 selector: @selector(objectContextWillSave:)
                                                     name: NSManagedObjectContextWillSaveNotification
                                                   object: nil];
    }
}

+ (void) objectContextWillSave: (NSNotification*) notification {
    NSManagedObjectContext* context = [notification object];
    NSSet* allModified = [context.insertedObjects setByAddingObjectsFromSet: context.updatedObjects];
    NSPredicate* predicate = [NSPredicate predicateWithFormat: @"self isKindOfClass: %@", self];
    NSSet* modifiable = [allModified filteredSetUsingPredicate: predicate];
    [modifiable makeObjectsPerformSelector: @selector(recalculateRelationCount)];
}

- (id)valueForUndefinedKey:(NSString *)key {
    return [super valueForUndefinedKey:key];
}

- (BOOL)isFavorite {
    return NO;
}

@end
