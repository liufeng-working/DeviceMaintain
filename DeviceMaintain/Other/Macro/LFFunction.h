//
//  LFFunction.h
//

#ifndef LFFunction_h
#define LFFunction_h

#pragma mark -
#pragma mark - 快速生成cell
/** 快速生成cell */
//@interface
#define LFCell_interface(name) \
+ (instancetype)name##CellWithTableView:(UITableView *)tableView;
//@implementation
#define LFCell_implementation(name, className) \
+ (instancetype)name##CellWithTableView:(UITableView *)tableView \
{ \
NSString *idetifier = LFClassName(className); \
className *cell = [tableView dequeueReusableCellWithIdentifier:idetifier]; \
if (!cell) { \
cell = [[[NSBundle mainBundle] loadNibNamed:idetifier owner:nil options:nil] firstObject]; \
} \
return cell; \
}

#endif /* LFFunction_h */
