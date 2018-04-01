//
//  LFNetWorking.h
//

@interface LFNetWorking : NSObject

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
    failure:(void (^)(NSError *error))failure;

/**
 *  POST请求获取数据
 *
 *  @param parameters 参数列表
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)POSTWithParameters:(NSDictionary *)parameters
                   success:(void (^)(id result))success
                   failure:(void (^)(NSError *error))failure;

@end
