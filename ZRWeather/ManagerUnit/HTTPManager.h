//
//  HTTPManager.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPManager : NSObject


/**
 GET请求

 @param url URL
 @param parameter 参数
 @param success success
 @param fail fail
 */
+ (void) GET:(NSString *)url
   parameter:(NSDictionary *)parameter
     success:(void(^)(NSURLSessionDataTask * task,id responseObject))success
        fail:(void(^)(NSURLSessionDataTask * task,NSError *error))fail;


/**
 POST请求

 @param url URL
 @param parameter 参数
 @param success 成功回调
 @param fail 失败回调
 */
+ (void) POST:(NSString *)url
    parameter:(NSDictionary *)parameter
      success:(void(^)(NSURLSessionDataTask * task,id responseObject))success
         fail:(void(^)(NSURLSessionDataTask * task,NSError *error))fail;


/**
 *  上传文件
 *
 *  @param url      请求网址路径
 *  @param params   请求参数
 *  @param filedata 文件
 *  @param name     指定参数名
 *  @param filename 文件名（要有后缀名）
 *  @param mimeType 文件类型
 *  @param progress 上传进度
 *  @param success  成功回调
 *  @param fail     失败回调
 */
+(void)uploadWithURL:(NSString *)url
              params:(NSDictionary *)params
            fileData:(NSData *)filedata
                name:(NSString *)name
            fileName:(NSString *)filename
            mimeType:(NSString *) mimeType
            progress:(void (^)(NSProgress *progress))progress
             success:(void (^)(NSURLSessionDataTask * task,id responseObject))success
                fail:(void(^)(NSURLSessionDataTask * task,NSError *error))fail;

@end
