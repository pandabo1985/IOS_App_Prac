//
//  IconDownloader.m
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "IconDownloader.h"

#define kAppIconHeight 48;

@implementation IconDownloader

@synthesize imgRecord;
@synthesize index;
@synthesize delegate;
@synthesize activeDownload;
@synthesize imageConnection;
@synthesize isFree;

#pragma mark

-(void)dealloc
{
    [imgRecord release];
    [index release];
    [delegate release];
    [activeDownload release];
    [imageConnection release];
    [super dealloc];
}

-(void) startDownload
{
 
    self.activeDownload = [NSMutableData data];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imgRecord.url]] delegate:self];
    self.imageConnection = conn;
    [conn release];
}
-(void) cancelDownload
{
    [self.imageConnection cancel];
    self.imageConnection = nil;
    self.activeDownload = nil;
}

#pragma mark -
#pragma mark Download support (NSURLConnectionDelegate)

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.activeDownload appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.activeDownload = nil;
    self.imageConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [[UIImage alloc] initWithData:self.activeDownload];
    self.imgRecord.img = image;
    [image release];
    if (delegate != nil && self) {
        if ([delegate respondsToSelector:@selector(appImageDidLoad:)]) {
            [delegate appImageDidLoad:self.index];
        }
    }
}



@end
