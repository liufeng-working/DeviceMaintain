//
//  LFNetWorking.h
//

@interface LFNetWorking : NSObject

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

/**
 *  POST请求上传图片
 *
 *  @param parameters 参数列表
 *  @param images     上传的图片
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)uploadWithParameters:(NSDictionary *)parameters
                      images:(NSArray<UIImage *> *)images
                     success:(void (^)(id result))success
                     failure:(void (^)(NSError *error))failure;

@end
