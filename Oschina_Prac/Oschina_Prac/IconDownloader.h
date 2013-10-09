//
//  IconDownloader.h
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImgRecord.h"
#import "IocnDownloaderDelegate.h"

@interface IconDownloader : NSObject

@property(nonatomic, retain) ImgRecord *imgRecord;
@property (nonatomic, copy) NSString *index;
@property (nonatomic, assign) id<IocnDownloaderDelegate> delegate;
@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *imageConnection;
@property BOOL isFree;

-(void) startDownload;
-(void) cancelDownload;


@end
