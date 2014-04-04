//
//  OTRManagedXMPPAccount.m
//  Off the Record
//
//  Created by Christopher Ballinger on 1/10/13.
//  Copyright (c) 2013 Chris Ballinger. All rights reserved.
//
//  This file is part of ChatSecure.
//
//  ChatSecure is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ChatSecure is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ChatSecure.  If not, see <http://www.gnu.org/licenses/>.

#import "OTRManagedXMPPAccount.h"
#import "OTRProtocol.h"
#import "OTRConstants.h"
#import "Strings.h"
#import "OTRXMPPManager.h"
#import "XMPPJID.h"

static NSUInteger const OTRDefaultPortNumber = 5222;

@interface OTRManagedXMPPAccount()
@end


@implementation OTRManagedXMPPAccount

- (void) setDefaultsWithDomain:(NSString *)newDomain {
    //[super setDefaultsWithProtocol:kOTRProtocolTypeXMPP];
    self.domain = newDomain;
    self.port = @(OTRDefaultPortNumber); // Default XMPP port number
    self.resource = [[self class] newResource];  //Default resource chatsecure12345
}

+(NSNumber *)defaultPortNumber {
    return @(OTRDefaultPortNumber);
}

-(NSString *)providerName
{
    return JABBER_STRING;
}

-(OTRAccountType)accountType
{
    return OTRAccountTypeJabber;
}

- (Class)protocolClass {
    return [OTRXMPPManager class];
}

-(NSString *)accountDomain{
    if(!self.domain.length)
    {
        return [XMPPJID jidWithString:self.username].domain;
    }
    return self.domain;
}



@end