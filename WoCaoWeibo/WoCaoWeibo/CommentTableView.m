//
//  CommentTableView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "CommentTableView.h"
#import "CommentCell.h"
#import "CommentModel.h"

@implementation CommentTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark -UITableView delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identify = @"CommentCell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
       
    }
    CommentModel *commentModel =  [self.data  objectAtIndex:indexPath.row];
    cell.commentModel = commentModel;
    
    return cell;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     CommentModel *commentModel =  [self.data  objectAtIndex:indexPath.row];
     float h = [CommentCell getCommentHeight:commentModel];
    return h+40;
}

-(void)tableView:(BaseTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}


@end
