/*
 * Quake3 -- iOS Port
 *
 * Seth Kingsley, January 2008.
 */

#import	"ios_local.h"

#import	"Quake3AppDelegate.h"

qboolean Sys_LowPhysicalMemory(void)
{
	return qtrue;
}

void Sys_Error(const char *error, ...)
{
	NSString *errorString;
	va_list ap;
	
	va_start(ap, error);
	errorString = [[[NSString alloc] initWithFormat:[NSString stringWithCString:error encoding:NSUTF8StringEncoding]
										  arguments:ap] autorelease];
	va_end(ap);
	
	Quake3AppDelegate* application = (Quake3AppDelegate *)[UIApplication sharedApplication].delegate;
#ifdef IOS_USE_THREADS
	[application performSelectorOnMainThread:@selector(presentErrorMessage:)
								  withObject:errorString
							   waitUntilDone:YES];
#else
	[application presentErrorMessage:errorString];
#endif // IOS_USE_THREADS
}

void Sys_Warn( const char *warning, ...)
{
	NSString *warningString;
	va_list ap;
	
	va_start(ap, warning);
	warningString = [[[NSString alloc] initWithFormat:[NSString stringWithCString:warning encoding:NSUTF8StringEncoding]
											arguments:ap] autorelease];
	va_end(ap);
	Quake3AppDelegate* application = (Quake3AppDelegate *)[UIApplication sharedApplication].delegate;
#ifdef IOS_USE_THREADS
	[application performSelectorOnMainThread:@selector(presentWarningMessage:)
								  withObject:warningString
							   waitUntilDone:YES];
#else
	[application presentWarningMessage:warningString];
#endif // IOS_USE_THREADS
}

int main(int argc, char * argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([Quake3AppDelegate class]));
	}
}

