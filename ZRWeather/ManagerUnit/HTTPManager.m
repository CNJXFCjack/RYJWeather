//
//  HTTPManager.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "HTTPManager.h"
#import "AFHTTPSessionManager+Singleton.h"

@implementation HTTPManager

+ (void)GET:(NSString *)url
  parameter:(NSDictionary *)parameter
    success:(void (^)(NSURLSessionDataTask *, id))success
       fail:(void (^)(NSURLSessionDataTask *, NSError *))fail{
    [[AFHTTPSessionManager RYJ_shareManager] GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task,error);
        }
    }];
}

+ (void)POST:(NSString *)url
   parameter:(NSDictionary *)parameter
     success:(void (^)(NSURLSessionDataTask *, id))success
        fail:(void (^)(NSURLSessionDataTask *, NSError *))fail{
    [[AFHTTPSessionManager RYJ_shareManager] POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(task,error);
        }
    }];
}

+ (void)uploadWithURL:(NSString *)url params:(NSDictionary *)params fileData:(NSData *)filedata name:(NSString *)name fileName:(NSString *)filename mimeType:(NSString *) mimeType progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask * task,id responseObject))success fail:(void(^)(NSURLSessionDataTask * task,NSError *error))fail{
    
    [[AFHTTPSessionManager RYJ_shareManager] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:filedata name:name fileName:filename mimeType:mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}

@end
