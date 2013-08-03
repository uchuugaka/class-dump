//
//  CDClassDump+Extensions.m
//  class-dump
//
//  Created by Damien DeVille on 8/3/13.
//  Copyright (c) 2013 Damien DeVille. All rights reserved.
//

#import "CDClassDump+Extensions.h"

#import "ClassDump-Constants.h"

@implementation CDClassDump (Extensions)

- (BOOL)fmw_loadFile:(CDFile *)file error:(NSError **)errorRef
{
	NSError *error = nil;
	
	BOOL loaded = [self loadFile:file error:&error];
	if (loaded) {
		return YES;
	}
	
	if (errorRef == NULL) {
		return NO;
	}
	
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
	[userInfo setValue:NSLocalizedStringFromTableInBundle(@"There was an unknown error while loading the file", nil, [NSBundle bundleWithIdentifier:CDClassDumpBundleIdentifier], @"CDClassDump+Extensions file loading error description") forKey:NSLocalizedDescriptionKey];
	[userInfo setValue:[error localizedDescription] forKey:NSLocalizedRecoverySuggestionErrorKey];
	*errorRef = [NSError errorWithDomain:CDClassDumpErrorDomain code:CDClassDumpErrorFileLoading userInfo:userInfo];
	
	return NO;
}

@end
