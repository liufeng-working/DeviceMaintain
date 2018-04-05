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
    if (LFLoginTool.getIP.length <= 0) {
        [LFNotification autoHideWithText:@"请先配置ip地址"];
        return failure([NSError new]);
    }
    
    if (![self handleNoReachable:failure]) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResult:responseObject success:success failure:failure];
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
+ (void)POST:(NSString *)path
  parameters:(NSDictionary *)parameters
     success:(void (^)(id result))success
     failure:(void (^)(NSError *error))failure
{
    if (LFLoginTool.getIP.length <= 0) {
        [LFNotification autoHideWithText:@"请先配置ip地址"];
        return failure([NSError new]);
    }
    
    if (![self handleNoReachable:failure]) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResult:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleError:error failure:failure];
    }];
}

#pragma mark -
#pragma mark - private私有方法
+ (void)handleResult:(NSDictionary *)result
             success:(void (^)(id result))success
             failure:(void (^)(NSError *error))failure
{
    [LFNotification hideNotification];
    BOOL isSuccess = [result[@"IsSuccess"] boolValue];
    if (isSuccess) {
        if (success) {
            success(result[@"Value"]);
        }
    }else {
        if (failure) {
            failure([NSError new]);
        }
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

+ (BOOL)handleNoReachable:(void (^)(NSError *error))failure
{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN || [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi ) {
        return YES;
    }
    
    [LFNotification autoHideWithText:@"请检查网络设置"];
    if (failure) {
        failure(nil);
    }
    return NO;
}

@end
