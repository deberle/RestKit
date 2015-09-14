//
//  RKSearchWordEntity.h
//  RestKit
//
//  Created by Blake Watters on 7/27/12.
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

#import <CoreData/CoreData.h>

extern NSString * const RKSearchWordEntityName;
extern NSString * const RKSearchWordTokenAttributeName;
extern NSString * const RKSearchWordOriginalWordAttributeName;
extern NSString * const RKSearchWordsRelationshipName;

/*
 Defines a Core Data entity for representing searchable text content in a managed object model.
 */
@interface RKSearchWordEntity : NSEntityDescription

@end
