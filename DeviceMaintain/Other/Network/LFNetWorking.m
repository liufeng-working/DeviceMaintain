//
//  LFNetWorking.m
//

#import "LFNetWorking.h"
#import <AFNetworking.h>
#import "LFLoginTool.h"

@implementation LFNetWorking

/**
 *  GET请求获取数据
 *
 *  @param path       请求路径
 *  @param parameters 参数列表
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)GET:(NSString *)path
 parameters:(NSDictionary *)parameters
    success:(void (^)(id result))success
    failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResult:responseObject success:success];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleError:error failure:failure];
    }];
}

/**
 *  POST请求获取数据
 *
 *  @param parameters 参数列表
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)POSTWithParameters:(NSDictionary *)parameters
                   success:(void (^)(id result))success
                   failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:LFLoginTool.getIP parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResult:responseObject success:success];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleError:error failure:failure];
    }];
}

#pragma mark -
#pragma mark - private私有方法
+ (void)handleResult:(NSDictionary *)result
             success:(void (^)(id result))success
{
    [LFNotification hideNotification];
    BOOL isSuccess = [result[@"IsSuccess"] boolValue];
    if (isSuccess) {
        if (success) {
            success(result[@"Value"]);
        }
    }else {
        [LFNotification autoHideWithText:result[@"Extensions"]];
    }
}

+ (void)handleError:(NSError *)error
            failure:(void (^)(NSError *error))failure
{
    [LFNotification hideNotification];
    if (failure) {
        failure(error);
    }else {
        [LFNotification autoHideWithText:@"服务器异常，请稍后再试"];
    }
}

@end
