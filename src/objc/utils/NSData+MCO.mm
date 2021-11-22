//
//  NSData+MCO.m
//  mailcore2
//
//  Created by DINH Viêt Hoà on 1/21/13.
//  Copyright (c) 2013 MailCore. All rights reserved.
//

#import "NSData+MCO.h"

#include "MCData.h"
#include "MCDataDecoderUtils.h"

@implementation NSData (MCO)

+ (id) mco_objectWithMCObject:(mailcore::Object *)object
{
    return [self mco_dataWithMCData:(mailcore::Data *) object];
}

+ (NSData *) mco_dataWithMCData:(mailcore::Data *)cppData
{
    if (cppData == NULL)
        return nil;
    
    return [NSData dataWithBytes:cppData->bytes() length:cppData->length()];
}

- (mailcore::Data *) mco_mcData
{
    return mailcore::Data::dataWithBytes((const char *) [self bytes], (unsigned int) [self length]);
}

- (NSData *)decodedDataUsingEncoding:(MCOEncoding)encoding remained:(NSData **)remaining
{
    using namespace mailcore;
    Data *cppData = [self mco_mcData];
    Data *cppRemaining = NULL;
    Data *decoded = MCDecodeData(cppData, (Encoding)encoding, true, &cppRemaining);
    if (cppRemaining != NULL) {
        *remaining = [NSData mco_dataWithMCData:cppRemaining];
    }
    return [NSData mco_dataWithMCData:decoded];
}

@end
