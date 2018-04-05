//
//  LFDatePickerViewController.m
//

#import "LFDatePickerViewController.h"

#define lf_datePicker_height ([UIScreen mainScreen].bounds.size.height)
#define lf_datePicker_width ([UIScreen mainScreen].bounds.size.width)
#define lf_datePicker_datePickerViewHeight 250
#define lf_datePicker_eventViewHeight 40
#define lf_datePicker_margin 15
@interface LFDatePickerViewController ()

@property(nonatomic,weak) UIView *shadowView;

@property(nonatomic,weak) UIView *eventView;

@property(nonatomic,weak,readwrite) UIDatePicker *datePicker;

@property(nonatomic,weak) UIButton *sureBtn;

@property(nonatomic,weak) UIButton *cancelBtn;

@property(nonatomic,strong) NSDateFormatter *dateFormatter;

@property(nonatomic, weak) UILabel *titleLabel;

@end

@implementation LFDatePickerViewController

- (UIView *)shadowView
{
    if (!_shadowView) {
        UIView *shadow = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view.superview insertSubview:shadow belowSubview:self.view];
        _shadowView = shadow;
        
        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [shadow addGestureRecognizer:dismissTap];
    }
    return _shadowView;
}

- (UIView *)eventView
{
    if (!_eventView) {
        UIView *event = [[UIView alloc] init];
        event.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:event];
        _eventView = event;
    }
    return _eventView;
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker = [[UIDatePicker alloc] init];
        datePicker.backgroundColor = [UIColor clearColor];
        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        datePicker.minimumDate = [NSDate date];
        [self.view addSubview:datePicker];
        _datePicker = datePicker;
    }
    return _datePicker;
}

- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        cancel.backgroundColor = [UIColor clearColor];
        [cancel setTitle:self.cancelTitle forState:UIControlStateNormal];
        [cancel setTitleColor:self.cancelTitleColor forState:UIControlStateNormal];
        cancel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        [self.eventView addSubview:cancel];
        _cancelBtn = cancel;
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        UIButton *sure = [UIButton buttonWithType:UIButtonTypeCustom];
        sure.backgroundColor = [UIColor clearColor];
        [sure setTitle:self.sureTitle forState:UIControlStateNormal];
        [sure setTitleColor:self.sureTitleColor forState:UIControlStateNormal];
        sure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        [self.eventView addSubview:sure];
        _sureBtn = sure;
    }
    return _sureBtn;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel *titleL = [[UILabel alloc] init];
        titleL.font = [UIFont systemFontOfSize:14];
        titleL.backgroundColor = [UIColor clearColor];
        titleL.text = self.title_;
        titleL.textColor = self.titleColor;
        titleL.userInteractionEnabled = NO;
        titleL.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:titleL];
        _titleLabel = titleL;
    }
    return _titleLabel;
}

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    _dateFormatter.dateFormat = self.dateFormat;
    return _dateFormatter;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cancelTitle = @"取消";
        _cancelTitleColor = UIColor.blackColor;
        _sureTitle = @"确定";
        _sureTitleColor = UIColor.blackColor;
        _title_ = @"";
        _titleColor = [UIColor grayColor];
        _dateFormat = @"yyyy-MM-dd HH:mm";
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.shadowView.alpha = 0;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.shadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.view.frame = CGRectMake(0, lf_datePicker_height - lf_datePicker_datePickerViewHeight, lf_datePicker_width, lf_datePicker_datePickerViewHeight);
    self.eventView.frame = CGRectMake(0, 0, lf_datePicker_width, lf_datePicker_eventViewHeight);
    self.datePicker.frame = CGRectMake(0, lf_datePicker_eventViewHeight, lf_datePicker_width, lf_datePicker_datePickerViewHeight - lf_datePicker_eventViewHeight);[self.cancelBtn sizeToFit];
    self.cancelBtn.frame = CGRectMake(lf_datePicker_margin, 0, CGRectGetWidth(self.cancelBtn.frame), lf_datePicker_eventViewHeight);
    [self.sureBtn sizeToFit];
    self.sureBtn.frame = CGRectMake(lf_datePicker_width - lf_datePicker_margin - CGRectGetWidth(self.sureBtn.frame), 0, CGRectGetWidth(self.sureBtn.frame), lf_datePicker_eventViewHeight);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.cancelBtn.frame) + lf_datePicker_margin, 0, lf_datePicker_width - 4*lf_datePicker_margin - CGRectGetWidth(self.cancelBtn.frame) - CGRectGetWidth(self.sureBtn.frame), lf_datePicker_eventViewHeight);
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelClick
{
    [self dismiss];
    if (self.cancel) {
        self.cancel();
    }
}

- (void)sureClick
{
    [self dismiss];
    if (self.sure) {
        NSDate *date = self.datePicker.date;
        NSString *dateStr = [self.dateFormatter stringFromDate:date];
        NSDate *currentDate = [self.dateFormatter dateFromString:dateStr];
        self.sure(dateStr, currentDate);
    }
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationCustom;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
