//
//  OC_Token.m
//  galgas
//
//  Created by Pierre Molinaro on 26/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OC_Token.h"


@implementation OC_Token

- (id) initWithTokenCode: (UInt32) inTokenCode
       range: (NSRange) inRange
       style: (SInt32) inStyle
       matchedTemplateDelimiterIndex: (SInt32) inMatchedTemplateDelimiterIndex {
  self = [super init] ;
  if (self) {
    mTokenCode = inTokenCode ;
    mRange = inRange ;
    mStyle = inStyle ;
    mMatchedTemplateDelimiterIndex = inMatchedTemplateDelimiterIndex ;
  }
  return self ;
}

- (NSUInteger) tokenCode {
  return mTokenCode ;
}

- (NSRange) range {
  return mRange ;
}

- (SInt32) style {
  return mStyle ;
}

- (SInt32) matchedTemplateDelimiterIndex {
  return mMatchedTemplateDelimiterIndex ;
}

- (void) translateRange: (NSInteger) inTranslation {
  if ((inTranslation < 0) && (mRange.location < ((NSUInteger) - inTranslation))) {
    NSLog (@"ERROR in %s : range [%llu %llu], inTranslation %lld",
           __PRETTY_FUNCTION__,
           (UInt64) mRange.location,
           (UInt64) mRange.length,
           (SInt64) inTranslation) ;
  }
  mRange.location += inTranslation ;
}

@end