//
//  RKStringTokenizer.m
//  RestKit
//
//  Created by Blake Watters on 7/30/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RKStringTokenizer.h"

@implementation RKStringTokenizer

- (NSSet *)tokenize:(NSString *)string {
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    return [self tokenize:string forLocale:locale foldString:YES];
}

- (NSSet *)tokenize:(NSString *)string forLocale:(NSLocale *)locale foldString:(BOOL)foldString {
    NSMutableSet *tokens = [NSMutableSet set];

    // Conditionally remove diacratics and lowercase our input text
    NSString *tokenizeText = string = (foldString) ? [string stringByFoldingWithOptions:kCFCompareCaseInsensitive|kCFCompareDiacriticInsensitive locale:locale] : string;
    CFStringTokenizerRef tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, (__bridge CFStringRef)tokenizeText, CFRangeMake(0, CFStringGetLength((__bridge CFStringRef)tokenizeText)), kCFStringTokenizerUnitWord, (CFLocaleRef)locale);
    CFStringTokenizerTokenType tokenType = kCFStringTokenizerTokenNone;

    while (kCFStringTokenizerTokenNone != (tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer))) {
        CFRange tokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);

        NSRange range = NSMakeRange(tokenRange.location, tokenRange.length);
        NSString *token = [string substringWithRange:range];

        [tokens addObject:token];
    }

    CFRelease(tokenizer);

    // Remove any stop words
    if (self.stopWords) [tokens minusSet:self.stopWords];

    return tokens;
}

@end
